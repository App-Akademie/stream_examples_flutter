import 'package:flutter/material.dart';
import 'package:tut_stream_examples_flutter/features/songs/data/song_repository.dart';

class SongsScreen extends StatelessWidget {
  final SongRepository songRepository;
  const SongsScreen({super.key, required this.songRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Songs Screen"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: songRepository.playlistStream(),
        builder: (context, snapshot) {
          String displayText;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              displayText = "";
              break;
            case ConnectionState.waiting:
              displayText = "Loading...";
              break;
            case ConnectionState.active:
              displayText = "${snapshot.data?.toString()}";
              break;
            case ConnectionState.done:
              displayText = "Done!";
              break;
          }
          return Center(
            child: _buildColumn(displayText),
          );
        },
      ),
    );
  }

  Widget _buildColumn(String displayText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(displayText),
      ],
    );
  }
}

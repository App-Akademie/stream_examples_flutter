import 'package:tut_stream_examples_flutter/features/songs/domain/song.dart';

class SongRepository {
  Stream<Song> playlistStream() async* {
    await Future.delayed(const Duration(seconds: 3));
    final songs = [
      Song('Bohemian Rhapsody', 'Queen'),
      Song('Stairway to Heaven', 'Led Zeppelin'),
      Song('Hotel California', 'Eagles'),
      Song('Yesterday', 'The Beatles'),
      Song('Smells Like Teen Spirit', 'Nirvana'),
    ];

    for (var song in songs) {
      yield song;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}

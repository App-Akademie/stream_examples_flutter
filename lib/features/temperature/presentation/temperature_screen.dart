import 'package:flutter/material.dart';
import 'package:tut_stream_examples_flutter/features/temperature/data/temperature_repository.dart';

class TemperatureScreen extends StatelessWidget {
  final TemperatureRepository repository;
  const TemperatureScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Screen"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: repository.temperatureStream(),
        builder: (context, snapshot) {
          String displayText;
          if (snapshot.connectionState == ConnectionState.active) {
            displayText = "${snapshot.data?.temperatur}";
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            displayText = "Loading...";
          } else {
            displayText = "";
          }
          return TemperatureDisplay(displayText: displayText);
        },
      ),
    );
  }
}

class TemperatureDisplay extends StatelessWidget {
  const TemperatureDisplay({
    super.key,
    required this.displayText,
  });

  final String displayText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            displayText,
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

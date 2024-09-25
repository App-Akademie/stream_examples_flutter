import 'dart:math';

import 'package:tut_stream_examples_flutter/features/temperature/domain/temperature.dart';

class TemperatureRepository {
  Stream<Temperature> temperatureStream() async* {
    await Future.delayed(const Duration(seconds: 4));
    final random = Random();

    while (true) {
      final temperature = 20 + random.nextDouble() * 10;
      yield Temperature(temperatur: temperature);
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}

import 'dart:math';

import 'package:tut_stream_examples_flutter/features/lottery/domain/lottery_number.dart';

class LotteryRepository {
  Stream<LotteryNumber> lotteryNumberStream() async* {
    await Future.delayed(const Duration(seconds: 3));
    final random = Random();
    const maxNumber = 50;
    const numberOfNumbers = 6;
    final generatedNumbers = <int>{};

    while (generatedNumbers.length < numberOfNumbers) {
      final number = random.nextInt(maxNumber) + 1;
      if (!generatedNumbers.contains(number)) {
        generatedNumbers.add(number);
        await Future.delayed(const Duration(seconds: 1));
        yield LotteryNumber(number);
      }
    }
  }
}

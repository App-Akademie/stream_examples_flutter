import 'dart:math';

import 'package:tut_stream_examples_flutter/features/stock_prices/domain/stock_price.dart';

class StockPriceRepository {
  Stream<StockPrice> stockPriceStream() async* {
    await Future.delayed(const Duration(seconds: 3));
    final symbols = ['AAPL', 'GOOGL', 'MSFT', 'AMZN'];
    final random = Random();

    while (true) {
      final symbol = symbols[random.nextInt(symbols.length)];
      final price = 100 + random.nextDouble() * 50;
      yield StockPrice(symbol, price);
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:tut_stream_examples_flutter/features/stock_prices/data/stock_price_repository.dart';

class StockPriceScreen extends StatelessWidget {
  final StockPriceRepository repository;
  const StockPriceScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Price Screen"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: repository.stockPriceStream(),
        builder: (context, snapshot) {
          String displayText;
          if (snapshot.connectionState == ConnectionState.active) {
            displayText = "${snapshot.data?.toString()}";
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            displayText = "Loading...";
          } else {
            displayText = "";
          }

          return StockPriceDisplay(displayText: displayText);
        },
      ),
    );
  }
}

class StockPriceDisplay extends StatelessWidget {
  const StockPriceDisplay({
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

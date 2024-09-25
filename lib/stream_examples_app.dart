import 'package:flutter/material.dart';
import 'package:tut_stream_examples_flutter/features/lottery/data/lottery_repository.dart';
import 'package:tut_stream_examples_flutter/features/lottery/presentation/lottery_screen.dart';
import 'package:tut_stream_examples_flutter/features/songs/data/song_repository.dart';
import 'package:tut_stream_examples_flutter/features/songs/presentation/songs_screen.dart';
import 'package:tut_stream_examples_flutter/features/stock_prices/data/stock_price_repository.dart';
import 'package:tut_stream_examples_flutter/features/stock_prices/presentation/stock_price_screen.dart';
import 'package:tut_stream_examples_flutter/features/temperature/data/temperature_repository.dart';
import 'package:tut_stream_examples_flutter/features/temperature/presentation/temperature_screen.dart';

class StreamAppExample extends StatelessWidget {
  const StreamAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    final TemperatureRepository temperatureRepository = TemperatureRepository();
    final StockPriceRepository stockPriceRepository = StockPriceRepository();
    final SongRepository songRepository = SongRepository();
    final LotteryRepository lotteryRepository = LotteryRepository();

    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () => pushWidget(
                        TemperatureScreen(repository: temperatureRepository),
                        context),
                    child: const Text('Temperature')),
                OutlinedButton(
                    onPressed: () => pushWidget(
                        StockPriceScreen(repository: stockPriceRepository),
                        context),
                    child: const Text('Stock Price')),
                OutlinedButton(
                    onPressed: () => pushWidget(
                          SongsScreen(songRepository: songRepository),
                          context,
                        ),
                    child: const Text('Songs')),
                OutlinedButton(
                    onPressed: () => pushWidget(
                          LotteryScreen(repository: lotteryRepository),
                          context,
                        ),
                    child: const Text('Lottery Numbers'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pushWidget(Widget nextWidget, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextWidget),
    );
  }
}

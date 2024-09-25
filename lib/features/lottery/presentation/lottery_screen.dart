import 'package:flutter/material.dart';
import 'package:tut_stream_examples_flutter/features/lottery/data/lottery_repository.dart';
import 'package:tut_stream_examples_flutter/features/lottery/domain/lottery_number.dart';

class LotteryScreen extends StatelessWidget {
  final LotteryRepository repository;
  LotteryScreen({super.key, required this.repository});

  final List<int> numbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottery Screen"),
        centerTitle: true,
      ),
      body: StreamBuilder<LotteryNumber>(
        stream: repository.lotteryNumberStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting &&
              snapshot.hasData) {
            numbers.add(snapshot.data!.number);

            return Center(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: numbers
                      .map((number) => NumberItem(number: number))
                      .toList(),
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading..."));
          } else {
            return const Text("Something else");
          }
        },
      ),
    );
  }
}

class NumberItem extends StatelessWidget {
  const NumberItem({
    super.key,
    required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$number',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

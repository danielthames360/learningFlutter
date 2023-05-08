import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 10;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void restart() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          toolbarHeight: 70.0,
          title: const Center(
              child: Text(
            "Counter Screen",
            style: TextStyle(fontSize: 20),
          )),
          elevation: 5.0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Clicks number',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
              Text(
                '$counter',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 35),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActions(
          increaseFn: increase,
          decreaseFn: decrease,
          restartFn: restart,
        ));
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function restartFn;

  const CustomFloatingActions(
      {super.key,
      required this.increaseFn,
      required this.decreaseFn,
      required this.restartFn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            elevation: 10.0,
            backgroundColor: Colors.red.shade400,
            onPressed: () => increaseFn(),
            child: const Icon(Icons.exposure_plus_1)),
        FloatingActionButton(
            elevation: 10.0,
            backgroundColor: Colors.red.shade400,
            onPressed: () => restartFn(),
            child: const Icon(Icons.restore)),
        FloatingActionButton(
            elevation: 10.0,
            backgroundColor: Colors.red.shade400,
            onPressed: () => decreaseFn(),
            child: const Icon(Icons.exposure_minus_1)),
      ],
    );
  }
}

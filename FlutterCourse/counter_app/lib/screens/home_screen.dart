import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 10;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          toolbarHeight: 70.0,
          title: const Center(
              child: Text(
            "My first counter application",
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
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartFloat,
        floatingActionButton: FloatingActionButton(
            tooltip: "Add a number!",
            elevation: 10.0,
            backgroundColor: Colors.red.shade400,
            child: const Icon(Icons.add),
            onPressed: () {
              counter++;
            }));
  }
}

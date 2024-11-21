import 'package:flutter/material.dart';

class Clicker extends StatefulWidget {
  const Clicker({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<Clicker> {
  List<int> numbers = [];

  void onClick() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var number in numbers) Text('$number'),
              IconButton(
                iconSize: 40,
                onPressed: onClick,
                icon: const Icon(Icons.add_box_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
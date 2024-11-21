import 'package:flutter/material.dart';

class Clicker extends StatefulWidget {
  const Clicker({super.key});

  @override
  State<StatefulWidget> createState() => _ClickerState();
}

class _ClickerState extends State<Clicker> {
  List<int> numbers = [];
  bool showTitle = true;

  void onClick() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const ClickerTitle() : const Text('nothing'),
              IconButton(onPressed: toggleTitle, icon: const Icon(Icons.remove_red_eye)),
              IconButton(
                iconSize: 40,
                onPressed: onClick,
                icon: const Icon(Icons.add_box_rounded),
              ),
              for (var number in numbers) Text('$number'),
            ],
          ),
        ),
      ),
    );
  }
}

class ClickerTitle extends StatefulWidget {
  const ClickerTitle({
    super.key,
  });

  @override
  State<ClickerTitle> createState() => _ClickerTitleState();
}

class _ClickerTitleState extends State<ClickerTitle> {

  /* Widget 생성 시 호출 메서드 */
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  /* Widget 소멸 시 호출 메서드 */
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'Click Count',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
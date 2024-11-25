import 'dart:async';

import 'package:flutter/material.dart';

class Pomodor extends StatefulWidget {
  const Pomodor({super.key});

  @override
  State<Pomodor> createState() => _PomodorState();
}

class _PomodorState extends State<Pomodor> {
  static const oneMinute = 60;

  int totalSeconds = oneMinute;
  bool isRunning = false;
  int totalPomodors = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if(totalSeconds == 0) {
      setState(() {
        totalPomodors++;
        isRunning = false;
        totalSeconds = oneMinute;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
        const Duration(seconds: 1),
        onTick
    );
    setState(() {
      isRunning = !isRunning;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = !isRunning;
    });
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = oneMinute;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".")[0].substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Flexible(
            flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 90,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )),
          Flexible(
            flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: Theme.of(context).cardColor,
                    iconSize: 120,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: isRunning ? const Icon(Icons.pause_circle_outline) : const Icon(Icons.play_circle_outline),
                  ),
                  IconButton(
                    color: Theme.of(context).cardColor,
                    iconSize: 80,
                    onPressed: onResetPressed,
                    icon: const Icon(Icons.replay_outlined),
                  ),
                ],
              )),
          Flexible(
            flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pomodors',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).textTheme.displayLarge!.color
                            ),
                          ),
                          Text(
                            '$totalPomodors',
                            style: TextStyle(
                                fontSize: 58,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).textTheme.displayLarge!.color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}

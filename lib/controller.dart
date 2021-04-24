import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Controller {

  ValueNotifier<Duration> useTime = ValueNotifier<Duration>(Duration());
  ValueNotifier<bool> screen = ValueNotifier<bool>(true);
  ValueNotifier<double> progress = ValueNotifier<double>(0);
  DateTime time;
  DateTime stopTime;
  Duration duration = Duration(minutes: 20, seconds: 20);
  void startCount() {
    stopTime = setTime();
    setCounter();
    Timer(duration, () {
      screen.value = false;
    });
  }

  void dispose() {
    screen.dispose();
    useTime.dispose();
  }

  DateTime setTime() {
    time = DateTime.now();
    return time.add(duration);
  }

  void setCounter() async {
    for (int i = 0; i < duration.inSeconds-2; i++) {
      await Future.delayed(Duration(seconds: 1));
      useTime.value = stopTime.difference(DateTime.now());
    }
  }
}

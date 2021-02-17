import 'dart:async';

import 'package:flutter/material.dart';

const CLOCK_INTERVAL = Duration(microseconds: 1000);
const ChineseWeekDays = <int, String>{
  1: '一',
  2: '二',
  3: '三',
  4: '四',
  5: '五',
  6: '六',
  7: '日',
};
String pad0(int num) {
  if (num < 10) {
    return '0${num.toString()}';
  }
  return num.toString();
}

// class ClockBaseStatefulWidget extends StatefulWidget {
//   ClockBaseStatefulWidget({Key key}) : super(key: key);

//   @override
//   ClockBaseState createState() {
//     var state = new ClockBaseState();
//     state.startClock();
//     return state;
//   }
// }

class ClockBaseState<T extends StatefulWidget> extends State {
  ClockBaseState() : super();

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new Text('ClockBaseState is not implemented!');
  }

  startClock() {
    Timer.periodic(CLOCK_INTERVAL, (Timer t) {
      if (!mounted) {
        return;
      }

      setState(() {
        now = DateTime.now();
      });
    });
  }

  Size getDeviceSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}

// ignore: must_be_immutable
class TimerWidget2 extends StatefulWidget {
  String name;
  String title;

  @override
  State<StatefulWidget> createState() {
    var state = new _TimerWidget2State();
    state.startClock();
    return state;
  }
}

class _TimerWidget2State extends ClockBaseState<TimerWidget2> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
            text: " 当前时间：",
            style: TextStyle(
              height: 1.5,
            )),
        TextSpan(
            text:
                "${now.year}-${now.month}-${now.day} ${pad0(now.hour)}:${pad0(now.minute)}:${pad0(now.second)}",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.lightBlue,
              height: 1.5,
            ))
      ]),
    );
  }
}

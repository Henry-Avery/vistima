import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

Map<String, Color> themeColorMap = {
  'default': Color(0xff69b0ae),
  'grey': Colors.grey,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.purple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.orange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};

List<Color> tagColor = [
  Color(0xffd03036),
  Color(0xffa3cbde),
  Color(0xff89ce90),
  Color(0xffc99bd8),
  Color(0xffffabba),
  Color(0xfff9ce6a),
];

Map<String, Color> vColorMap = {
  'icon': Color(0xff8c9eff),
  'mainText': Color(0xff3f51b5),
  'subText': Color(0xff9fa8da),
};

class TimeUtil {
  static bool isInSameDay(DateTime timea, DateTime timeb) {
    return (timea.year * 12 + timea.month == timeb.year * 12 + timeb.month &&
        timea.day == timeb.day);
  }

  static bool isInSameWeek(DateTime timea, DateTime timeb) {
    String _day = formatDate(timeb, ['DD']);
    int dayBefore;

    switch (_day) {
      case 'Monday':
        dayBefore = 0;
        break;
      case 'Tuesday':
        dayBefore = 1;
        break;
      case 'Wednesday':
        dayBefore = 2;
        break;
      case 'Thursday':
        dayBefore = 3;
        break;
      case 'Friday':
        dayBefore = 4;
        break;
      case 'Saturday':
        dayBefore = 5;
        break;
      case 'Sunday':
        dayBefore = 6;
        break;
    }

    for (var i = 0; i <= dayBefore; i++) {
      if (timea.year * 12 + timea.month == timeb.year * 12 + timeb.month &&
          (timea.day - i) == timeb.day) {
        return true;
      }
    }

    return false;
  }

  static bool isInSameMonth(DateTime timea, DateTime timeb) {
    return (timea.year * 12 + timea.month == timeb.year * 12 + timeb.month);
  }

  static String weekDays() {
    String _day = formatDate(DateTime.now(), ['DD']);
    String _weekDay;

    switch (_day) {
      case 'Monday':
        _weekDay = '星期一';
        break;
      case 'Tuesday':
        _weekDay = '星期二';
        break;
      case 'Wednesday':
        _weekDay = '星期三';
        break;
      case 'Thursday':
        _weekDay = '星期四';
        break;
      case 'Friday':
        _weekDay = '星期五';
        break;
      case 'Saturday':
        _weekDay = '星期六';
        break;
      case 'Sunday':
        _weekDay = '星期日';
        break;
    }

    return _weekDay;
  }
}

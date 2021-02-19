import 'dart:async';
import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vistima_00/pages/TimingPage/clock/clock_face.dart';
import 'package:vistima_00/pages/TimingPage/clock/clock_seconds.dart';

class Clock extends StatefulWidget {
  final Size size;
  final Color color;
  final bool isShowText;
  final bool isTiming;
  final int seconds;

  const Clock({
    Key key,
    this.size,
    this.color,
    this.isShowText = true,
    this.isTiming = false,
    this.seconds,
  }) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer _timer;
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    this._timer = Timer.periodic(const Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var faceSize = widget.size.height * .85;
    // print('Clock-----Build');
    return Center(
      child: Container(
        width: faceSize,
        height: faceSize,
        child: Stack(
          children: <Widget>[
            Offstage(
              offstage: !widget.isShowText,
              child: Container(
                alignment: Alignment.center,
                // color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '${formatDate(_dateTime, [HH, ':', nn])}',
                      style: TextStyle(
                          fontFamily: 'Zhanku Wenyi',
                          fontSize: ScreenUtil().setSp(48),
                          color: widget.color),
                      // textAlign: TextAlign.center,
                    ),
                    Text(
                      '${formatDate(_dateTime, [DD])}',
                      style: TextStyle(
                          fontFamily: 'Zhanku Xiaowei',
                          fontSize: ScreenUtil().setSp(18),
                          fontWeight: FontWeight.w500,
                          color: widget.color),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Text(
                      '${formatDate(_dateTime, [yyyy, '-', mm, '-', dd])}',
                      style: TextStyle(
                          fontFamily: 'Zhanku Xiaowei',
                          letterSpacing: 6,
                          fontSize: ScreenUtil().setSp(18),
                          fontWeight: FontWeight.w500,
                          color: widget.color),
                    ),
                  ],
                ),
              ),
            ),

            // Paint the second hand.
            CustomPaint(
              size: Size(faceSize, faceSize),
              painter: ClockSecondsPainter(
                accentColor: widget.color,
                dateTime: _dateTime,
                isTiming: widget.isTiming,
                seconds: widget.seconds,
              ),
            ),

            // Paint the clock face.
            RepaintBoundary(
              key: Key(widget.color.toString()),
              child: CustomPaint(
                size: widget.size,
                painter: ClockFacePainter(
                  accentColor: widget.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

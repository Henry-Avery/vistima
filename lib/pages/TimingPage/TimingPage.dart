import 'dart:io';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vistima_00/const.dart';
import 'package:flutter/material.dart';
import 'package:vistima_00/pages/TimingPage/TimingNotifier.dart';
import 'package:vistima_00/pages/TimingPage/TimingTableWidget.dart';
import 'package:vistima_00/pages/TimingPage/clock/clock.dart';

class TimingPage extends StatefulWidget {
  @override
  _TimingPageState createState() => _TimingPageState();
}

class _TimingPageState extends State<TimingPage> {
  @override
  Widget build(BuildContext context) {
    //*计时状态管理
    final timingNotifier = TimingNotifier();
    timingNotifier.startRecordTime();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          //*底层背景图片与高斯模糊
          Image.asset(
            'assets/images/A2-1.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withAlpha(30),
            ),
          ),
          //*上层界面
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //*状态栏高度
                SizedBox(
                  height: ScreenUtil().setHeight(25),
                ),
                //*AppBar
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: Text(
                            '取消',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Colors.white,
                                letterSpacing: 1.3),
                          ),
                        )),
                  ],
                ),
                //*ClockTable
                ChangeNotifierProvider.value(
                    value: timingNotifier, child: TimingTable()),
                //*暂停与完成按钮
                glassCardWidget(
                  sigma: 10,
                  child: Container(
                    color: Colors.transparent,
                    height: ScreenUtil().setHeight(53),
                    alignment: Alignment.center,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(46),
                              right: ScreenUtil().setWidth(45),
                            ),
                            child: Text(
                              "下次继续",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(1),
                          height: ScreenUtil().setWidth(30),
                          color: Colors.white,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(69),
                              right: ScreenUtil().setWidth(64),
                            ),
                            child: Text(
                              "完成",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //*任务信息栏
                Container(
                  height: ScreenUtil().setHeight(60),
                  width: ScreenUtil().setWidth(218),
                  child: Column(
                    children: [
                      TextField(),
                    ],
                  ),
                ),
                //*Note栏
                glassCardWidget(
                    sigma: 12,
                    child: Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(344),
                      alignment: Alignment.center,
                      child: Text(
                        "Note",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.white),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget glassCardWidget({double sigma, Widget child}) {
    return Card(
      elevation: 0,
      color: Colors.white.withAlpha(24),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: child,
        ),
      ),
    );
  }
}

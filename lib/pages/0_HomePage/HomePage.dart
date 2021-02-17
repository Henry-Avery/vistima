import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vistima_00/const.dart';
import 'package:vistima_00/pages/0_HomePage/TagSheet.dart';
import 'package:vistima_00/pages/0_HomePage/TimerWidget.dart';
import 'package:vistima_00/pages/0_HomePage/TodoSheet.dart';
import 'package:vistima_00/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  var timeymd = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  var timehns = formatDate(DateTime.now(), [HH, ':', nn, ':', ss]);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            //?状态栏背景颜色
            Container(
              height: ScreenUtil().setHeight(25),
              color: Colors.grey[400],
            ),
            //*主页面
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //*P1
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            // color: Colors.red,

                            child: Image.asset("assets/icons/boltfill.png"),
                            width: 34,
                            height: 34,
                          ),
                          Container(
                            child: Text(
                              "快速开始",
                              style: TextStyle(
                                  fontSize: 34,
                                  color: vColorMap['subText'],
                                  fontFamily: textfont),
                            ),
                          ),
                        ],
                      ),
                      TimerWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //*P2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //*Todo
                      Container(width: 230, child: TodoSheet()),
                      SizedBox(
                        width: 10,
                      ),
                      //*Tag
                      Container(
                        width: 122,
                        child: TagSheet(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

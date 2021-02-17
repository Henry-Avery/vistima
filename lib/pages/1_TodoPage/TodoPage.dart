import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vistima_00/const.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final tabs = ['TodoList', '打卡'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Colors.grey[400],
      body: Column(
        children: [
          //?状态栏背景颜色
          Container(
            height: ScreenUtil().setHeight(25),
            color: Colors.grey[400],
          ),
          Container(
              // color: Colors.grey,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: todoPageHeight,
              color: Colors.grey[400],
              child: Text("TodoPage")),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

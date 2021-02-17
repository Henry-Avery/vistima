import 'package:flutter/material.dart';
import 'package:vistima_00/const.dart';

class VBottomAppBar extends StatelessWidget {
  final int pageIndex;
  final Function onTap;
  final iconsMap = {
    "首页": Icons.home,
    "Todo": Icons.done_all,
    "列表": Icons.list,
    "用户": Icons.account_circle,
  };

  VBottomAppBar({this.pageIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1.0,
      // color: Colors.red,
      shape: CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: iconsMap.keys
            .toList()
            .asMap()
            .keys
            .map((e) => _buildChild(e, context))
            .toList()
              ..insertAll(2, [
                SizedBox(
                  width: 30,
                )
              ]),
      ),
    );
  }

  //BottomItem样式
  Widget _buildChild(int e, BuildContext context) {
    bool isActive = (e == pageIndex);
    return Ink(
      height: iconItemHeight,
      width: iconItemWidth,
      decoration: BoxDecoration(
        //设置圆角
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
      ),
      child: InkWell(
        onTap: () => onTap(e),
        borderRadius: BorderRadius.circular(60.0),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              children: [
                Icon(
                  iconsMap[iconsMap.keys.toList()[e]],
                  size: iconSize,
                  color: isActive ? activeColor : normalColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

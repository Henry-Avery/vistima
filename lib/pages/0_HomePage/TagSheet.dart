import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vistima_00/const.dart';
import 'package:vistima_00/model/model.dart';
import 'package:vistima_00/utils.dart';
import 'package:vistima_00/viewmodel/tagViewModel.dart';

class TagSheet extends StatefulWidget {
  @override
  _TagSheetState createState() => _TagSheetState();
}

class _TagSheetState extends State<TagSheet> {
  int tagSelectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //*P1
        Container(
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "标签",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      color: vColorMap['mainText'],
                      fontWeight: FontWeight.w600,
                      fontFamily: textfont),
                ),
              ),
              Expanded(
                child: Container(
                  width: 1,
                ),
              ),
              Container(
                child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/edit.png',
                      width: ScreenUtil().setWidth(28),
                      height: ScreenUtil().setHeight(28),
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 3,
        ),
        //*P2
        Container(
            height: tagSheetHeight,
            alignment: Alignment.topCenter,
            color: greyBG,
            child: Consumer<TagsNotifier>(builder: (context, tagsNotifier, _) {
              List<Tag> tags = tagsNotifier.getTags();
              return ListView.builder(
                padding: EdgeInsets.only(top: 3),
                itemBuilder: (context, index) {
                  return tagCard(tag: tags[index]);
                },
                itemCount: tags.length,
              );
            })),
      ],
    );
  }

  Widget tagCard({Tag tag}) {
    return InkWell(
      onTap: () {
        //*选中事件处理
        // LogUtil.e("tap-${tag.id}");
        setState(() {
          if (tagSelectIndex == tag.id)
            tagSelectIndex = 0;
          else
            tagSelectIndex = tag.id;
        });
      },
      child: Card(
        child: Stack(
          children: [
            Container(
                height: tagCardHeight,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Text(
                  tag.title,
                  style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                )),
            Container(
              height: tagCardHeight,
              color: tagSelectIndex == tag.id
                  ? Colors.grey.withAlpha(150)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
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
                      fontSize: 26,
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
                // width: 28,
                // height: 28,
                child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/edit.png',
                      width: 28,
                      height: 28,
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
            color: Colors.grey[200],
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
    return Container(
      height: tagCardHeight,
      decoration: BoxDecoration(
          color: vColorMap['icon'],
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(width: 1, color: Colors.white)),
      child: Text(tag.title),
    );
  }
}

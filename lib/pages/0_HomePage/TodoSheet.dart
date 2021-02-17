import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vistima_00/const.dart';
import 'package:vistima_00/model/model.dart';
import 'package:vistima_00/utils.dart';
import 'package:vistima_00/viewmodel/tagViewModel.dart';
import 'package:vistima_00/viewmodel/todoViewModel.dart';

class TodoSheet extends StatefulWidget {
  @override
  _TodoSheetState createState() => _TodoSheetState();
}

class _TodoSheetState extends State<TodoSheet> {
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
                  "待办事项",
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
              )),
              Container(
                // width: 28,
                // height: 28,
                child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/名称顺序.png',
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
          width: 235,
          height: todoSheetHeight,
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "正在进行",
                  style: TextStyle(fontSize: 12, fontFamily: textfont),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: todoSheetHeight - 23,
                child: Consumer2<TodosNotifier, TagsNotifier>(
                    builder: (context, todosNotifier, tagsNotifier, _) {
                  List<Todo> todos = todosNotifier.getTodos();
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return todoCard(todo: todos[index]);
                    },
                    itemCount: todos.length,
                  );
                }),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget todoCard({Todo todo}) {
    return Container(
      height: todoCardHeight,
      width: 235,
      decoration: BoxDecoration(
          color: vColorMap['icon'],
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(width: 1, color: Colors.white)),
      child: Text(todo.title),
    );
  }
}

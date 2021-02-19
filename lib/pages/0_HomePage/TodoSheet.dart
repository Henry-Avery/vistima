import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  int todoSelectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //*P1
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "待办事项",
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
              )),
              Container(
                child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/名称顺序.png',
                      width: ScreenUtil().setWidth(28),
                      height: ScreenUtil().setHeight(28),
                    )),
              )
            ],
          ),
        ),
        //*P2
        Container(
          width: todoSheetWidth,
          height: todoSheetHeight,
          color: greyBG,
          child: Container(
            height: todoSheetHeight,
            child:
                Consumer<TodosNotifier>(builder: (context, todosNotifier, _) {
              List<Todo> allTodos = todosNotifier.getTodos();
              List<Todo> todos = allTodos.where((t) => t.type == 0).toList();
              List<Todo> processings =
                  allTodos.where((t) => t.type == 1).toList();

              List<Widget> allList = todoList(todos: processings, type: 1) +
                  todoList(todos: todos);
              return ListView(
                padding: EdgeInsets.only(top: 0),
                children: allList,
              );
            }),
          ),
        ),
      ],
    );
  }

  //* type=1:ProcessingList; type=0:TodoList
  List<Widget> todoList({@required List<Todo> todos, int type = 0}) {
    if (todos.isEmpty) return [Container()];
    return [
      Container(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(8),
          bottom: ScreenUtil().setHeight(8),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(4),
                bottom: ScreenUtil().setHeight(4),
                left: ScreenUtil().setWidth(4),
                right: ScreenUtil().setWidth(4),
              ),
              child: ClipOval(
                  child: Container(
                height: ScreenUtil().setHeight(5),
                width: ScreenUtil().setWidth(5),
                color: vColorMap['processing_todo'],
              )),
            ),
            Text(
              type == 0 ? "待完成" : "正在进行",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(15),
                  // fontFamily: textfont,
                  color: vColorMap['processing_todo']),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(6),
            ),
            Expanded(
                child: Container(
              height: 1,
              color: vColorMap['processing_todo'],
            ))
          ],
        ),
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return todoCard(todo: todos[index]);
        },
        itemCount: todos.length,
      ),
    ];
  }

  Widget todoCard({Todo todo}) {
    return InkWell(
      onTap: () {
        //*选中事件处理
        // LogUtil.e("tap-${todo.id}");
        setState(() {
          if (todoSelectIndex == todo.id)
            todoSelectIndex = 0;
          else
            todoSelectIndex = todo.id;
        });
      },
      child: Card(
        child: Stack(
          children: [
            Container(
              height: todoCardHeight,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(6),
                left: ScreenUtil().setWidth(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                  ),
                  Consumer<TagsNotifier>(builder: (context, tagsNotifier, _) {
                    List<Tag> tags = tagsNotifier.getTags();
                    return Wrap(
                      children: List.generate(
                          todo.tagIds.length,
                          (i) => sizedTagChip(
                                Text(
                                  tags
                                      .firstWhere((t) => t.id == todo.tagIds[i])
                                      .title,
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Colors.white),
                                ),
                              )),
                    );
                  }),
                ],
              ),
            ),
            //*选中样式处理
            Container(
              height: todoCardHeight,
              color: todoSelectIndex == todo.id
                  ? Colors.grey.withAlpha(150)
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget sizedTagChip(Widget text) {
    return Card(
      elevation: 0,
      color: vColorMap['icon'],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))), //设置圆角
      child: Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(2),
            bottom: ScreenUtil().setHeight(2),
            left: ScreenUtil().setWidth(8),
            right: ScreenUtil().setWidth(8)),
        child: text,
      ),
    );
  }
}

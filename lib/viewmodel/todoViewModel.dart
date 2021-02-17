import 'package:flutter/cupertino.dart';
import 'package:vistima_00/model/SQLHelper.dart';
import 'package:vistima_00/model/model.dart';
import 'package:vistima_00/utils.dart';

class TodosNotifier extends ChangeNotifier {
  List<Todo> _todos;

  TodosNotifier({List<Todo> todos}) {
    _todos = todos ?? [];
  }

  //*获取&更新_todos
  Future<void> _refresh() async {
    _todos = await SQLHelper.retrieveTodos();
    notifyListeners();
  }

  //*初始化测试数据
  Future<void> initTest() async {
    await SQLHelper.initialTest();
    await _refresh();
  }

  //*按id获取todo
  Todo todosInId(int id) {
    return _todos.singleWhere((todo) => todo.id == id);
  }

  //*按日期获取todo
  List<Todo> todosInDate(DateTime date) {
    return _todos
        .where((t) => TimeUtil.isInSameDay(t.startTime, date))
        .toList()
        .reversed
        .toList();
  }

  //*按tag获取todo
  List<Todo> todosInTag(int tagId) {
    return _todos
        .where((t) => t.tagIds.contains(tagId))
        .toList()
        .reversed
        .toList();
  }

  //*按type获取todo
  List<Todo> todosInType(Type type) {
    return _todos.where((t) => t.type == type).toList();
  }

  List<Todo> getTodos() => _todos;
}

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vistima_00/model/SQLHelper.dart';
import 'package:vistima_00/pages/SplashPage.dart';
import 'package:vistima_00/viewmodel/tagViewModel.dart';
import 'package:vistima_00/viewmodel/taskViewModel.dart';
import 'package:vistima_00/viewmodel/todoViewModel.dart';

class Config {
  static FutureBuilder init({BuildContext context, Widget child}) {
    return FutureBuilder(
        future: Future.wait([
          SQLHelper.retrieveTasks(),
          SQLHelper.retrieveTodos(),
          SQLHelper.retrieveTags(),
        ]),
        builder: (context, snapshot) {
          LogUtil.e(snapshot.data, tag: 'snapshot');

          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<TasksNotifier>.value(
                    value: TasksNotifier(tasks: snapshot.data[0])),
                ChangeNotifierProvider<TodosNotifier>.value(
                    value: TodosNotifier(todos: snapshot.data[1])),
                ChangeNotifierProvider<TagsNotifier>.value(
                    value: TagsNotifier(tags: snapshot.data[2])),
              ],
              child: Consumer3<TagsNotifier, TodosNotifier, TasksNotifier>(
                builder:
                    (context, tagsNotifier, todosNotifier, tasksNotifier, _) {
                  return child;
                },
              ),
            );
          } else {
            return SplashPage();
          }
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:vistima_00/model/SQLHelper.dart';
import 'package:vistima_00/model/model.dart';

class TagsNotifier extends ChangeNotifier {
  List<Tag> _tags;

  TagsNotifier({List<Tag> tags}) {
    _tags = tags ?? [];
  }

  //*获取&更新_tags
  Future<void> _refresh() async {
    _tags = await SQLHelper.retrieveTags();
    notifyListeners();
  }

  //*初始化测试数据
  Future<void> initTest() async {
    await SQLHelper.initialTest();
    await _refresh();
  }

  //*按id获取tag
  Tag tagsInId(int id) {
    return _tags.singleWhere((tag) => tag.id == id);
  }

  List<Tag> getTags() => _tags;
}

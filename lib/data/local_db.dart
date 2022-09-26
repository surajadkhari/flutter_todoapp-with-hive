import 'package:hive_flutter/adapters.dart';

import '../model/task_model.dart';

class LocalDb {
  List<TaskModel> toDoList = [];
  //reference our box
  final _myBox = Hive.box("mybox");

  void createinitalData() {
    toDoList = [
      TaskModel(
        taskName: "Todo app",
      ),
      TaskModel(
        taskName: "Add to cart",
      ),
      TaskModel(taskName: "E-commerce ", isTaskCompleted: true)
    ];
  }

  //load data from  Db
  void loadData() {
    toDoList = _myBox.get("taskList");
  }

  //update
  void updateData() {
    _myBox.put("taskList", toDoList);
  }
}

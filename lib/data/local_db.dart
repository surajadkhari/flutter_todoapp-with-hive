import 'package:hive_flutter/adapters.dart';

import '../model/task_model.dart';

class LocalDb {
  List<TaskModel> toDoList = [
    TaskModel(
      taskName: "Todo app",
    ),
    TaskModel(
      taskName: "Add to cart",
    ),
    TaskModel(taskName: "E-commerce ", isTaskCompleted: true)
  ];
  //reference our box
  final _myBox = Hive.openBox("taskLocalDb");
}

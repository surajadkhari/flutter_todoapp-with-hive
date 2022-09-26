import 'package:hive_flutter/adapters.dart';

class TaskModel extends HiveObject {
  final String taskName;
  bool isTaskCompleted;
  TaskModel({required this.taskName, this.isTaskCompleted = false});
}

List<TaskModel> toDoList = [
  TaskModel(
    taskName: "Todo app",
  ),
  TaskModel(
    taskName: "Add to cart",
  ),
  TaskModel(taskName: "E-commerce ", isTaskCompleted: true)
];

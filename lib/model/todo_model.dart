import 'package:hive_flutter/adapters.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel  {
  @HiveField(0)
  final String taskName;
  @HiveField(1)
  bool isTaskCompleted;
  TodoModel({required this.taskName, this.isTaskCompleted = false});
}

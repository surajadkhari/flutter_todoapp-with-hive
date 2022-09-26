import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0,defaultValue: 0)
  final String taskName;
   @HiveField(1)
  bool isTaskCompleted;
  TaskModel({required this.taskName, this.isTaskCompleted = false});
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskModel {
  final String taskName;
  bool isTaskCompleted;
  TaskModel({required this.taskName, this.isTaskCompleted = false});
}


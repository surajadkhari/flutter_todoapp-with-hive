import 'package:flutter/material.dart';
import 'package:todo_app_with_hive/app/common/todo_card.dart';
import 'package:todo_app_with_hive/model/task_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TaskModel> toDoList = [
    TaskModel(
      taskName: "Hlelo",
    ),
    TaskModel(
      taskName: "Hlelo",
    ),
  ];
  void checkBoxChanged({required bool value, required int index}) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TO DO",
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => TodoCard(
            isTaskcompleted: toDoList[index].isTaskCompleted,
            onChanged: (value) => checkBoxChanged(
                index: index, value: toDoList[index].isTaskCompleted),
            taskName: toDoList[index].taskName),
      ),
    );
  }
}

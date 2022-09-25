import 'package:flutter/material.dart';
import 'package:todo_app_with_hive/model/task_model.dart';

import 'app/common/task_alertdialog.dart';
import 'app/common/todo_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSave = false;
  void checkBoxChanged({required bool value, required int index}) {
    setState(() {
      toDoList[index].isTaskCompleted = !toDoList[index].isTaskCompleted;
    });
  }

  TextEditingController taskEditingController = TextEditingController();

  void addedNewTask() {
    TaskModel newTask =
        TaskModel(taskName: taskEditingController.text, isTaskCompleted: false);

    setState(() {
      toDoList.add(newTask);
      isSave = true;
    });

    Navigator.pop(context);
    taskEditingController.clear();
  }

  void creatNewTask() {
    showDialog(
        context: context,
        builder: (context) => TaskAlertDialog(
            textEditingController: taskEditingController,
            onCancel: () => Navigator.pop(context),
            onSave: addedNewTask));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: const Icon(Icons.add),
      ),
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

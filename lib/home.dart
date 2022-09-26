import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app_with_hive/model/task_model.dart';

import 'app/common/task_alertdialog.dart';
import 'app/common/todo_card.dart';
import 'data/local_db.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _myBox.get("taskList") == null
        ? localDb.createinitalData()
        : localDb.loadData();
    super.initState();
  }

  //reference hive box
  final _myBox = Hive.box("mybox");

  LocalDb localDb = LocalDb();
  bool isSave = false;
  TextEditingController taskEditingController = TextEditingController();

  void checkBoxChanged({required bool value, required int index}) {
    setState(() {
      localDb.toDoList[index].isTaskCompleted =
          !localDb.toDoList[index].isTaskCompleted;
    });
    localDb.updateData();
  }

//add new Task
  void addedNewTask() {
    TaskModel newTask =
        TaskModel(taskName: taskEditingController.text, isTaskCompleted: false);
    setState(() {
      localDb.toDoList.add(newTask);
      taskEditingController.clear();
    });

    Navigator.pop(context);
    localDb.updateData();
  }

  //delete task
  void deleteTask({required int index}) {
    setState(() {
      localDb.toDoList.removeAt(index);
    }); 
    localDb.updateData();
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
          itemCount: localDb.toDoList.length,
          itemBuilder: (context, index) {
            return TodoCard(
                deleteFunction: (context) => deleteTask(index: index),
                isTaskcompleted: localDb.toDoList[index].isTaskCompleted,
                onChanged: (value) => checkBoxChanged(
                    index: index,
                    value: localDb.toDoList[index].isTaskCompleted),
                taskName: localDb.toDoList[index].taskName);
          }),
    );
  }
}

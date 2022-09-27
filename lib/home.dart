import 'package:flutter/material.dart';
import 'package:todo_app_with_hive/model/task_model.dart';
import 'common/task_alertdialog.dart';
import 'common/todo_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSave = false;
  TextEditingController taskEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void checkBoxChanged({required bool value, required int index}) {
    setState(() {
      toDoList[index].isTaskCompleted = !toDoList[index].isTaskCompleted;
    });
  }

//add new Task
  void addedNewTask() {
    TaskModel newTask =
        TaskModel(taskName: taskEditingController.text, isTaskCompleted: false);
    setState(() {
      if (_formKey.currentState!.validate()) {
        toDoList.add(newTask);
        Navigator.pop(context);
      }
      taskEditingController.clear();
    });
  }

  //delete task
  void deleteTask({required int index}) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void creatNewTask() {
    showDialog(
        context: context,
        builder: (context) => Form(
              key: _formKey,
              child: TaskAlertDialog(
                  textEditingController: taskEditingController,
                  onCancel: () => Navigator.pop(context),
                  onSave: addedNewTask),
            ));
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
          itemBuilder: (context, index) {
            return TodoCard(
                deleteFunction: (context) => deleteTask(index: index),
                isTaskcompleted: toDoList[index].isTaskCompleted,
                onChanged: (value) => checkBoxChanged(
                    index: index, value: toDoList[index].isTaskCompleted),
                taskName: toDoList[index].taskName);
          }),
    );
  }
}

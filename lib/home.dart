import 'package:flutter/material.dart';
import 'package:todo_app_with_hive/model/task_model.dart';

import 'app/common/todo_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSave = false;
  List toDoList = [
    TaskModel(
      taskName: "Hlelo",
    ),
    TaskModel(
      taskName: "Yogo",
    ),
    TaskModel(taskName: "learn new Flutter Widget", isTaskCompleted: true)
  ];

  void checkBoxChanged({required bool value, required int index}) {
    setState(() {
      toDoList[index].isTaskCompleted = !toDoList[index].isTaskCompleted;
    });
  }

  TextEditingController taskEditingController = TextEditingController();

  creatNewTask() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 105,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: taskEditingController,
                decoration: const InputDecoration(
                    hintText: "Add new Task",
                    border: InputBorder.none,
                    fillColor: Color(0xffF6F6F6),
                    filled: true),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () async {
                        TaskModel newTask = TaskModel(
                            taskName: taskEditingController.text,
                            isTaskCompleted: false);

                        setState(() {
                          toDoList.add(newTask);
                          isSave = true;
                        });

                        Navigator.pop(context);
                        taskEditingController.clear();
                      },
                      child: const Text("Save")),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("Cancel"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
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
        itemBuilder: (context, index) =>
            //  Container(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            //       margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
            //       decoration: const BoxDecoration(color: Colors.white),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             toDoList[index].taskName,
            //             style: TextStyle(
            //                 decoration: toDoList[index].isTaskCompleted
            //                     ? TextDecoration.lineThrough
            //                     : TextDecoration.none),
            //           ),
            //           Checkbox(
            //               value: toDoList[index].isTaskCompleted,
            //               onChanged: (value) => changeCheckButton(index: index))
            //         ],
            //       ),
            //     )
            TodoCard(
                isTaskcompleted: toDoList[index].isTaskCompleted,
                onChanged: (value) => checkBoxChanged(
                    index: index, value: toDoList[index].isTaskCompleted),
                taskName: toDoList[index].taskName),
      ),
    );
  }
}

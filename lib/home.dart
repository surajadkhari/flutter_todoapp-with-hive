import 'package:flutter/material.dart';
import 'package:todo_app_with_hive/model/task_model.dart';

import 'app/common/todo_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  void changeCheckButton({required int index}) {
    setState(() {
      toDoList[index].isTaskCompleted = !toDoList[index].isTaskCompleted;
    });
  }

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

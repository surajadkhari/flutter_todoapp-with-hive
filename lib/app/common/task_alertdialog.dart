import 'package:flutter/material.dart';

class TaskAlertDialog extends StatelessWidget {
  const TaskAlertDialog({
    super.key,
    required this.textEditingController,
    required this.onSave,
    required this.onCancel
  });
  final TextEditingController textEditingController;
  final VoidCallback onSave;
    final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: textEditingController,
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: onSave,
                    //  () async {
                    //   TaskModel newTask = TaskModel(
                    //       taskName: taskEditingController.text,
                    //       isTaskCompleted: false);

                    //   setState(() {
                    //     toDoList.add(newTask);
                    //     isSave = true;
                    //   });

                    //   Navigator.pop(context);
                    //   taskEditingController.clear();
                    // },
                    child: const Text("Save")),
                ElevatedButton(
                  onPressed: onCancel,
                  
                  
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Cancel"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

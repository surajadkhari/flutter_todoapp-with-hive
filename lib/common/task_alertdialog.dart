import 'package:flutter/material.dart';

class TaskAlertDialog extends StatelessWidget {
  const TaskAlertDialog({
    super.key,
    required this.textEditingController,
    required this.onSave,
    required this.onCancel,
  });
  final TextEditingController textEditingController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 128,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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

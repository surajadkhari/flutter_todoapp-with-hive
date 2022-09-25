import 'package:flutter/material.dart';

class TaskAlertDialog extends StatelessWidget {
  const TaskAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
      ),
    );
  }
}

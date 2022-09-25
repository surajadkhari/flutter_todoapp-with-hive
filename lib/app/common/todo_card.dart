import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final bool isTaskcompleted;
  final String taskName;
  final Function(bool?)? onChanged;
  const TodoCard(
      {Key? key,
      required this.isTaskcompleted,
      required this.onChanged,
      required this.taskName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Checkbox(value: isTaskcompleted, onChanged: onChanged),
          Text(taskName),
        ],
      ),
    );
  }
}
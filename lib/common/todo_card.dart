import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCard extends StatelessWidget {
  final bool isTaskcompleted;
  final String taskName;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  const TodoCard(
      {Key? key,
      required this.isTaskcompleted,
      required this.onChanged,
      required this.taskName,
      required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isTaskcompleted == true
        ? Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 14),
            child: Slidable(
              enabled: true,
              endActionPane:
                  ActionPane(motion: const StretchMotion(), children: [
                SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Colors.red,
                ),
              ]),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Checkbox(
                      value: isTaskcompleted,
                      onChanged: onChanged,
                      activeColor: Colors.green,
                    ),
                    Text(
                      taskName,
                      style: TextStyle(
                          decoration: isTaskcompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    )
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 14),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Checkbox(
                    value: isTaskcompleted,
                    onChanged: onChanged,
                    activeColor: Colors.green,
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                        decoration: isTaskcompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              ),
            ),
          );
  }
}

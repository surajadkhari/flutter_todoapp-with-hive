import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_with_hive/common/todo_card.dart';

import 'model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<TodoModel> todosBox;
  late TextEditingController textEditingController;

  @override
  void dispose() {
    // remove the deleted index holes/slots from database
    // to free up the space
    todosBox.compact();

    todosBox.close();
    super.dispose();
    super.dispose();
  }

  @override
  void initState() {
    textEditingController = TextEditingController();
    todosBox = Hive.box("TODOs");
    super.initState();
  }

  _simpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('New TODO Task'),
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'TODO Task',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              TodoModel todoModel = TodoModel(
                                  taskName: textEditingController.text);
                              todosBox.add(todoModel);
                              // _task = Task(task: inputTask);
                              // _addTodo(_task);
                              Navigator.pop(context);
                            },
                            child: const Text('Add'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _simpleDialog(),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text(
            "TO DO",
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box<TodoModel>('TODOs').listenable(),
          builder: (context, Box<TodoModel> tasks, child) {
            todosBox = tasks;
            return ListView.builder(
                itemCount: tasks.values.length,
                itemBuilder: (context, index) {
                  final todo = todosBox.getAt(index);
                  return TodoCard(
                      isTaskcompleted: todo!.isTaskCompleted,
                      onChanged: (value) {
                        setState(() {
                          todo.isTaskCompleted = !todo.isTaskCompleted;
                        });
                      },
                      taskName: todo.taskName,
                      deleteFunction: (context) => todosBox.deleteAt(index));
                });
          },
        ));
  }
}

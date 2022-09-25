import 'package:flutter/material.dart';

import 'app/common/todo_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TO DO",
        ),
      ),
      body: ListView(
        children: [
          TodoCard(
            isTaskcompleted: true,
            onChanged: (value) {},
            taskName: "Hllp",
          ),
          TodoCard(
            isTaskcompleted: true,
            onChanged: (value) {},
            taskName: "Flutter Everday",
          )
        ],
      ),
    );
  }
}

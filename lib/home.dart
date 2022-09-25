import 'package:flutter/material.dart';

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
          Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child:
                // CheckboxListTile(
                //   onChanged: (value) {},
                //   value: true,
                //   title: const Text("Learn flutter everyday"),
                // )
                Row(
              children: const [Text("Hello")],
            ),
          )
        ],
      ),
    );
  }
}

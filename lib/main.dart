import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo_app_with_hive/model/todo_model.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final applicatonDocumentDir =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(applicatonDocumentDir.path);
  Hive.registerAdapter(TodoModelAdapter());
  var box = await Hive.openBox<TodoModel>("TODOs");
  runApp(const App());
}

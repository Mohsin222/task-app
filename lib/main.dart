import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_task_app/model/task_model.dart';
import 'package:todo_task_app/provider/home_provider.dart';
import 'package:todo_task_app/views/home_page.dart';

Future<void> main()async {
    WidgetsFlutterBinding.ensureInitialized();
      await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>('tasks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
           ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
      
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}


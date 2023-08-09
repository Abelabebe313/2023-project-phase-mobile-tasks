import 'package:flutter/material.dart';
import 'package:to_do_app/features/TODO%20app/presentation/widgets/TaskDetail.dart';
import 'package:to_do_app/features/TODO%20app/presentation/widgets/createTask.dart';
import 'package:to_do_app/features/TODO%20app/presentation/widgets/home.dart';
import 'package:to_do_app/features/TODO%20app/presentation/widgets/starter.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // '/home': (context) => Home(),
        // '/create': (context) => CreateTask(),
        // '/detail': (context) => TaskDetail(),
      },
      home: Starter(),
    );
  }
}

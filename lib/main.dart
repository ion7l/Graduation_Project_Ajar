import 'package:flutter/material.dart';
import 'package:graduation_project/Keys/Login.dart';
import 'package:graduation_project/Keys/Sinup.dart';
import 'Start/start.dart';

import 'Start/startUo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartUp(),
      routes: {
        "start" : (context) => Start(),
        "login" : (context) => Login(),
        "sinup" : (context) => Sinup(), 
      },
    );
  }
}

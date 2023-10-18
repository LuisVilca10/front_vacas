import 'package:flutter/material.dart';
import 'package:vacas_front/ui/login/welcome.dart';

//const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

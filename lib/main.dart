import 'package:flutter/material.dart';
import 'package:vacas_front/ui/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:vacas_front/ui/login/login.dart';

//const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinkaRED',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black87),
        canvasColor: Color.fromARGB(217, 217, 217, 217),
      ),
      home: Dashboard(),
    );
  }
}

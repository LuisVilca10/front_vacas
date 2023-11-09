import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vacaspruebas/login/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacaspruebas/theme/AppTheme.dart';
import 'firebase_options.dart';

bool shouldUseFirestoreEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8083);
  }
=======
import 'package:vacas_front/ui/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacas_front/ui/email_login_page.dart';
//import 'package:vacas_front/ui/login/login.dart';

//const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() async {
>>>>>>> 6fac0a550ff4b02b5324cf66f8273fedcd064f7c
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FinkaRED",
      theme: AppTheme.themeData.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: MainLogin(),
=======
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
      home: EmailLoginPage(),
>>>>>>> 6fac0a550ff4b02b5324cf66f8273fedcd064f7c
    );
  }
}

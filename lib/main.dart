// In this Project we used Inherited Widget State Management

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmacyapp/pages/splash_scrren.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();          // to check cooncetion is happen or not in app starting

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen()
        );
  }
}

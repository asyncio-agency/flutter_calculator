import 'package:flutter/material.dart';
import 'package:smart_calculator/app/screens/home_screen.dart';
import 'package:smart_calculator/app/screens/calculator/main_screen.dart';
import 'package:smart_calculator/app/screens/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jzano Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainScreen(title: 'Jzano Calculator'),
    );
  }
}
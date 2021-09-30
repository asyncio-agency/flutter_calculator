import 'package:flutter/material.dart';
import 'package:smart_calculator/routes.dart';

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

      initialRoute: '/',
      routes: customRoutes,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_calculator/app/screens/splash_screen.dart';
import 'package:smart_calculator/app/screens/calculator/main_screen.dart';
import 'package:smart_calculator/app/screens/expenses/expenses_screen.dart';
import 'package:smart_calculator/app/screens/expenses/expenses_add_screen.dart';
import 'package:smart_calculator/app/screens/expenses/expenses_screen.dart';
import 'package:smart_calculator/app/screens/home_screen.dart';
import 'package:smart_calculator/app/screens/calculator/main_screen.dart';




var customRoutes = <String, WidgetBuilder>{
  '/': (context) => const MainScreen(title: "Ma calculatrice"),
  '/splash': (context) => const SplashScreen(title: "Splash"),
  '/expenses': (context) => const ExpensesScreen(),
  '/expenses-add': (context) => const ExpenseAddScreen(),
};

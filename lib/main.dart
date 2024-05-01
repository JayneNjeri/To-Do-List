// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_list/pages/signup.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Apply a background color to all pages
        scaffoldBackgroundColor: Color.fromARGB(255, 1, 21, 37),
        // Apply a background color to all floating action buttons
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 121, 170, 210),
        ),
        // Apply a text style to be white
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          // Add other text styles if needed
        ),
        // Apply a color to all buttons
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromARGB(255, 11, 46, 74),
        ),
      ),
      home: SignUp(),
    );
  }
}

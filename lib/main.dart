// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Authenticate/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Authenticate/authentication.dart';
import 'Authenticate/wrapper.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
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
        home: Wrapper(),
      ),
    );
  }
}

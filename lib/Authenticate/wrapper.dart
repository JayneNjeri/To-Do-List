import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Authenticate/signup.dart';
import 'package:to_do_list/Authenticate/user.dart';
import 'package:to_do_list/pages/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    //return either home or authenticate widget
    if (user == null) {
      return const SignUp();
    } else {
      return const HomePage();
    }
  }
}

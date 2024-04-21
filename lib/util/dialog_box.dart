// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:to_do_list/util/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSaved,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 11, 46, 74),
        title: const Text("Add a new task"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        content: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //get user input
              TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter Task Name",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              //buttons ie add and cancel
              Row(
                children: [
                  //save buton
                  MyButton(text: "Save", onPressed: onSaved),
                  const SizedBox(width: 50),

                  //cancel button
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              )
            ],
          ),
        ));
  }
}

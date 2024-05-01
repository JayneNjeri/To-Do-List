// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_list/util/dialog_box.dart';
import 'package:to_do_list/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List toDoList = [
    ["Drink Water", false],
    ["Take a walk", false]
  ];

  //text editing controller
  final _controller = TextEditingController();

  //cheking if the checkbox is checked or not
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save the task
  void saveTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create a function to add a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSaved: saveTask,
              onCancel: () {
                Navigator.of(context).pop();
              });
        });
  }

  //delete a task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 21, 37),
        appBar: AppBar(
          title: Text('To Do List'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 1, 21, 37),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          backgroundColor: const Color.fromARGB(255, 121, 170, 210),
          child: Icon(Icons.add, color: Colors.black),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ToDoTile(
                  taskName: toDoList[index][0],
                  isChecked: toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: () => deleteTask(index),
                ),
              ],
            );
          },
        ));
  }
}

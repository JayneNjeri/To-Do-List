// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/my_database.dart';
import 'package:to_do_list/util/dialog_box.dart';
import 'package:to_do_list/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
//referencing the box
  // ignore: unused_field
  final _myBox = Hive.openBox("toDoList");
  ToDoDatabase db = ToDoDatabase();

  //text editing controller
  final _controller = TextEditingController();

  //cheking if the checkbox is checked or not
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //save the task
  void saveTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
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
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('To Do List'),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey[800],
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ToDoTile(
                  taskName: db.toDoList[index][0],
                  isChecked: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: () => deleteTask(index),
                ),
              ],
            );
          },
        ));
  }
}

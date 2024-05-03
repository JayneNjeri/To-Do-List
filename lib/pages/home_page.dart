// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/util/dialog_box.dart';
import 'package:to_do_list/util/to_do_tile.dart';

import 'notifications.dart';
import 'profile.dart';
import 'support.dart';
import 'theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //final scaffoldkey = GlobalKey<ScaffoldState>();
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
        drawer: Drawer(
          child: Material(
            elevation: 0.0,
            color: Color.fromARGB(255, 11, 46, 74),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/R.jpeg'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sherryl Mwangi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'test123@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.notifications_active_outlined,
                      color: Colors.white),
                  title: Text(
                    'Manage Notifications',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  //close the drawer before
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationsPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_outlined, color: Colors.white),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Icon(Icons.color_lens_outlined,
                            color: Colors.white),
                        title: Text(
                          'Dark Mode',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Color.fromARGB(255, 121, 170, 210),
                    ),
                  ],
                ),
                ListTile(
                  leading:
                      Icon(Icons.help_center_outlined, color: Colors.white),
                  title: Text(
                    'Help & Support',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    MaterialPageRoute(builder: (context) => SupportPage());
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.logout_outlined,
                      color: const Color.fromARGB(255, 232, 37, 23)),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 232, 37, 23),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
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

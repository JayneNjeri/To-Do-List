// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:to_do_list/util/dialog_box.dart';
import 'package:to_do_list/util/to_do_tile.dart';
import 'edit_profile.dart';
import '../notifications.dart';
import 'support.dart';

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
              padding: EdgeInsets.all(8),
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        const Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/R.jpeg'),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 99,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(Icons.edit,
                                  color: Colors.black, size: 20),
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sherryl Mwangi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('test123@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: 200,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                          },
                          // ignore: sort_child_properties_last
                          child: const Text('Edit Profile',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 11, 46, 74)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading:
                      Icon(Icons.notifications_outlined, color: Colors.white),
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
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
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

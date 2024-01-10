// ignore_for_file: prefer_const_constructors, must_be_immutable

import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  Function(bool?)? onChanged;
  Function()? deleteFunction;

  //we are creating the constructors for the above functions and variable created
  //a constructor(more like a blueprint) is a function used to initialize the instance variable of a class
  //the constructor is called when an object of the class is created

  ToDoTile({
    super.key,
    required this.taskName,
    required this.isChecked,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => deleteFunction!(),
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 71, 6, 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              //Checkbox
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //Task Name
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.black,
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}

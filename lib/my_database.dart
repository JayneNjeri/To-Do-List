import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //reference the box
  final _myBox = Hive.openBox("toDoList");

  //run this data anytime the user clicks on the app
  void createInitData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Drink Water", false],
    ];
  }

  //get the data from the box
  Future<void> loadData() async {
    toDoList = await _myBox.then((box) => box.get("TODOList"));
  }

  //Update the database
  Future<void> updateData() async {
    await _myBox.then((box) {
      box.put("TODOList", toDoList);
    });
  }
}

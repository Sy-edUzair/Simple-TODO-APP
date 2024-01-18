import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  //referecne our box
  final _mybox = Hive.box('todobox');

  //run this method if this is the first time ever openeing this app
  void createInitialData() {
    toDoList = [
      ["Do Dishes", false],
      ["Fold Laundry", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _mybox.get(
        "TODOLIST"); //HIVE works on a key value pair basis so our key is "TODOLIST" and it will fetch our todolist for us
  }

  //update the database
  void updateDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}

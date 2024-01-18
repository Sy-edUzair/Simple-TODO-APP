// ignore_for_file: prefer_const_constructors

//In Flutter, the context refers to the location of a widget in the widget tree. It provides information about the surrounding environment and services that the widget might need. For example, the context can contain information such as the theme of the app, the locale, the screen size, and more.

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utilities/dialog_box.dart';
import 'package:to_do_app/utilities/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference to hive box
  final _myBox = Hive.box('todobox');

  ToDoDataBase db = ToDoDataBase(); //object of the tododatabase class
  @override
  void initState() {
    //if this is the first time ever opening the app,then create the default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //if there already exists data
      db.loadData();
    }
    super.initState();
  }

  //text Controller
  final _textController = TextEditingController();
  //list of todo tasks

  void checkboxchange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_textController.text, false]);
      _textController.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

//create a new Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textController: _textController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),

          ///removes the dialog box from screen
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      appBar: AppBar(
        centerTitle: true, //this should always come before the title
        title: Text(
          'TO DO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.green.shade300,
        elevation: 5.0,
        shadowColor: Colors.green.shade900,
      ),
      //LISTVIEW.BUILDER IS used to create dynamic lists(we cann add and remove etc.) while LISTVIEW is used to create static lists
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoObject(
            TaskName: db.toDoList[index][0], //take name of a specific index
            TaskCompleted: db.toDoList[index]
                [1], //take bool value of checkbox of a specific index,
            onChange: (value) => checkboxchange(value, index),
            deleteFunc: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: //to add new task
          FloatingActionButton(
        backgroundColor: Colors.green.shade300,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}

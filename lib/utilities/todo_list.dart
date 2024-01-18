// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable, prefer_const_literals_to_create_immutables

//when we close and then open our app, all of our tasks have disappeared so we link our app with hive local database to save our data on the phone

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoObject extends StatelessWidget {
  final String TaskName;
  final bool TaskCompleted;
  Function(bool?)?
      onChange; // dynamic function declaration(basically the TYPE of fucntion they require in 'CheckBox')
  Function(BuildContext context)? deleteFunc;

  ToDoObject(
      {super.key,
      required this.TaskName,
      required this.TaskCompleted,
      required this.onChange,
      required this.deleteFunc}); //creating constructor for above mentioned variables and methods

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunc,
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 249, 46, 32),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(18),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: TaskCompleted,
                onChanged: onChange,
                activeColor: Color.fromARGB(255, 107, 244,
                    3), //to change the appearance of checkbox color
                side: BorderSide(width: 2, color: Colors.white),
              ),
              Text(
                TaskName,
                style: TextStyle(
                  // so we are putting a line across our text if it is checked using the 'TaskCompleted' variable.'?' is a ternary operator
                  decoration: TaskCompleted
                      ? //if
                      TextDecoration.lineThrough
                      : //else
                      TextDecoration.none,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.green.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

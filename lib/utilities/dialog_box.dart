// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final textController;

  //save method
  final VoidCallback onSave;
  //caancel method
  final VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.textController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(20.0),
      backgroundColor: Colors.green.shade300,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: textController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.green.shade900,
                  ),
                ),
                hintText: "Add a new task",
                hintStyle: TextStyle(
                  color: Colors.green.shade900,
                ),
              ),
            ),

            //buttons->save + cancel

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                myButton(buttonName: "save", onPress: onSave),

                //creates a space between buttons
                const SizedBox(width: 10),

                //cancel button
                myButton(buttonName: "cancel", onPress: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String buttonName;
  VoidCallback
      onPress; //void callback is a gesture detector but it returns nothing
  myButton({
    super.key,
    required this.buttonName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Text(
        buttonName,
        style: TextStyle(
          color: Colors.green.shade100,
        ),
      ),
      color: Theme.of(context).primaryColorDark,
    );
  }
}

import 'package:flutter/material.dart';
class Tasktile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('This is a task'),
      trailing: Checkbox(
        onChanged: (bool? value) {
        },
        value: false,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todo/widgets/tasktile.dart';
class Tasklist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Tasktile(),
        Tasktile(),
        Tasktile(),
      ],
    );
  }
}
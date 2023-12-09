import 'package:flutter/material.dart';
class Mentoring extends StatefulWidget {
  const Mentoring({Key? key}) : super(key: key);

  @override
  State<Mentoring> createState() => _MentoringState();
}

class _MentoringState extends State<Mentoring> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentoring'),
      ),
      body: Center(
        child: Text('Mentoring'),
      ),
    );
  }
}

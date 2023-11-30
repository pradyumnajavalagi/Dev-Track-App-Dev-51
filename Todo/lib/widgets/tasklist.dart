import 'package:flutter/material.dart';
import 'package:todo/widgets/tasktile.dart';
import 'package:todo/Model/task.dart';

class Tasklist extends StatefulWidget {
  @override
  TaskListState createState() => TaskListState();
}
class TaskListState extends State<Tasklist> {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Tasktile(
          isChecked: tasks[index].isDone,
          taskTitle: tasks[index].name,
          checkboxCallback:(checkboxState) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
      );
    }, itemCount: tasks.length,
    );
  }
}
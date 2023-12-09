import 'package:MyUni/utils/colors.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          // print('Clicked on Todo Item.');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: secondaryColor,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.white,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            decorationColor: Colors.white,
          ),
        ),
        trailing: IconButton(
          color: tdRed,
          iconSize: 19,
          icon: Icon(Icons.delete),
          onPressed: () {
            // print('Clicked on delete icon');
            onDeleteItem(todo.id);
          },
        ),
      ),
    );
  }
}
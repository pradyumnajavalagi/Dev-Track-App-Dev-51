import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/model/tasksdata.dart';
import 'package:flutter_todo_app/model/todofirestorehelper.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;


  ToDoItem({
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TaskModel>>(
      stream: TodoFirestoreHelper.read(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError){
          return Center(child: Text("Eroor occured"),);
        }
        if(snapshot.hasData){
          final taskData = snapshot.data;
          return Expanded(
            child: ListView.builder(itemCount: taskData!.length, itemBuilder: (context,index) {
              final singletask = taskData[index];
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
                  tileColor: tddarkblue,
                  leading: Icon(
                    todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
                    color: tdpink,
                  ),
                  title: Text("${singletask.taskname}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: todo.isDone ? TextDecoration.lineThrough : null,
                      decorationColor: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    color: Colors.red,
                    iconSize: 19,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      TodoFirestoreHelper.delete(singletask).then((value) => null);
                      onDeleteItem(todo.id);
                    },
                  ),
                ),
              );
            }),
          );
        }
        return Center(child: CircularProgressIndicator(),
        );
      }
    );
  }
}


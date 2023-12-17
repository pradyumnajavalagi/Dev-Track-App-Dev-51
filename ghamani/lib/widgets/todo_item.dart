import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  // final onToDoChanged;

  const ToDoItem({
    Key? key,
    required this.todo,
    // required this.onToDoChanged,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
//   @override


  void ondelete(String id){
    FirebaseFirestore.instance.collection('Task').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Task').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return Expanded(
            child: ListView(
              children: snapshot.data!.docs.map((document) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    key: Key(document.id),
                      onTap: () {
                        ondelete(document.id);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      tileColor: tddarkblue,
                      // leading: Icon(
                      //   widget.todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
                      //   color: tdpink,
                      // ),
                      title: Text(
                        document['title'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          // decoration:
                          // widget.todo.isDone ? TextDecoration.lineThrough : null,
                          // decorationColor: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        color: Colors.red,
                        iconSize: 19,
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          ondelete(document.id);
                        },
                      ),
                    ),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
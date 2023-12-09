import 'package:MyUni/utils/colors.dart';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdlightblue,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          icon: Icon(
            Icons.arrow_back_ios,
            color: tdicon,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: tdlightblue,
        elevation: 0,
        title: Text(
          'To Do',
          style: TextStyle(
            color: tdicon,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          'TASKS',
                          style: TextStyle(
                            color: tdicon,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 15,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: tddarkblue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'Add a new Task',
                        hintStyle: TextStyle(color: tdicon),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                      child: Icon(
                        Icons.add,
                        color: tddarkblue,
                        size: 30,
                      ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.white,
                      elevation: 10,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: tddarkblue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdicon,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdicon),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdlightblue,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.menu,
          color: tdicon,
          size: 30,
        ),


        // Icon(
        //   Icons.search,
        //   color: tdicon,
        //   size: 30,
        // ),


        // Container(
        //   height: 40,
        //   width: 40,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(20),
        //     child: Image.asset('assets/images/avatar.jpeg'),
        //   ),
        // ),


      ]),
    );
  }
}
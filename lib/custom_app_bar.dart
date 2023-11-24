import 'package:flutter/material.dart';

AppBar navBar() {
  return AppBar(
    backgroundColor: Colors.white,
    leading:  IconButton(
      iconSize: 30,
      onPressed: () {},
      icon: Icon(Icons.menu),
      color: Colors.black,
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.send_rounded),
        color: Colors.black,
        onPressed: () {},
      ),
    ],
    title: Center(
        child: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        )),
    elevation: 0.0,
  );
}
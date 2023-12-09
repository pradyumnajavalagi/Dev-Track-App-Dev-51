import 'package:MyUni/resources/firestore_methods.dart';
import 'package:MyUni/screens/chat_screen.dart';
import 'package:MyUni/screens/feed_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


AppBar navBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      iconSize: 30,
      onPressed: () {
        Scaffold.of(context).openDrawer(); // Open the drawer when the menu icon is pressed
      },
      icon: Icon(Icons.menu),
      color: Colors.black,
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.send_rounded),
        color: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen(),
            ),
          );
        },
      ),
    ],
    title: Center(
      child: Text(
        "Home",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ),
    elevation: 0.0,
  );
}

Drawer drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Navigator.pop(context); // Close the drawer
          },
        ),
        // Add more ListTile widgets for additional menu items
      ],
    ),
  );
}

void main() {
  runApp(MaterialApp(
    home: FeedScreen(),
  ));
}
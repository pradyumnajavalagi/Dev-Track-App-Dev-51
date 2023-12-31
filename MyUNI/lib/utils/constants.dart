import 'package:MyUni/utils/colors.dart';
import 'package:flutter/material.dart';

const String google_api_key = "AIzaSyAgdbLEN1z_TmGZZNLLKd24xMEZa2yV8fQ";
const Color primaryColor = Color(0xFF7B61FF);
const double defaultPadding = 16.0;

const kSendButtonTextStyle = TextStyle(
  color: secondaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: secondaryColor, width: 2.0),
  ),
);

// const kInputDecoration = InputDecoration(
//   hintText: 'Enter your email',
//   hintStyle: TextStyle(color: Colors.lightBlueAccent),
//   contentPadding:
//   EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide:
//     BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide:
//     BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   ),
// );

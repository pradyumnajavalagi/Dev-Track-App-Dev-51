// import 'dart:js';
import 'package:all_in_one_login/clubs.dart';
import 'package:all_in_one_login/login.dart';
import 'package:all_in_one_login/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login':(context)=>const MyLogin(),
      'register':(context)=>const MyRegister(),
      'clubs':(context)=> const MyClubs()
    },
  ));
}


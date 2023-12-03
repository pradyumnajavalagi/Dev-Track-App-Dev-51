
import 'package:draftbrandstore/models/shop.dart';
import 'package:draftbrandstore/pages/cartpage.dart';
import 'package:draftbrandstore/pages/intropage.dart';
import 'package:draftbrandstore/pages/shoppage.dart';
import 'package:draftbrandstore/themes/lightmode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
      ChangeNotifierProvider(create: (context)=>Shop(),
      child: const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightmode,
      routes: {
        '/intropage':(context)=> const IntroPage(),
        '/shoppage':(context)=>const ShopPage(),
        '/cartpage':(context)=>const CartPage(),
      },
    );
  }
}

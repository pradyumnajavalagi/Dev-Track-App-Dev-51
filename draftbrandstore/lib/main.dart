
import 'package:draftbrandstore/models/shop.dart';
import 'package:draftbrandstore/pages/cartpage.dart';
import 'package:draftbrandstore/pages/intropage.dart';
import 'package:draftbrandstore/pages/shoppage.dart';
import 'package:draftbrandstore/themes/lightmode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:draftbrandstore/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

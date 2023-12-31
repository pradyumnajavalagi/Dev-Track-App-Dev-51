import 'package:MyUni/responsive/mobile_screen_layout.dart';
import 'package:MyUni/screens/intropage.dart';
import 'package:MyUni/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/cartpage.dart';
import '../screens/feed_screen.dart';
import 'mylisttile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: secondaryColor,
                ),
                child: Center(
                child: Icon(
                  Icons.shopping_bag,

                  size: 50,
                  color: Colors.white,
                ),
              ),
              ),
              SizedBox(height: 25),

              MyListTile(text: "Shop",

                icon: Icons.home,
                onTap: ()=> Navigator.pop(context),
              ),

              MyListTile(text: "Cart",
                icon: Icons.shopping_cart_sharp,
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage(uid: FirebaseAuth.instance.currentUser!.uid)),
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(text: "Exit",
              icon: Icons.logout,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MobileScreenLayout()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
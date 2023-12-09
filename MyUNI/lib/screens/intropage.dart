import 'package:MyUni/models/shop.dart';
import 'package:MyUni/screens/feed_screen.dart';
import 'package:MyUni/screens/shoppage.dart';
import 'package:flutter/material.dart';

import '../widgets/mybutton.dart';


class IntroPage extends StatelessWidget {
  const IntroPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(''),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded),),

      ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.shopping_cart_outlined,
            // size: 72,
            // color: Theme.of(context).colorScheme.inversePrimary,),
            Image.asset('assets/revawithoutbg.png'),

            SizedBox(height: 25),

            Text('RevaBrandStore',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),

            Text('Shop Merch',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 25),
            MyButton(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShopPage()),
              );
              // Navigator.pop(context); // Close the drawer
            },
              child: Icon(Icons.arrow_forward,
              color: Colors.white,),)
          ],
        ),

        ) );
  }
}
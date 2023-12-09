import 'package:draftbrandstore/components/mybutton.dart';
import 'package:flutter/material.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          MyButton(onTap: ()=>Navigator.pushNamed(context, '/shoppage'),
            child: Icon(Icons.arrow_forward),)
        ],
      ),

      ) );
  }
}





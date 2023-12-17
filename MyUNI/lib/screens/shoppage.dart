import 'package:MyUni/screens/cartpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';
import '../widgets/mydrawer.dart';
import '../widgets/myproducttile.dart';

class ShopPage extends StatelessWidget {
  const ShopPage();

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(appBar: AppBar(
      title: Text("Buy Your Merch",style: TextStyle(color: Colors.white),),
      backgroundColor:Color.fromRGBO(102, 107, 237, 1) ,
      elevation: 0,
      foregroundColor: Colors.white,
      actions: [
        IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(uid: FirebaseAuth.instance.currentUser!.uid,)),
          );
        },
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white,)),
      ],
    ),
      drawer:const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body:ListView(
        children: [
          SizedBox(height: 25,),
          Center(
            child: Text('All Reva Merch Available',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                padding: EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  final product=products[index];
                  return MyProductTile(product: product);
                }
            ),
          ),
        ],
      ),

    );

  }
}
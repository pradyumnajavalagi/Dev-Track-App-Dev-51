import 'package:draftbrandstore/components/mydrawer.dart';
import 'package:draftbrandstore/components/myproducttile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(appBar: AppBar(
      title: Text("Buy Your Merch",style: TextStyle(color: Colors.black),),
      backgroundColor:Color.fromRGBO(102, 107, 237, 1) ,
      elevation: 0,
      foregroundColor: Colors.black,
      actions: [
        IconButton(onPressed: ()=>Navigator.pushNamed(context, '/cartpage'),
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,)),
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


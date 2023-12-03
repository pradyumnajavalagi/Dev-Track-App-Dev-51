import 'package:draftbrandstore/components/mybutton.dart';
import 'package:draftbrandstore/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(BuildContext context, Product product){
    showDialog(context: context,
        builder: (context)=>AlertDialog(
          content: Text('Remove from cart?'),
          actions: [
            MaterialButton(
              onPressed: ()=>Navigator.pop(context),
              child: Text('Cancel'),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().removeFromCart(product);
              },
              child: Text('Yes'),
            ),
          ],
        ));
  }

  void payButtonPressed(BuildContext context){
    showDialog(context: context,
        builder: (context)=>AlertDialog(
        content:Text('Proceed with payment'),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart= context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text('Cart '),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
              child: Center(
                child: cart.isEmpty
                    ? Text('Your cart is empty')
                   : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder:(context,index){
                      final item= cart[index];
                      return ListTile(
                         title: Text(item.name),
                         subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(icon: Icon(Icons.remove),
                          onPressed: ()=> removeFromCart(context,item)),
                       );
                          }   //itemBuilder
                          ),
              ),

          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap:()=> payButtonPressed(context),
                child: Text('Pay Now')),
          ),
        ],
      ),
    );
  }
}

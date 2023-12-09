
import 'package:draftbrandstore/components/mybutton.dart';
import 'package:draftbrandstore/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/productfetch.dart';
import '../models/shop.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

  void removeFromCart(BuildContext context, Product product) {
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(
              content: Text('Remove from cart?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),

                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);

                    //DELETE DATA FROM FIRESTORE
                    FirebaseFirestore.instance
                        .collection('products')
                        .where('pid', isEqualTo: product.pid)
                        .get()
                        .then((QuerySnapshot querySnapshot) {
                      querySnapshot.docs.forEach((doc) {
                        doc.reference.delete();
                      });
                    });
                  },
                  child: Text('Yes'),
                ),
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(
              content: Text('Proceed with payment'),
            )
    );
  }
class _CartPageState extends State<CartPage>{
  List<Item> cartItems=[];

  @override
  initState() {
    fetchRecords();
    super.initState();
  }

  fetchRecords() async{
    var records = await FirebaseFirestore.instance.collection('products').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String ,dynamic>> records){
    var _list =records.docs.map((_item) =>
        Item(
            id: _item.id,
        name: _item['name'],
        price:_item['price'])
    ).toList();
    setState(() {
      cartItems=_list;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = context
        .watch<Shop>()
        .cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text('Cart '),
      ),
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
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
                         subtitle: Text(item.price),
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
          ],),



    );
  }}








import 'package:draftbrandstore/components/mybutton.dart';
import 'package:draftbrandstore/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                        .where('name', isEqualTo: product.name)
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
  CollectionReference _referenceCartList = FirebaseFirestore.instance.collection('products');
  late Stream<QuerySnapshot> _streamCartItems;

  @override
  initState() {
    super.initState();
    _streamCartItems=_referenceCartList.snapshots();
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
      // body: Column(
      //   children: [
      //     Expanded(
      //         child: Center(
      //           child: cart.isEmpty
      //               ? Text('Your cart is empty')
      //              : ListView.builder(
      //               itemCount: cart.length,
      //               itemBuilder:(context,index){
      //                 final item= cart[index];
      //                 return ListTile(
      //                    title: Text(item.name),
      //                    subtitle: Text(item.price),
      //                     trailing: IconButton(icon: Icon(Icons.remove),
      //                     onPressed: ()=> removeFromCart(context,item)),
      //                  );
      //                     }   //itemBuilder
      //                     ),
      //         ),
      //
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(50.0),
      //       child: MyButton(onTap:()=> payButtonPressed(context),
      //           child: Text('Pay Now')),
      //     ),
      //     ],),
        body: StreamBuilder<QuerySnapshot>(
        stream: _streamCartItems ,
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          if(snapshot.connectionState==ConnectionState.active)
            {
              QuerySnapshot querySnapshot=snapshot.data;
            }
          return Center(child: CircularProgressIndicator());
        },
      ),


    );
  }}








import 'package:draftbrandstore/components/mybutton.dart';
import 'package:draftbrandstore/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/shop.dart';
import 'package:shopping_cart/shopping_cart.dart';

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
                      if (querySnapshot.docs.isNotEmpty) {
                        querySnapshot.docs.first.reference.delete();
                      }
                    });
                  },
                  child: Text('Yes'),
                ),
              ],
            ));
  }

Future<void> clearAllCart (BuildContext context) async{
  showDialog(context: context,
      builder: (context)=>AlertDialog(
        content: Text('Clear cart?'),
        actions: [
          MaterialButton(
            onPressed: ()=>Navigator.pop(context),
            child: Text('Cancel'),
          ),

          MaterialButton(
            onPressed: () async {
              Navigator.pop(context);
              context.read<Shop>().clearCart();

              //CLEARING CART
              final collectionRef = FirebaseFirestore.instance.collection('products');
              final querySnapshot = await collectionRef.get();
              final documents = querySnapshot.docs;

              for (var document in documents) {
                await document.reference.delete();
              }
           },
            child: Text('Yes'),
          ),
        ],
      ));
}

  void payButtonPressed(BuildContext context) {
    showDialog(context: context,
        builder: (context) =>
           const AlertDialog(
              content: Text('Proceed with payment'),
            )
    );
  }

class _CartPageState extends State<CartPage>{
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final cart = context.watch<Shop>().cart;
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
        FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('products').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (context, index) {
            final item = snapshot.data?.docs[index];
            final data = item?.data() as Map<String, dynamic>;

            return ListTile(
              title: Text(data['name']),
              subtitle: Text(data['price']),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => removeFromCart(context, item as Product),
              ),
            );
          },
        );
      },
    ),

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
                         subtitle: Text(item.mrp),
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
                        child: Text('Pay Now')
                    ),
                  ),
          SizedBox(height: 10,),

          ElevatedButton(
            onPressed: ()=> clearAllCart(context),
            child: Text('Clear Cart'),
          )

        ],
    ),



    );
  }}







import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/product.dart';
import '../models/shop.dart';
import '../utils/colors.dart';
import '../widgets/mybutton.dart';
import '../utils/utils.dart';

final _auth = FirebaseAuth.instance;
User loggedInUser = _auth.currentUser!;
final String uid = _auth.currentUser!.uid;

class CartPage extends StatefulWidget {
  static const String id = "CartPage";
  final String uid;

  const CartPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(BuildContext context, Product item) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Remove from cart?'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () async {
              Navigator.pop(context);

              // Remove from the local cart
              context.read<Shop>().removeFromCart(item);

              // Delete data from Firestore
              try {
                await FirebaseFirestore.instance
                    .collection('cart')
                    .doc(item.pid) // Use item.id instead of item.pid
                    .delete();
                // Rebuild the UI
                setState(() {});
              } on FirebaseException catch (e) {
                // Handle error
                print('Error deleting product: $e');
                showSnackBar(context, 'Error removing product.');
              }
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Proceed with payment'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: secondaryColor,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          'Cart ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('cart')
                  .where('userEmail', isEqualTo: loggedInUser.email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: secondaryColor,
                    ),
                  );
                }

                final cartItems = snapshot.data!.docs;
                if (cartItems.isEmpty) {
                  return Center(
                    child: Text('Your cart is empty'),
                  );
                }

                return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return ListTile(
                      title: Text(item['name'] ?? ''),
                      subtitle: Text(item['price'] ?? ''),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => removeFromCart(
                          context,
                          Product(
                            pid: item.id,
                            name: item['name'] ?? '',
                            price: item['price'] ?? '',
                            description: item['description'] ?? '',
                            imagePath: item['imagePath'] ?? '',
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text('Pay Now', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
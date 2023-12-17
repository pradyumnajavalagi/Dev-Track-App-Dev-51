import 'package:MyUni/screens/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/shop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  final docUser=FirebaseFirestore.instance.collection('cart').doc();

  MyProductTile({Key? key, required this.product}) : super(key: key);
  void addToCart (BuildContext context)async{
    showDialog(context: context,
        builder: (context)=>AlertDialog(
          content: Text('Add to cart?'),
          actions: [
            MaterialButton(
              onPressed: ()=>Navigator.pop(context),
              child: Text('Cancel'),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().addToCart(product);
                Map<String,String> dataToSave={
                  'userEmail': loggedInUser.email!,
                  'name':product.name,
                  'price':product.price,
                  'pid' : docUser.id,
                  'description':'',
                  'imagePath':'',
                };
                FirebaseFirestore.instance.collection('cart').add(dataToSave);
                product.pid = docUser.id;
              },
              child: Text('Yes'),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25)
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: Image.asset(product.imagePath),
                ),
              ),

              SizedBox(height: 25),

              Text(
                product.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),


              ),

              Text(product.description,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.price),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: IconButton(onPressed: () =>addToCart(context),
                    icon: Icon(Icons.add),
                    color: Colors.white,

                ),
              )
            ],
          ),
        ],
      ),

    );
  }
}
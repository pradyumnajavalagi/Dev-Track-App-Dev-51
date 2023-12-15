import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draftbrandstore/models/product.dart';
import 'package:flutter/material.dart';
class Shop extends ChangeNotifier{
  final List<Product> _shop=[
    Product(name: 'RevaShirt',
        mrp: '100.00',
        description: 'Wednesday Attire',
        imagePath: 'assets/revashirt.jpg',
        pid:'',
      ),

    Product(name: 'RevaBlazer',
        mrp: '100.00',
        description: 'Business Attire',
        imagePath: 'assets/revablazer.jpg',
        pid:'',
      ),

    Product(name: 'RevaBag',
        mrp: '100.00',
        description: 'Sleek and durable',
        imagePath: 'assets/revabag.jpg',
        pid:'',
      ),

    Product(name: 'Formal Shirt',
        mrp: '100.00',
        description: 'Formal Attire',
        imagePath: 'assets/whiteshirt.jpg',
        pid:'',
      ),
  ];

   List<Product> _cart=[];

   List<Product> get shop=> _shop;

   List<Product> get cart=> _cart;

   void addToCart(Product item){
     _cart.add(item);
     notifyListeners();
   }


   void removeFromCart(Product item){
     _cart.remove(item);
     notifyListeners();
   }

   void clearCart(){
     _cart.clear();
     notifyListeners();
   }

}
import 'package:MyUni/models/product.dart';
import 'package:flutter/material.dart';
class Shop extends ChangeNotifier{
  final List<Product> _shop=[
    Product(name: 'RevaShirt',
      price: '100.00',
      description: 'Wednesday Attire',
      imagePath: 'assets/revashirt.png',
      pid:'',
    ),

    Product(name: 'RevaBlazer',
      price: '100.00',
      description: 'Business Attire',
      imagePath: 'assets/revablazer.png',
      pid:'',
    ),

    Product(name: 'RevaBag',
      price: '100.00',
      description: 'Sleek and durable',
      imagePath: 'assets/revabag.png',
      pid:'',
    ),

    Product(name: 'Formal Shirt',
      price: '100.00',
      description: 'Formal Attire',
      imagePath: 'assets/whiteshirt.png',
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

}
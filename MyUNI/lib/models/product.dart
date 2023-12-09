import 'package:flutter/material.dart';
class Product {
  final String name;
  final String price;
  final String description;
  final String imagePath;
  String pid;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.pid,

  });
}
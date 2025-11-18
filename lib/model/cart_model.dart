import 'package:get/get.dart';

class CartItemModel {
  final String name;
  final String brand;
  final String image;
  final double price;
  RxInt qty;

  CartItemModel({
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.qty,
  });
}
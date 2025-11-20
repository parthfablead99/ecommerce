import 'package:flutter/material.dart';
import '../model/cartModel.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _cart = [];

  List<CartItemModel> get cart => _cart;

  // Add to Cart
  void addCart(CartItemModel item) {
    int index = _cart.indexWhere((e) => e.name == item.name);

    if (index != -1) {
      _cart[index].qty++;
    } else {
      _cart.add(item);
    }
    notifyListeners();
  }

  // Increase Quantity
  void qualityInc(CartItemModel item) {
    item.qty++;
    notifyListeners();
  }

  // Decrease Quantity
  void qualityDec(BuildContext context, CartItemModel item) {
    if (item.qty > 1) {
      item.qty--;
    } else {
      _cart.remove(item);
    }
    notifyListeners();
  }

  // Remove Item
  void removeItem(CartItemModel item) {
    _cart.remove(item);
    notifyListeners();
  }

  // Calculations
  double get subtotal =>
      _cart.fold(0, (sum, item) => sum + (item.price * item.qty));

  double get discount => subtotal * 0.10;

  double get delivery => _cart.isNotEmpty ? 20 : 0;

  double get total => subtotal - discount + delivery;
}

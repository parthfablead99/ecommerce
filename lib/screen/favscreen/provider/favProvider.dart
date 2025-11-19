import 'package:flutter/material.dart';
import '../../productdetailscreen/model/productModel.dart';

class FavProvider extends ChangeNotifier {
  final List<ProductModel> _fav = [];

  List<ProductModel> get fav => _fav;

  void toggleFav(ProductModel product) {
    if (_fav.contains(product)) {
      _fav.remove(product);
    } else {
      _fav.add(product);
    }
    notifyListeners();
  }

  bool isFav(ProductModel product) {
    return _fav.contains(product);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/productdetailscreen/model/productModel.dart';
import '../screen/productdetailscreen/view/product_detail.dart';
import '../screen/productslistscreen/view/productlist_screen.dart';
import '../utils/main_layout.dart';

class AppRoutes {
  static const home = '/home';
  static const products = '/products';
  static const productDetail = '/productDetail';
  static const cart = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case home:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case products:
        final products = settings.arguments as List<ProductModel>;
        return MaterialPageRoute(
            builder: (_) => ProductsList(products: products));

      case productDetail:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product));

    // LOAD CART INSIDE MAINLAYOUT (IMPORTANT)
      case cart:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route Not Found")),
          ),
        );
    }
  }
}

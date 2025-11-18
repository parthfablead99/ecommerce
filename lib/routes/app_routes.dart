import 'package:ecommerceapp/utils/main_layout.dart';
import 'package:ecommerceapp/view/cart_screen.dart';
import 'package:ecommerceapp/view/home_screen.dart';
import 'package:ecommerceapp/view/product_detail.dart';
import 'package:ecommerceapp/view/products_list.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const root = '/';
  static const home = '/home';
  static const products = '/products';
  static const productDetail = '/productDetail';
  static const cart = '/cart';
  static const main = '/main';

  static List<GetPage> routes = [
    GetPage(name: root, page: ()=> HomeScreen()),
    GetPage(name: home, page: ()=> HomeScreen()),
    GetPage(name: products, page: ()=> ProductsList()),
    GetPage(name: productDetail, page: ()=> ProductDetailScreen()),
    GetPage(name: cart, page: ()=> CartScreen()),
    GetPage(name: main, page: ()=> MainLayout()),
  ];
}
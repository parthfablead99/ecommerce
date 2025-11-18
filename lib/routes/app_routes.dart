import 'package:ecommerceapp/view/home_screen.dart';
import 'package:ecommerceapp/view/products_list.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/home';
  static const products = '/products';

  static List<GetPage> routes = [
    GetPage(name: home, page: ()=> HomeScreen()),
    GetPage(name: products, page: ()=> ProductsList()),
  ];
}
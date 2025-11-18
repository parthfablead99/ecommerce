import 'package:ecommerceapp/view/cart_screen.dart';
import 'package:ecommerceapp/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../view/fav_screen.dart';
import '../view/home_screen.dart';
import '../view/products_list.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<Widget> pages = [
    HomeScreen(),
    FavScreen(),
    CartScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: pages[controller.selectedIndex.value],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      );
    });
  }
}
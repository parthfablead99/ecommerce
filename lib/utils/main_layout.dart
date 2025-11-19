import 'package:ecommerceapp/screen/homeScreen/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../screen/homeScreen/view/homeScreen.dart';
import '../../screen/favscreen/view/fav_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    final screens = [
      HomeScreen(),
      FavScreen(),
      Center(child: Text('Search Screen'),),
      Center(child: Text('Profile Screen'),)
      // const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[provider.selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.selectedIndex,
        onTap: provider.onBottomNavTap,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
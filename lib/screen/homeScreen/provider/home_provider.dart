import 'package:flutter/material.dart';
import '../../productdetailscreen/model/productModel.dart';

class HomeProvider extends ChangeNotifier {
  String searchText = "";
  int selectedIndex = 0;

  List<ProductModel> categories = [];
  List<ProductModel> featured = [];
  List<String> bannerImage = [];

  int bannerIndex = 0;

  HomeProvider() {
    _initializeData();
  }

  void _initializeData() {
    featured = [
      ProductModel(
        name: "Casual Shirt",
        brand: 'West Side',
        image: 'assets/image/image1.jpg',
        price: 499,
        description:
        "Casual shirts frequently incorporate decorative features such as pockets, logos, or contrasting stitching.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
      ProductModel(
        name: "Sneakers",
        brand: 'Puma',
        image: 'assets/image/images2.jpg',
        price: 1299,
        description:
        "Sneakers are a specific type of shoe primarily designed for casual wear or sports.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
      ProductModel(
        name: "Smart Watch",
        brand: 'Apple',
        image: 'assets/image/images3.jpg',
        price: 1799,
        description: "A smartwatch is a wearable computer in the form of a wristwatch.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
    ];

    categories = [
      ProductModel(
        name: "Leather Wallet",
        brand: 'Levis',
        image: 'assets/image/download.jpg',
        price: 299,
        description: "A wallet is a flat case or pouch used to carry money and cards.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
      ProductModel(
        name: "Backpack",
        brand: 'Adidas',
        image: 'assets/image/download1.jpg',
        price: 899,
        description: "A backpack is a bag carried on the back with two straps.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
      ProductModel(
        name: "Sports Shoes",
        brand: 'Nike',
        image: 'assets/image/download2.jpg',
        price: 999,
        description: "Sports shoes are specially designed footwear for sports.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
      ProductModel(
        name: "Men T-Shirt",
        brand: 'Zara',
        image: 'assets/image/image1.jpg',
        price: 349,
        description:
        "A T-shirt is a fabric shirt named after the T shape of its body.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
      ProductModel(
        name: "Wireless Earbuds",
        brand: 'Boat',
        image: 'assets/image/images2.jpg',
        price: 799,
        description: "Earbuds are small headphones that fit inside the ear canal.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
      ProductModel(
        name: "Hoodie",
        brand: 'West Side',
        image: 'assets/image/images3.jpg',
        price: 1099,
        description: "A hoodie is made of warm, high-quality materials to keep you cozy.",
        sizedImages: {
          8: 'assets/image/images3.jpg',
          10: 'assets/image/images2.jpg',
          38: 'assets/image/download.jpg',
          40: 'assets/image/download1.jpg'
        },
      ),
    ];

    bannerImage = [
      'assets/image/banner.jpg',
      'assets/image/banner1.jpeg',
      'assets/image/images3.jpg',
    ];

    notifyListeners();
  }

  void updateBannerIndex(int index) {
    bannerIndex = index;
    notifyListeners();
  }

  void updateSearchText(String text) {
    searchText = text;
    notifyListeners();
  }

  void onBottomNavTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
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
        "Casual wear (or casual attire or clothing) is a Western dress code that is relaxed, occasional, spontaneous and suited for everyday use. Casual wear became popular in the Western world following the counterculture of the 1960s. When emphasising casual wear's comfort, it may be referred to as leisurewear or loungewear",
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
        "Sneakers (US) or trainers (UK), also known by a wide variety of other names, are shoes primarily designed for sports or other forms of physical exercise, but are also widely used for everyday casual wear. They were popularized by companies such as Converse, Nike and Spalding in the mid 20th century.",
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
        description: "A smartwatch is a wearable computer that functions as a portable device on your wrist, with capabilities that go beyond telling time. It can connect to a smartphone via Bluetooth to display notifications, receive calls, and send messages, as well as run apps. Smartwatches also include health and fitness tracking features like heart rate monitoring, step counting, and sleep tracking.",
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
        description: "Wallets are generally made of fabric or leather, and they are usually pocket-sized and foldable. Wallets may include a money clip, coin purse, chain fastener, strap, snap, rein, or zipper. There are specialized wallets for holding passports, wearable ID cards, and checkbooks.",
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
        description: "A backpack, also called knapsack, schoolbag, rucksack, pack, booksack, bookbag, haversack, packsack, or backsack, is in its simplest frameless form, a fabric sack carried on one's back and secured with two straps that go over the shoulders; but it can have an external or internal frame, and there are bodypacks.",
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
        description: "Sports shoes are specially designed footwear for performing sports activities. Compared to leisure shoes or sneakers, sports shoes are designed to: Facilitate movement. Minimize the risk of injury. Ensure the correct amount of grip, cushioning, breathability, and support.",
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
        "A T-shirt (also spelled tee shirt, or tee for short) is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally, it has short sleeves and a round neckline, known as a crew neck, which lacks a collar.",
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
        description: "Earbuds are a type of small, lightweight headphone that fits into the ear canal for private listening. They are used for a variety of purposes, including listening to music, audiobooks, or podcasts, and for making phone calls using a built-in microphone. Earbuds can be wired or wireless (using Bluetooth) and are valued for their portability.",
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
        description: "Hoodies, short for hooded sweatshirts,are similar to traditional sweatshirts but come with an added hood feature. The hood can be adjusted using drawstrings, allowing the wearer to pull it tighter around their head for extra protection from cold weather and wind.",
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
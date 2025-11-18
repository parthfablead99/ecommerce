import 'package:get/get.dart';
import '../model/product_detail_model.dart';

class HomeController extends GetxController {
  var searchText = ''.obs;
  var selectedIndex = 0.obs;

  RxList<ProductModel> categories = <ProductModel>[].obs;
  RxList<ProductModel> featured = <ProductModel>[].obs;
  RxList<String> bannerImage = <String>[].obs;

  RxInt bannerIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    featured.assignAll([
      ProductModel(
        name: "Casual Shirt",
        image: 'assets/image/image1.jpg',
        price: 499,
        description: "Casual shirts frequently incorporate decorative features such as pockets, logos, or contrasting stitching. The collar and placket construction is softer, providing a more comfortable and easygoing feel.",
      ),
      ProductModel(
        name: "Sneakers",
        image: 'assets/image/images2.jpg',
        price: 1299,
        description: "Sneakers are a specific type of shoe primarily designed for casual wear or sports. The key characteristics that set sneakers apart from other shoes are their flexible rubber soles, comfortable build, and often more casual, fashionable design.",
      ),
      ProductModel(
        name: "Smart Watch",
        image: 'assets/image/images3.jpg',
        price: 1799,
        description: "A smartwatch is a wearable computer in the form of a wristwatch that can perform smartphone-like functions. It connects to a smartphone via Bluetooth to display notifications, take calls, and send messages, but it also includes its own features like apps, GPS, and extensive health and fitness tracking, such as heart rate monitoring and step counting.",
      ),
    ]);
    categories.assignAll([
      ProductModel(
        name: "Leather Wallet",
        image: 'assets/image/download.jpg',
        price: 299,
        description: "A wallet is a flat case or pouch, often used to carry small personal items such as physical currency, debit cards, and credit cards; identification documents such as driving licence, identification card, club card; photographs, transit pass, business cards and other paper or laminated cards.",
      ),
      ProductModel(
        name: "Backpack",
        image: 'assets/image/download1.jpg',
        price: 899,
        description: "A backpack, also called knapsack, schoolbag, rucksack, pack, booksack, bookbag, haversack, packsack, or backsack, is in its simplest frameless form, a fabric sack carried on one's back and secured with two straps that go over the shoulders; but it can have an external or internal frame, and there are bodypacks.",
      ),
      ProductModel(
        name: "Sports Shoes",
        image: 'assets/image/download2.jpg',
        price: 999,
        description: "Sports shoes are specially designed footwear for performing sports activities. Compared to leisure shoes or sneakers, sports shoes are designed to: Facilitate movement. Minimize the risk of injury. Ensure the correct amount of grip, cushioning, breathability, and support..",
      ),
      ProductModel(
        name: "Men T-Shirt",
        image: 'assets/image/image1.jpg',
        price: 349,
        description: "A T-shirt (also spelled tee shirt, or tee for short) is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally, it has short sleeves and a round neckline, known as a crew neck, which lacks a collar.",
      ),
      ProductModel(
        name: "Wireless Earbuds",
        image: 'assets/image/images2.jpg',
        price: 799,
        description: "Earbuds are a type of small, lightweight headphone that fits into the ear canal for private listening. They are used for a variety of purposes, including listening to music, audiobooks, or podcasts, and for making phone calls using a built-in microphone. Earbuds can be wired or wireless (using Bluetooth) and are valued for their portability.",
      ),
      ProductModel(
        name: "Hoodie",
        image: 'assets/image/images3.jpg',
        price: 1099,
        description: "This hoodie is made of high-quality materials that will keep you warm and comfortable all season long. The fabric is thick and soft, and the stitching is durable. Plus, the hood is lined with fleece for extra warmth.",
      ),
    ]);
    bannerImage.assignAll([
      'assets/image/banner.jpg',
      'assets/image/banner1.jpeg',
      'assets/image/images3.jpg'
    ]);
  }

  void onBottomTap(int index) {
    selectedIndex.value = index;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/fav_controller.dart';
import '../model/product_detail_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final FavController favController = Get.find<FavController>();
  RxInt selectedSize = (-1).obs;

  final sizes = [8, 10, 38, 40];

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 15,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),

                Obx(
                      () => Positioned(
                    top: 15,
                    right: 15,
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: IconButton(
                        icon: Icon(
                          favController.isFav(product)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.deepPurpleAccent,
                        ),
                        onPressed: () {
                          favController.toogleFav(product);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name,
                            style: textTheme.headlineSmall),
                        Text("₹${product.price}",
                            style: textTheme.bodySmall?.copyWith(
                                // color: Colors.blue,
                              fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),

                    SizedBox(height: 15),

                    Text("Description", style: textTheme.titleMedium),
                    SizedBox(height: 5),
                    Text(product.description, style: textTheme.headlineMedium?.copyWith(fontSize: 12)),

                    SizedBox(height: 20),

                    Text("Size", style: textTheme.titleMedium),
                    SizedBox(height: 10),

                    Obx(() => Row(
                      children: sizes.map((size) {
                        final index = sizes.indexOf(size);
                        return GestureDetector(
                          onTap: () => selectedSize.value = index,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: selectedSize.value == index
                                  ? Colors.deepPurpleAccent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text(
                              size.toString(),
                              style: TextStyle(
                                  color: selectedSize.value == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        );
                      }).toList(),
                    )),

                    SizedBox(height: 25),

                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurpleAccent.shade400,
                              Colors.deepPurpleAccent.shade200,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

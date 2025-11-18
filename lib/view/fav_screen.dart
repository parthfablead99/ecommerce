import 'package:ecommerceapp/controller/fav_controller.dart';
import 'package:ecommerceapp/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final FavController controller = Get.find<FavController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: Icon(Icons.arrow_back, size: 20, color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Wishlist",
                        style: textTheme.headlineSmall?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Icon(Icons.arrow_back),
                  )
                ],
              ),
            ),
        
            SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.fav.isEmpty) {
                  return Center(
                    child: Text(
                      "No Favorites",
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }
                return GridView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: controller.fav.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.80,
                  ),
                  itemBuilder: (_, index) {
                    final product = controller.fav[index];
        
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.productDetail,arguments: product);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                              child: Image.asset(
                                product.image,
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
        
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.headlineMedium?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
        
                            SizedBox(height: 4),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "₹${product.price}",
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: 14,
                                  // color: Colors.green.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
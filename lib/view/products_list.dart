import 'package:ecommerceapp/controller/fav_controller.dart';
import 'package:ecommerceapp/model/product_detail_model.dart';
import 'package:ecommerceapp/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_controller.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  // final ProductsController controller = Get.put(ProductsController());
  late List<ProductModel> products;
  final FavController favController = Get.find<FavController>();

  @override
  void initState(){
    super.initState();
    products = Get.arguments as List<ProductModel>;
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black12,
                //     blurRadius: 6,
                //     offset: Offset(0, 3),
                //   ),
                // ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                        ),
                        child: Icon(Icons.arrow_back,
                            size: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Text(
                    "Products",
                    style: textTheme.headlineSmall?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.arrow_back, size: 20),
                    ),
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.90,
                ),
                itemBuilder: (context, index) {
                  ProductModel product = products[index];
        
                  return GestureDetector(
                    onTap: () =>
                        Get.to(() => ProductDetailScreen(),arguments: product),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                  child: Image.asset(
                                    product.image,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
        
                                Positioned(
                                  right: 8,
                                  top: 8,
                                  child: Obx(() {
                                    bool isFav =
                                    favController.isFav(product);
                                    return GestureDetector(
                                      onTap: () =>
                                          favController.toogleFav(product),
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 6,
                                            )
                                          ],
                                        ),
                                        child: Icon(
                                          isFav
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: isFav
                                              ? Colors.deepPurpleAccent
                                              : Colors.deepPurpleAccent,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
        
                                SizedBox(height: 4),
        
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹${product.price}",
                                      style:
                                      textTheme.headlineSmall?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

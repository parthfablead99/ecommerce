import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/model/cart_model.dart';
import 'package:ecommerceapp/utils/size_config.dart';
import 'package:ecommerceapp/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/fav_controller.dart';
import '../model/product_detail_model.dart';

class ProductDetailScreen extends StatefulWidget {
  // final ProductModel product;

  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final FavController favController = Get.find<FavController>();
  final CartController cartController = Get.find<CartController>();
  RxInt selectedSize = (-1).obs;
  RxString selectedImage = ''.obs;

  late ProductModel product;
  final sizes = [8, 10, 38, 40];
  RxBool isMore = false.obs;

  void initState(){
    super.initState();
    product = Get.arguments;
    selectedImage.value = product.image;
  }
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Obx(()=>Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(selectedImage.value),
                        fit: BoxFit.cover,
                      ),
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

                    Obx((){
                      String text = product.description;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text,
                            maxLines: isMore.value ? null:1,
                            overflow: isMore.value ? TextOverflow.visible : TextOverflow.ellipsis,
                            style: textTheme.headlineMedium?.copyWith(fontSize: 12),
                          ),
                          SizedBox(height: 4,),

                          GestureDetector(
                            onTap: ()=> isMore.value = !isMore.value,
                            child: Text(
                                isMore.value ? 'Read Less':'Read More',
                              style: textTheme.bodySmall?.copyWith(fontSize: 10),
                            ),
                          ),
                        ],
                      );
                    }),
                    // Text(product.description, style: textTheme.headlineMedium?.copyWith(fontSize: 12)),

                    SizedBox(height: 20),

                    Text("Size", style: textTheme.titleMedium),
                    SizedBox(height: 10),

                    Obx(() => Row(
                      children: sizes.map((size) {
                        final index = sizes.indexOf(size);
                        return GestureDetector(
                          onTap: () {
                            // selectedSize.value = index;
                            if (selectedSize.value == index) {
                              selectedSize.value = -1;
                              selectedImage.value = product.image;
                            } else {
                              selectedSize.value = index;

                              if (product.sizedImages.containsKey(size)) {
                                selectedImage.value = product.sizedImages[size]!;
                              } else {
                                selectedImage.value = product.image;
                              }
                            }
                          },
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
                          onTap: () async{
                            cartController.addCart(
                              CartItemModel(
                                  name: product.name,
                                  brand: product.brand ?? '',
                                  image: product.image,
                                  price: product.price,
                                  qty: 1.obs,
                              )
                            );
                            Get.snackbar(
                              'Added to Cart',
                              '${product.name} added successfully',
                              backgroundColor: Colors.deepPurpleAccent,
                              duration: Duration(milliseconds: 1200),
                              borderRadius: 12,
                              margin: EdgeInsets.all(16),
                              snackPosition: SnackPosition.BOTTOM,

                            );

                            await Future.delayed(Duration(milliseconds: 300));
                            Get.to(() => CartScreen());
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: SizeConfig.blockHeight * 5,
                            width: SizeConfig.blockWidth * 100,
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
                              "Add to Cart",
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

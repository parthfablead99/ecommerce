import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/product_detail_model.dart';
import '../../cartscreen/model/cartModel.dart';
import '../../cartscreen/provider/cartProvider.dart';
import '../../cartscreen/view/cartScreen.dart';
import '../../favscreen/provider/favProvider.dart';
import '../../productslistscreen/provider/productlist_provider.dart';
import '../model/productModel.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedSizeIndex = -1;
  String selectedImage = "";
  bool isMore = false;

  final sizes = [8, 10, 38, 40];

  @override
  void initState() {
    super.initState();
    selectedImage = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final favProvider = Provider.of<FavProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final product = widget.product;

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
                      image: AssetImage(selectedImage),
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
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                Positioned(
                  top: 15,
                  right: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      icon: Icon(
                        favProvider.isFav(product)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: () {
                        favProvider.toggleFav(product);
                      },
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
                            style: textTheme.headlineSmall,
                        ),
                        Text(
                          "₹${product.price}",
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    Text("Description",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 14
                        ),
                    ),
                    SizedBox(height: 5),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.description,
                          maxLines: isMore ? null : 1,
                          overflow:
                          isMore ? TextOverflow.visible : TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMore = !isMore;
                            });
                          },
                          child: Text(
                            isMore ? "Read Less" : "Read More",
                            style: textTheme.bodySmall?.copyWith(fontSize: 10),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Text("Size", style: textTheme.titleMedium),
                    SizedBox(height: 10),

                    Row(
                      children: sizes.map((size) {
                        final index = sizes.indexOf(size);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedSizeIndex == index) {
                                selectedSizeIndex = -1;
                                selectedImage = product.image;
                              } else {
                                selectedSizeIndex = index;

                                if (product.sizedImages.containsKey(size)) {
                                  selectedImage = product.sizedImages[size]!;
                                } else {
                                  selectedImage = product.image;
                                }
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: selectedSizeIndex == index
                                  ? Colors.deepPurpleAccent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text(
                              size.toString(),
                              style: TextStyle(
                                color: selectedSizeIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 25),

                    InkWell(
                      onTap: () {
                        cartProvider.addCart(
                          CartItemModel(
                            name: product.name,
                            brand: product.brand,
                            image: product.image,
                            price: product.price,
                            qty: 1,
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.name} added to cart"),
                            backgroundColor: Colors.deepPurpleAccent,
                            duration: Duration(milliseconds: 1200),
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CartScreen(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: 50,
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
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(width: 20),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // SizedBox(height: 20),
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

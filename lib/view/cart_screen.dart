import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 4,
                  vertical: SizeConfig.blockHeight * 2,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Cart',
                          style: textTheme.headlineSmall?.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200, shape: BoxShape.circle),
                      child: Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: cartController.cart.length,
                    itemBuilder: (context, index) {
                      final item = cartController.cart[index];
                      return Dismissible(
                        key: ValueKey(item.name),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.delete, color: Colors.white, size: 32),
                        ),
                        onDismissed: (_) {
                          cartController.removeItem(item);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 14),
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  item.image,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: textTheme.headlineMedium?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "₹${item.price}",
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontSize: 14
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => cartController.qualityDec(item),
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.remove,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Obx(() => Text(
                                    item.qty.value.toString(),
                                    style: textTheme.bodySmall?.copyWith(
                                      fontSize: 14,
                                    )
                                  )),
                                  SizedBox(height: 6),
                                  GestureDetector(
                                    onTap: () => cartController.qualityInc(item),
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      child:
                                      Icon(Icons.add, color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => _summaryRow("Sub Total", "₹${cartController.subtotal}")),
                    Obx(() => _summaryRow("Discount", "-₹${cartController.discount}")),
                    Obx(() => _summaryRow("Delivery", "₹${cartController.delivery}")),
                    Divider(),
                    Obx(() => _summaryRow("Total", "₹${cartController.total}")),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: SizeConfig.blockHeight * 8,
                  width: SizeConfig.blockWidth * 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurpleAccent.shade400,
                        Colors.deepPurpleAccent.shade200,
                      ],
                    ),
                  ),
                  child: Text(
                    "Check Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(String left, String right) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: TextStyle(fontSize: 14)),
          Text(right, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
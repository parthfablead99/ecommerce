import 'package:ecommerceapp/screen/checkoutscreen/view/checkOutScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/size_config.dart';
import '../provider/cartProvider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10,
          vertical: 8,
          ),
          child: Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              final isEmpty = cartProvider.cart.isEmpty;

              return Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Cart',
                              style: textTheme.headlineSmall?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  if (isEmpty)
                    Expanded(
                      child: Center(
                        child: Text(
                          "No Products in Cart",
                          style: textTheme.bodyLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                    ),

                  if (!isEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartProvider.cart.length,
                        itemBuilder: (context, index) {
                          final item = cartProvider.cart[index];

                          return Dismissible(
                            key: ValueKey(item.name),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            onDismissed: (_) {
                              cartProvider.removeItem(item);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 14, left: 8, right: 8),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      item.image,
                                      height: SizeConfig.blockHeight * 11,
                                      width: SizeConfig.blockWidth * 25,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style:
                                          textTheme.bodyLarge?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          "₹${item.price}",
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (item.qty == 1) {
                                            cartProvider.removeItem(item);
                                          } else {
                                            cartProvider.qualityDec(
                                                context, item);
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: const BoxDecoration(
                                            color: Colors.deepPurpleAccent,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        item.qty.toString(),
                                        style: textTheme.bodySmall?.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      GestureDetector(
                                        onTap: () =>
                                            cartProvider.qualityInc(item),
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: const BoxDecoration(
                                            color: Colors.deepPurpleAccent,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                  if (!isEmpty)
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
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
                          _summaryRow("Sub Total", "₹${cartProvider.subtotal}"),
                          _summaryRow("Discount", "-₹${cartProvider.discount}"),
                          _summaryRow("Delivery", "₹${cartProvider.delivery}"),
                          const Divider(),
                          _summaryRow("Total", "₹${cartProvider.total}"),
                        ],
                      ),
                    ),

                  if (!isEmpty)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Checkoutscreen()),
                        );
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: SizeConfig.blockHeight * 7,
                        width: double.infinity,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Check Out",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 20),
                            Icon(Icons.shopping_cart_checkout,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),

                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: Theme.of(context).textTheme.bodyMedium),
          Text(right, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

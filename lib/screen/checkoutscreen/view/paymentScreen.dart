import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/checkOutProvider.dart';

class PaymentScreen extends StatelessWidget {
  final methods = ["Credit Card", "UPI", "Cash on Delivery"];

  @override
  Widget build(BuildContext context) {
    final checkout = Provider.of<CheckoutProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ...methods.map((method) {
              return ListTile(
                leading: Radio(
                  value: method,
                  groupValue: checkout.paymentMethod,
                  onChanged: (value) {
                    checkout.updatePayment(value!);
                  },
                ),
                title: Text(method),
              );
            }).toList(),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                if (checkout.paymentMethod.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Select a payment method")),
                  );
                  return;
                }

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) => ReviewScreen()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
                shape: StadiumBorder(),
              ),
              child: Text("Continue",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}

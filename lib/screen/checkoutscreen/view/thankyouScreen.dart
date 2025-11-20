import 'package:ecommerceapp/screen/homeScreen/provider/home_provider.dart';
import 'package:ecommerceapp/screen/homeScreen/view/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/app_routes.dart';

class Thankyouscreen extends StatelessWidget {
  const Thankyouscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Center(
              child: Image.asset('assets/image/thankyou.png',
                height: 180,
              ),
            ),
            SizedBox(height: 20),

            Text('Your order has been confirmed !',
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 14),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
              child: Text('Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!',
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: Colors.grey
                ),
              ),
            ),
            Spacer(),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.home,
                        (route) => false,
                  );

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text('Continue Shopping !',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

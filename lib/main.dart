import 'package:ecommerceapp/routes/app_routes.dart';
import 'package:ecommerceapp/screen/checkoutscreen/provider/checkOutProvider.dart';
import 'package:ecommerceapp/screen/favscreen/provider/favProvider.dart';
import 'package:ecommerceapp/screen/cartscreen/provider/cartProvider.dart';
import 'package:ecommerceapp/screen/homeScreen/provider/home_provider.dart';
import 'package:ecommerceapp/screen/productslistscreen/provider/productlist_provider.dart';
import 'package:ecommerceapp/screen/productslistscreen/view/productlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => FavProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CheckoutProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTextTheme =
    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

    final customTextTheme = baseTextTheme.copyWith(
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(color: Colors.black),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: Colors.black),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: Colors.black),
      bodyLarge:
      baseTextTheme.bodyLarge?.copyWith(color: Colors.deepPurpleAccent),
      bodyMedium:
      baseTextTheme.bodyMedium?.copyWith(color: Colors.deepPurpleAccent),
      bodySmall:
      baseTextTheme.bodySmall?.copyWith(color: Colors.deepPurpleAccent),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: customTextTheme,
      ),

      // default home screen
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
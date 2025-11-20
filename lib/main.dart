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
      // -------- HEADLINES --------
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(
        color: const Color(0xFF1E1E1E),   // Dark Grey (Primary)
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        color: const Color(0xFF6A5AE0),   // Indigo Purple (Accent)
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        color: const Color(0xFF1E1E1E),   // Soft Teal
        fontWeight: FontWeight.w600,
      ),

      // -------- BODY TEXT --------
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        color: const Color(0xFF1E1E1E),   // Dark Grey — readable
        fontSize: 16,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        color: const Color(0xFF6A5AE0),  // Indigo Purple
        fontSize: 12,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        color: const Color(0xFF1E1E1E),  // Soft Red
        fontSize: 12,
      ),

      // -------- LABELS (Buttons / Inputs) --------
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        color: const Color(0xFFFFFFFF), // White text on buttons
        fontWeight: FontWeight.bold,
      ),
      labelMedium: baseTextTheme.labelMedium?.copyWith(
        color: const Color(0xFF6A5AE0),
      ),
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
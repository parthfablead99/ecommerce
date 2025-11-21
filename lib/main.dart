import 'package:ecommerceapp/firebase_options.dart';
import 'package:ecommerceapp/routes/app_routes.dart';
import 'package:ecommerceapp/screen/checkoutscreen/provider/checkOutProvider.dart';
import 'package:ecommerceapp/screen/favscreen/provider/favProvider.dart';
import 'package:ecommerceapp/screen/cartscreen/provider/cartProvider.dart';
import 'package:ecommerceapp/screen/homeScreen/provider/home_provider.dart';
import 'package:ecommerceapp/screen/productslistscreen/provider/productlist_provider.dart';
import 'package:ecommerceapp/screen/productslistscreen/view/productlist_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        color: const Color(0xFF1E1E1E),
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        color: const Color(0xFF6A5AE0),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        color: const Color(0xFF1E1E1E),
        fontWeight: FontWeight.w600,
      ),

      // -------- BODY TEXT --------
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        color: const Color(0xFF1E1E1E),
        fontSize: 16,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        color: const Color(0xFF6A5AE0),
        fontSize: 12,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        color: const Color(0xFF1E1E1E),
        fontSize: 12,
      ),

      // -------- LABELS (Buttons / Inputs) --------
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        color: const Color(0xFFFFFFFF),
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
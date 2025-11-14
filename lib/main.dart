import 'package:ecommerceapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final baseTextTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

    final customTextTheme = baseTextTheme.copyWith(
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(color: Colors.black),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: Colors.black),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: Colors.black),

      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: Colors.deepPurpleAccent),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: Colors.deepPurpleAccent),
      bodySmall: baseTextTheme.bodySmall?.copyWith(color: Colors.deepPurpleAccent),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: customTextTheme,
        // useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),

      ),
      home: const HomeScreen(),
    );
  }
}

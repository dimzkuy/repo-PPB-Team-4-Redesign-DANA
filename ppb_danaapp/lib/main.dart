import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppb_danaapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Tugas Besar - Redesign DANA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // Menambahkan Google Font di main.dart
        textTheme: GoogleFonts.srirachaTextTheme(),
      ),
      home: SplashScreen(),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_names.dart';
import '../themes/color_themes.dart'; // Import ColorThemes

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () async {
      await FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          // Kalau logout atau pertama kali daftar
          Get.offNamed(RouteNames.login);
        } else {
          // Kalau sebelumnya sudah login
          Get.offNamed(RouteNames.home);
        }
      });
    });

    return Scaffold(
      backgroundColor: ColorThemes.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/icon/icon_dana_splash_screen.png',
          height: 100,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

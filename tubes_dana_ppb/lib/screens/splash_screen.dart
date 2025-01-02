import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_names.dart';
import '../themes/color_themes.dart'; // Import ColorThemes

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(RouteNames.login);
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

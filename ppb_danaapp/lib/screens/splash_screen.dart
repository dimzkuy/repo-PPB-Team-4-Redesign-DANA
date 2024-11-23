import 'package:flutter/material.dart';
import 'dart:async'; // Import untuk menggunakan Timer
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';
import 'register_screen.dart'; // Import RegisterPage

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menambahkan delay sebelum navigasi ke RegisterPage
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => RegisterPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Container(
          width: 402,
          height: 874,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: CustomPaletteColors.primary, // Warna latar belakang (biru)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 81,
                top: 381,
                child: Container(
                  width: 239,
                  height: 112,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/icon/icon_dana_splash_screen.png"), // Menggunakan gambar dari folder assets
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 127,
                top: 482,
                child: Text(
                  'GANTIDOMPET',
                  style: CustomTypography.headline1.copyWith(
                    color: CustomPaletteColors.background, // Warna teks (putih)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

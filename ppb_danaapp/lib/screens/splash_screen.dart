import 'package:flutter/material.dart';
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 402,
          height: 874,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: CustomPaletteColors.accent, // Warna latar belakang (biru)
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
                      image: NetworkImage("https://via.placeholder.com/239x112"),
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
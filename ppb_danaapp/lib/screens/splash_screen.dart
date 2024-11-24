import 'package:flutter/material.dart';
import 'dart:async';
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';
import 'register_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          margin: EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: CustomPaletteColors.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      width: 239,
                      height: 112,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icon/icon_dana_splash_screen.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'GANTIDOMPET',
                      style: CustomTypography.headline1.copyWith(
                        color: CustomPaletteColors.background,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
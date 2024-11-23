import 'package:flutter/material.dart';
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';
import '../design_system/styles/button_systems.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 402,
          height: 874,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: CustomPaletteColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 36,
                top: 81,
                child: Text(
                  'Create a new account',
                  style: CustomTypography.headline1.copyWith(
                    color: CustomPaletteColors.secondary,
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 117,
                child: Text(
                  'Welcome! Please fill out the details below',
                  style: CustomTypography.bodyText1.copyWith(
                    color: CustomPaletteColors.secondary,
                  ),
                ),
              ),
              _buildInputField('Username', 163),
              _buildInputField('First Name', 227),
              _buildInputField('Email', 291),
              _buildInputField('Password', 355),
              Positioned(
                left: 19,
                top: 420,
                child: ButtonSystems.customElevatedButton(
                  label: 'Create Account',
                  onPressed: () {
                    // Action saat tombol ditekan
                  },
                ),
              ),
              Positioned(
                left: 19,
                top: 480,
                child: Text(
                  'or Create Account with',
                  style: CustomTypography.bodyText1.copyWith(
                    color: CustomPaletteColors.textPrimary,
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 510,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonSystems.customSocialButton(
                      label: 'Facebook',
                      platform: 'facebook', // Parameter platform
                      onPressed: () {
                        // Action untuk Facebook
                      },
                    ),
                    ButtonSystems.customSocialButton(
                      label: 'Google',
                      platform: 'google', // Parameter platform
                      onPressed: () {
                        // Action untuk Google
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 69,
                top: 721,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: CustomTypography.bodyText1.copyWith(
                          color: CustomPaletteColors.textPrimary,
                        ),
                      ),
                      TextSpan(
                        text: 'Login here!',
                        style: CustomTypography.bodyText1.copyWith(
                          color: CustomPaletteColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, double topPosition) {
    return Positioned(
      left: 19,
      top: topPosition,
      child: Container(
        width: 365,
        height: 53,
        decoration: BoxDecoration(
          color: CustomPaletteColors.inputFieldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black.withOpacity(0.25),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';
import '../design_system/styles/button_systems.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  'Log In to Your Account',
                  style: CustomTypography.headline1.copyWith(
                    color: CustomPaletteColors.secondary,
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 117,
                child: Text(
                  'Welcome! Please enter the required fields below',
                  style: CustomTypography.bodyText1.copyWith(
                    color: CustomPaletteColors.secondary,
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 170,
                child: _buildInputField('Email / Username'),
              ),
              Positioned(
                left: 19,
                top: 293,
                child: _buildInputField('Password'),
              ),
              Positioned(
                left: 156,
                top: 414,
                child: Text(
                  'or Log In with',
                  style: CustomTypography.bodyText1,
                ),
              ),
              Positioned(
                left: 20,
                top: 590,
                child: ButtonSystems.customElevatedButton(
                  label: 'Log In Now',
                  onPressed: () {
                    // Action untuk log in
                  },
                ),
              ),
              Positioned(
                left: 20,
                top: 440,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonSystems.customSocialButton(
                      label: 'Facebook',
                      platform: 'facebook',
                      onPressed: () {
                        // Action untuk login dengan Facebook
                      },
                    ),
                    ButtonSystems.customSocialButton(
                      label: 'Google',
                      platform: 'google',
                      onPressed: () {
                        // Action untuk login dengan Google
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 68,
                top: 691,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: CustomTypography.bodyText1,
                      ),
                      TextSpan(
                        text: 'Register here!',
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

  Widget _buildInputField(String label) {
    return Container(
      width: 365,
      height: 77,
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
    );
  }
}

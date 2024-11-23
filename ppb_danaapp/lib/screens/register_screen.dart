import 'package:flutter/material.dart';
import 'package:ppb_danaapp/screens/login_screen.dart';
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';
import '../design_system/styles/button_systems.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 50,
                  child: Text(
                    'Create a new account',
                    style: CustomTypography.headline1.copyWith(
                      color: CustomPaletteColors.secondary,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 90,
                  child: Text(
                    'Welcome! Please fill out the details below',
                    style: CustomTypography.bodyText1.copyWith(
                      color: CustomPaletteColors.secondary,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 140,
                  child: Column(
                    children: [
                      _buildInputField('Username'),
                      SizedBox(height: 20),
                      _buildInputField('First Name'),
                      SizedBox(height: 20),
                      _buildInputField('Email'),
                      SizedBox(height: 20),
                      _buildInputField('Password'),
                    ],
                  ),
                ),
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
                        platform: 'facebook',
                        onPressed: () {
                          // Action untuk Facebook
                        },
                      ),
                      ButtonSystems.customSocialButton(
                        label: 'Google',
                        platform: 'google',
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
                  child: ButtonSystems.customTextButton(
                    label: 'Login Here',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label) {
    return Container(
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
    );
  }
}

import 'package:flutter/material.dart';
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';
import '../design_system/styles/button_systems.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: CustomPaletteColors.background,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log In to Your Account',
                    style: CustomTypography.headline1.copyWith(
                      color: CustomPaletteColors.secondary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome! Please enter the required fields below',
                    style: CustomTypography.bodyText1.copyWith(
                      color: CustomPaletteColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  _buildInputField(_emailController, 'Email / Username'),
                  SizedBox(height: 15),
                  _buildPasswordField(_passwordController, 'Password'),
                  SizedBox(height: 30),
                  ButtonSystems.customElevatedButton(
                    label: 'Log In Now',
                    onPressed: () {
                      // Action untuk log in
                    },
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      // Aksi untuk navigasi ke register
                    },
                    child: Text(
                      'Don’t have an account? Register here!',
                      style: CustomTypography.bodyText1.copyWith(
                        color: CustomPaletteColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: CustomPaletteColors.inputFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String label) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: CustomPaletteColors.inputFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        obscureText: !_isPasswordVisible,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black.withOpacity(0.5),
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}

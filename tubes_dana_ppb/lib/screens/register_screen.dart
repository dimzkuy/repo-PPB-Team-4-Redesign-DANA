import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_dana_ppb/controllers/login_register_controller.dart';
import '../themes/color_themes.dart';

class RegisterScreen extends StatelessWidget {
  final LoginRegisterController controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.backgroundColor,
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create a new account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: ColorThemes.textColor),
                ),
                const SizedBox(height: 10),
                const Text('Welcome! Please fill out the details below'),
                const SizedBox(height: 30),
                _buildInputField('Username'),
                const SizedBox(height: 15),
                _buildInputField('Email'),
                const SizedBox(height: 15),
                _buildPasswordField('Password'),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed:
                      controller.navigateToHome, // Menggunakan controller
                  child: const Text('Create Account'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorThemes.primaryColor,
                      foregroundColor: ColorThemes.backgroundColor),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed:
                      controller.navigateToLogin, // Menggunakan controller
                  child: const Text('Already have an account? Login Here!'),
                  style: TextButton.styleFrom(
                    foregroundColor: ColorThemes.primaryColor,
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
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          hintText: label,
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          hintText: label,
        ),
      ),
    );
  }
}

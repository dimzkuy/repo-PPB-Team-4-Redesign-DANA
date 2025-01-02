import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes/color_themes.dart';
import '../controllers/login_register_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginRegisterController controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menambahkan teks untuk "Log In to Your Account"
            Text(
              'Log In to Your Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:
                    ColorThemes.textColor, // Menggunakan warna dari ColorThemes
              ),
            ),
            const SizedBox(height: 8), // Jarak antara teks
            Text(
              'Welcome! Please enter the required fields below',
              style: TextStyle(
                fontSize: 16,
                color:
                    ColorThemes.textColor, // Menggunakan warna dari ColorThemes
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Jarak antara teks dan input
            TextField(
              decoration: InputDecoration(
                labelText: 'Email / Username',
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.navigateToHome,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorThemes.primaryColor,
                foregroundColor: ColorThemes.backgroundColor,
              ),
              child: Text('Log In'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: controller.navigateToRegister,
              style: TextButton.styleFrom(
                foregroundColor: ColorThemes.primaryColor,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              child: Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }
}

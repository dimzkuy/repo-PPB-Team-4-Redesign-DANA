import 'package:firebase_auth/firebase_auth.dart';
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
            Obx(
              () => TextField(
                onTap: () {
                  controller.updateErrorOccured(false);
                },
                controller: controller.emailController,
                decoration: InputDecoration(
                  error: controller.hasErrorOccured.value
                      ? Text(
                          "Email invalid!",
                          style: TextStyle(
                              color: ColorThemes.colorScheme.error,
                              fontSize: 8.0),
                        )
                      : null,
                  labelText: 'Email',
                  filled: true,
                  // fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(height: 16),
            Obx(
              () => TextField(
                onTap: () {
                  controller.updateErrorOccured(false);
                },
                controller: controller.passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  error: controller.hasErrorOccured.value
                      ? Text(
                          "Password invalid!",
                          style: TextStyle(
                              color: ColorThemes.colorScheme.error,
                              fontSize: 8.0),
                        )
                      : null,
                  labelText: 'Password',
                  filled: true,
                  // fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                if (controller.isFormInputValid()) {
                  CircularProgressIndicator();
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: controller.emailController.text,
                      password: controller.passwordController.text);

                  controller.clearAfterSubmit();
                  controller.navigateToHome();
                } else {
                  controller.updateErrorOccured(true);
                }
              },
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
              child: Text("Don't have an account? Create one here!"),
            ),
          ],
        ),
      ),
    );
  }
}

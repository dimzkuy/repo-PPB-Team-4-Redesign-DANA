import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_dana_ppb/controllers/login_register_controller.dart';
import '../themes/color_themes.dart';

class RegisterScreen extends StatelessWidget {
  final LoginRegisterController controller = Get.put(LoginRegisterController());
  final RTDBFirebase registNewUserController = Get.put(RTDBFirebase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorThemes.backgroundColor,
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            // color: Colors.white,
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
                Obx(() => _buildNameField('Name', controller.nameController)),
                const SizedBox(height: 15),
                Obx(() =>
                    _buildInputField('Email', controller.emailController)),
                const SizedBox(height: 15),
                Obx(() => _buildPasswordField(
                    'Password', controller.passwordController)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (controller.isFormInputValid()) {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: controller.emailController.text,
                              password: controller.passwordController.text);

                      registNewUserController.addNewUser(
                          name: controller.nameController.text,
                          email: controller.emailController.text,
                          saldo: 75000,
                          pin: "0000000");

                      controller.clearAfterSubmit();
                      controller.navigateToLogin();
                    } else {
                      controller.updateErrorOccured(true);
                    }
                  }, // Menggunakan controller
                  child: const Text('Create'),
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

  Widget _buildNameField(String label, TextEditingController tec) {
    return Container(
      child: TextField(
        onTap: () {
          controller.updateErrorOccured(false);
        },
        controller: tec,
        decoration: InputDecoration(
          error: controller.hasErrorOccured.value
              ? Text(
                  "Name must be at least 5 characters long and not empty!",
                  style: TextStyle(
                      color: ColorThemes.colorScheme.error, fontSize: 10.0),
                )
              : null,
          labelText: label,
          filled: true,
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController tec) {
    return Container(
      // height: 50,
      // decoration: BoxDecoration(
      //   color: Colors.grey[200],
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: TextField(
        onTap: () {
          controller.updateErrorOccured(false);
        },
        controller: tec,
        decoration: InputDecoration(
          error: controller.hasErrorOccured.value
              ? Text(
                  "Email invalid!",
                  style: TextStyle(
                      color: ColorThemes.colorScheme.error, fontSize: 10.0),
                )
              : null,
          // border: InputBorder.none,
          // contentPadding: EdgeInsets.symmetric(horizontal: 18),
          labelText: label,
          filled: true,
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController tec) {
    return Container(
      // height: 50,
      // decoration: BoxDecoration(
      //   color: Colors.grey[200],
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: TextField(
        onTap: () {
          controller.updateErrorOccured(false);
        },
        controller: tec,
        obscureText: true,
        decoration: InputDecoration(
          error: controller.hasErrorOccured.value
              ? Text(
                  "Password cannot be empty and must 8 characters!",
                  style: TextStyle(
                      color: ColorThemes.colorScheme.error, fontSize: 10.0),
                )
              : null,
          // border: InputBorder.none,
          // contentPadding: EdgeInsets.symmetric(horizontal: 18),
          labelText: label,
          filled: true,
        ),
      ),
    );
  }
}

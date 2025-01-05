import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid/nanoid.dart';
import '../routes/route_names.dart';

class RTDBFirebase extends GetxController {
  var dbUsersTable = FirebaseDatabase.instance.ref("users");
  Future<void> addNewUser(
      {required String name,
      required String email,
      required int saldo,
      required String pin}) async {
    final userData = {
      "name": name,
      "email": email,
      "uniqueid": generateUniqueId(),
      "saldo": 75000,
      "pin": pin,
    };
    dbUsersTable.set(userData);
  }

  String generateUniqueId() {
    return nanoid(16);
  }
}

class LoginRegisterController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var hasErrorOccured = false.obs;

  void updateErrorOccured(bool value) {
    hasErrorOccured.value = value;
  }

  void clearAfterSubmit() {
    emailController.text = "";
    passwordController.text = "";
  }

  bool isFormInputValid() {
    return (EmailValidator.validate(emailController.text) == true) &&
        (passwordController.text.length >= 8) &&
        (nameController.text.length >= 5);
  }

  // Navigasi
  void navigateToHome() {
    Get.offNamed(RouteNames.home);
  }

  void navigateToRegister() {
    Get.toNamed(RouteNames.register);
  }

  void navigateToLogin() {
    Get.toNamed(RouteNames.login);
  }
}

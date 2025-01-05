import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_names.dart';

class LoginRegisterController extends GetxController {
  // Login
  var emailLoginCtrl = TextEditingController();
  var pwdLoginCtrl = TextEditingController();
  var errorFlaggedAfterSubmit = false.obs;

  void setErrorFlag(bool value) {
    errorFlaggedAfterSubmit.value = value;
  }

  void clearAfterLogin() {
    emailLoginCtrl.text = "";
    pwdLoginCtrl.text = "";
  }

  bool loginCredValid() {
    return (EmailValidator.validate(emailLoginCtrl.text) == true) &&
        (pwdLoginCtrl.text.length >= 8);
  }

  // Register
  var emailRegisterCtrl = TextEditingController();
  var pwdRegisterCtrl = TextEditingController();

  void clearAfterRegister() {
    emailRegisterCtrl.text = "";
    pwdRegisterCtrl.text = "";
  }

  bool registerCredValid() {
    return (EmailValidator.validate(emailRegisterCtrl.text) == true) &&
        (pwdRegisterCtrl.text.length >= 8);
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

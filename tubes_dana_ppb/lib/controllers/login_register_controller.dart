import 'package:get/get.dart';
import '../routes/route_names.dart';

class LoginRegisterController extends GetxController {
  void navigateToHome() {
    Get.offNamed(RouteNames.home);
  }

  void navigateToRegister() {
    Get.toNamed(RouteNames.register);
  }

  void navigateToLogin() {
    Get.toNamed(RouteNames.login);
  }
  // Tambahkan metode lainnya sesuai kebutuhan
}

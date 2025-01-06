import 'package:get/get.dart';
import '../routes/route_names.dart';

class HomeController extends GetxController {
  void navigateToProfile() {
    Get.toNamed(RouteNames.profile);
  }

  void navigateToHistory() {
    Get.toNamed(RouteNames.history);
  }

  void navigateToScan() {
    Get.toNamed(RouteNames.camera); // Pastikan ini mengarah ke CameraScreen
  }

  void navigateToSettings() {
    Get.toNamed(RouteNames.settings); // Menavigasi ke SettingsScreen
  }

  void navigateToTransfer() {
    // Implementasikan navigasi ke halaman transfer jika ada
  }
}

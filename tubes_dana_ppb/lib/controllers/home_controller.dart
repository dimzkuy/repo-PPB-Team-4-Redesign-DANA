import 'package:get/get.dart';
import '../routes/route_names.dart';

class HomeController extends GetxController {
  void navigateToProfile() {
    Get.toNamed(RouteNames.profile);
  }

  void navigateToHistory() {
    Get.toNamed(RouteNames.history);
  }

  // Tambahkan metode lainnya sesuai kebutuhan
}
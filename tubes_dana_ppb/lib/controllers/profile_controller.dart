import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login');
  }

  // Tambahkan metode lain sesuai kebutuhan
}

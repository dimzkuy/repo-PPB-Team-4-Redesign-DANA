import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Metode untuk menangani logika logout
  void logout() {
    // Implementasi logika logout, misalnya menghapus token atau informasi pengguna
    // Contoh: Hapus token dari penyimpanan
    // await storage.delete('userToken');

    // Setelah logout, navigasi kembali ke login screen
    Get.offAllNamed('/login'); // Ganti dengan nama route login yang sesuai
  }

  // Tambahkan metode lain sesuai kebutuhan
}

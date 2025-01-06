// Tetap digunakan
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_names.dart';

class QRController extends GetxController {
  /// Navigasi ke layar untuk menampilkan data QR
  /// Menggunakan `imageName` sebagai argumen
  void navigateToDisplayQR(String imageName) {
    Get.toNamed(RouteNames.displayQR, arguments: {'imageName': imageName});
  }

  /// Menangani QR code yang telah dipindai
  /// Menampilkan AlertDialog dengan informasi QR code
  void handleScannedQR(String qrCode, BuildContext context) {
    debugPrint('Handled QR Code: $qrCode');

    // Menampilkan dialog custom
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('QR Code Detected'),
          content: Text('Data: $qrCode'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

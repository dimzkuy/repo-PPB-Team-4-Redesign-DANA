import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayQRPage extends StatelessWidget {
  const DisplayQRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? imageName = Get.arguments['imageName']; // Ambil dari argumen

    // Pastikan imageName tidak null
    if (imageName == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('No image provided!'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tampilkan QR'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$imageName', // Menggunakan Image.asset untuk mengambil dari folder assets
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'QR Code Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DisplayQRPage extends StatelessWidget {
  const DisplayQRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tampilkan QR',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dummy QR code image
            Image.asset(
              'assets/images/dummy_qr.png', // Replace this with your QR code image path
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            // Instruction or description
            const Text(
              'QR Code Anda',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

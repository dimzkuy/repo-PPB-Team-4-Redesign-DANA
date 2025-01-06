import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/qr_controller.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();
  String? _capturedImagePath; // Untuk menyimpan path gambar yang diambil
  String? _scannedQRCode; // Untuk menyimpan hasil QR code
  bool _isProcessingQR = false; // Mencegah deteksi ganda

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _cameraController.initialize();
      setState(() {});
    } else {
      Get.snackbar('Error', 'No cameras available.');
    }
  }

  /// Fungsi untuk menangkap gambar dari kamera
  Future<void> _captureImage() async {
    await _initializeControllerFuture;
    final image = await _cameraController.takePicture();
    setState(() {
      _capturedImagePath = image.path; // Simpan path gambar kamera
    });
    _showCapturedImageDialog(); // Tampilkan dialog gambar
  }

  /// Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _capturedImagePath = pickedFile.path; // Simpan path gambar galeri
      });
      _showCapturedImageDialog(); // Tampilkan dialog gambar
    } else {
      Get.snackbar('Error', 'No image selected.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  /// Fungsi untuk menangani hasil QR code
  void _handleQRCodeDetected(String qrCode) {
    if (_isProcessingQR || qrCode == _scannedQRCode) return;

    setState(() {
      _isProcessingQR = true;
      _scannedQRCode = qrCode;
    });

    // Tampilkan dialog QR code
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('QR Code Detected'),
          content: Text('Data: $qrCode'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    // Reset setelah beberapa detik agar bisa scan ulang
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isProcessingQR = false; // Reset proses QR
        _scannedQRCode = null; // Reset data QR
      });
    });
  }

  /// Fungsi untuk menampilkan dialog gambar yang diambil
  void _showCapturedImageDialog() {
    if (_capturedImagePath != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Captured Image'),
            content: Image.file(
              File(_capturedImagePath!), // Tampilkan gambar
              fit: BoxFit.cover,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          TextButton(
            onPressed: () {
              // Navigasi ke halaman Display QR dengan dummy QR
              Get.find<QRController>()
                  .navigateToDisplayQR('assets/images/dummy_qr.png');
            },
            child: const Text('Tampilkan QR',
                style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcode) {
              if (barcode.barcodes.isNotEmpty) {
                final String? code = barcode.barcodes.first.rawValue;
                if (code != null) {
                  _handleQRCodeDetected(code);
                }
              }
            },
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  size: const Size(250, 250),
                  painter: CornerSolidBorderPainter(),
                ),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/images/qris_logo.png',
                  width: 100,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'camera_button',
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: _captureImage,
                    child: const Icon(Icons.camera_alt, color: Colors.white),
                  ),
                  FloatingActionButton(
                    heroTag: 'gallery_button',
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: _pickImageFromGallery,
                    child: const Icon(Icons.photo_library, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CornerSolidBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double cornerLength = 40;
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(const Offset(0, 0), Offset(cornerLength, 0), paint);
    canvas.drawLine(const Offset(0, 0), Offset(0, cornerLength), paint);
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width - cornerLength, 0), paint);
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width, cornerLength), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(cornerLength, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(0, size.height - cornerLength), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - cornerLength, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - cornerLength), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

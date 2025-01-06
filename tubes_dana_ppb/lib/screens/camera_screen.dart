import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import '../controllers/qr_controller.dart'; // Import the QRController
import '../routes/route_names.dart'; // Import RouteNames

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();
  String? _capturedImagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
    setState(() {}); // Memanggil setState untuk memperbarui UI
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _capturedImagePath = pickedFile.path;
      });
      Get.find<QRController>()
          .navigateToDisplayQR(pickedFile.name); // Menggunakan QRController
    } else {
      Get.snackbar('Error', 'No image selected.');
    }
  }

  Future<void> _captureImage() async {
    await _initializeControllerFuture;
    final image = await _controller.takePicture();
    setState(() {
      _capturedImagePath = image.path;
    });
    Get.find<QRController>()
        .navigateToDisplayQR(image.name); // Menggunakan QRController
  }

  @override
  void dispose() {
    _controller.dispose();
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
              Get.toNamed(RouteNames.camera); // Navigasi ke CameraScreen
            },
            child: const Text('Scan QR', style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(RouteNames.displayQR, arguments: {
                'imageName': 'dummy_qr.png' // Pastikan nama file yang benar
              });
            },
            child: const Text('Tampilkan QR',
                style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Stack(children: [
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
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
                'assets/images/qris_logo.png', // Logo QRIS
                width: 100,
              ),
            ],
          ),
        ),
        if (_capturedImagePath != null) // Menampilkan gambar yang diambil
          Positioned.fill(
            child: Image.file(File(_capturedImagePath!),
                fit: BoxFit.cover, color: Color.fromARGB(128, 0, 0, 0)),
            // colorBlendMode: BlendMode.darken,
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
      ]),
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

import 'package:get/get.dart';
import '../routes/route_names.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class QRController extends GetxController {
  void navigateToCamera() {
    Get.toNamed(RouteNames.camera);
  }

  // Mengubah parameter menjadi imageName
  void navigateToDisplayQR(String imageName) {
    Get.toNamed(RouteNames.displayQR, arguments: {'imageName': imageName});
  }
}

class CameraHandler extends GetxController {
  late CameraController cameraController;
  Future<void>? initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      cameraController = CameraController(cameras.first, ResolutionPreset.high);
      initializeControllerFuture = cameraController.initialize();
    } else {
      Get.snackbar('Error', 'No cameras available.');
    }
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Get.find<QRController>()
          .navigateToDisplayQR(pickedFile.name); // Menggunakan QRController
    } else {
      Get.snackbar('Error', 'No image selected.');
    }
  }

  Future<void> captureImage() async {
    await initializeControllerFuture;
    final image = await cameraController.takePicture();
    Get.find<QRController>()
        .navigateToDisplayQR(image.name); // Menggunakan QRController
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}

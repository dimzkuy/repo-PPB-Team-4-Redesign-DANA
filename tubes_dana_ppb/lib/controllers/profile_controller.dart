import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var profileImageUrl = ''.obs;
  var gender = 'Laki-laki'.obs;
  var selectedDate = Rx<DateTime?>(null);

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    loadProfile(); // Load data saat inisialisasi
  }

  Future<void> changeProfileImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final String path =
            '${directory.path}/profile_image_${DateTime.now().millisecondsSinceEpoch}.png';
        final File newImage = File(image.path);

        await newImage.copy(path);

        profileImageUrl.value = path;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('profileImageUrl', path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengganti foto: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.value.text);
    await prefs.setString('email', emailController.value.text);
    await prefs.setString('phone', phoneController.value.text);
    await prefs.setString('profileImageUrl', profileImageUrl.value);
    await prefs.setString('gender', gender.value);
    if (selectedDate.value != null) {
      await prefs.setString(
          'selectedDate', selectedDate.value!.toIso8601String());
    }
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    nameController.value.text = prefs.getString('name') ?? '';
    emailController.value.text = prefs.getString('email') ?? '';
    phoneController.value.text = prefs.getString('phone') ?? '';

    final savedImagePath = prefs.getString('profileImageUrl') ?? '';
    if (savedImagePath.isNotEmpty && File(savedImagePath).existsSync()) {
      profileImageUrl.value = savedImagePath;
    } else {
      profileImageUrl.value = '';
    }

    gender.value = prefs.getString('gender') ?? 'Laki-laki';

    final savedDate = prefs.getString('selectedDate');
    if (savedDate != null) {
      selectedDate.value = DateTime.parse(savedDate);
    }
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Logout Failed', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}

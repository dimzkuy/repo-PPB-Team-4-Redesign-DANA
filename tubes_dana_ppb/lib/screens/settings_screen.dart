import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../themes/color_themes.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: ColorThemes.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: profileController
                                  .profileImageUrl.value.isNotEmpty &&
                              File(profileController.profileImageUrl.value)
                                  .existsSync()
                          ? FileImage(
                              File(profileController.profileImageUrl.value))
                          : const AssetImage('assets/images/user-circle.svg')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: GestureDetector(
                        onTap: () async {
                          await profileController.changeProfileImage();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child:
                              const Icon(Icons.camera_alt, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20),
            _buildInputField(
              label: 'Nama',
              controller: profileController.nameController.value,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: 'Email',
              controller: profileController.emailController.value,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: 'Nomor Telepon',
              controller: profileController.phoneController.value,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            Obx(() {
              return DropdownButtonFormField<String>(
                value: profileController.gender.value,
                items: const [
                  DropdownMenuItem(
                      value: 'Laki-laki', child: Text('Laki-laki')),
                  DropdownMenuItem(
                      value: 'Perempuan', child: Text('Perempuan')),
                ],
                onChanged: (value) {
                  profileController.gender.value = value!;
                },
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              );
            }),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Tanggal Lahir'),
              subtitle: Obx(() {
                return Text(
                  profileController.selectedDate.value != null
                      ? '${profileController.selectedDate.value!.day}/${profileController.selectedDate.value!.month}/${profileController.selectedDate.value!.year}'
                      : 'Pilih tanggal',
                );
              }),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate:
                      profileController.selectedDate.value ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  profileController.selectedDate.value = pickedDate;
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await profileController.saveProfile();
                Get.snackbar(
                  'Sukses',
                  'Data berhasil disimpan!',
                  snackPosition: SnackPosition.BOTTOM,
                );
                // Navigasi kembali ke halaman Home setelah menyimpan
                Get.offAllNamed('/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorThemes.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'Simpan',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

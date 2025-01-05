import 'package:flutter/material.dart';
import '../themes/color_themes.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime? _selectedDate;
  String? _gender;

  void _saveProfile() {
    // Simpan perubahan profil
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: ColorThemes.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Foto Profil
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage('assets/profile_placeholder.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.grey),
                      onPressed: () {
                        // Tambahkan fitur upload foto profil
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Nama
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            const SizedBox(height: 10),

            // ID User
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'ID User'),
            ),
            const SizedBox(height: 10),

            // Email
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),

            // No Handphone
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'No Handphone'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),

            // Tanggal Lahir
            ListTile(
              title: const Text('Tanggal Lahir'),
              subtitle: Text(
                _selectedDate != null
                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    : 'Pilih tanggal',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 10),

            // Jenis Kelamin
            DropdownButtonFormField<String>(
              value: _gender,
              items: const [
                DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
                DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
              ],
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
            ),
            const SizedBox(height: 20),

            // Tombol Simpan
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorThemes.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

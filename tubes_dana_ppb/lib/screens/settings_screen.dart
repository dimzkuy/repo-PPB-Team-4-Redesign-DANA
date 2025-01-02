import 'package:flutter/material.dart';
import '../themes/color_themes.dart'; // Import ColorThemes

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: ColorThemes.primaryColor,
      ),
      body: Center(
        child: const Text('Settings Screen'),
      ),
    );
  }
}

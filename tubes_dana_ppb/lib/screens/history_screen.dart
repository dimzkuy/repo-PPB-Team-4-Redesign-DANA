import 'package:flutter/material.dart';
import '../themes/color_themes.dart'; // Import ColorThemes

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        backgroundColor: ColorThemes.primaryColor, // Menggunakan warna primer
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Transaction 1')),
          ListTile(title: Text('Transaction 2')),
          ListTile(title: Text('Transaction 3')),
        ],
      ),
    );
  }
}

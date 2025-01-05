import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../routes/route_names.dart';
import '../controllers/home_controller.dart';
import '../themes/color_themes.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: controller.navigateToProfile,
            ),
            Image.asset(
              'assets/icon/icon_dana_splash_screen.png',
              height: 40,
              fit: BoxFit.contain,
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Navigasi ke halaman notifikasi
              },
            ),
          ],
        ),
        backgroundColor: ColorThemes.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 20),
            _buildFeatureButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    // Implementasi balance card sesuai kebutuhan
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo Anda: Rp 1,000,000', // Contoh saldo
              style: GoogleFonts.poppins(
                  fontSize: 16, color: ColorThemes.textColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButtons() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.1,
      children: [
        _buildFeatureButton(FontAwesomeIcons.message, 'Transfer', () {
          // Implementasi navigasi ke halaman transfer
        }),
        _buildFeatureButton(FontAwesomeIcons.history, 'History', () {
          controller.navigateToHistory();
        }),
        _buildFeatureButton(FontAwesomeIcons.qrcode, 'Scan', () {
          // Implementasi proses pembayaran via QR Code
        }),
        _buildFeatureButton(FontAwesomeIcons.gear, 'Settings', () {
          Get.toNamed(RouteNames.settings);
        }),
      ],
    );
  }

  Widget _buildFeatureButton(
      IconData icon, String label, VoidCallback onPressed) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: ColorThemes.primaryColor,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: ColorThemes.textColor),
            ),
          ],
        ),
      ),
    );
  }
}

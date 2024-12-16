import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';
import '../design_system/styles/button_systems.dart';
import 'profile_screen.dart'; // Import ProfileScreen
import 'history_screen.dart'; // Import HistoryScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index untuk BottomNavigationBar

  // Daftar halaman yang akan ditampilkan
  final List<Widget> _pages = [
    HomeContent(), // Konten Beranda
    HistoryScreen(), // Halaman Histori
    ProfileScreen(), // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Mengubah item yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomPaletteColors.background,
      body: SafeArea(
        child: _pages[_selectedIndex], // Tampilkan halaman yang dipilih
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(FontAwesomeIcons.home, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(FontAwesomeIcons.history, size: 20),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user, size: 20),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CustomPaletteColors.secondary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Widget konten Beranda
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  'assets/icon/DANA_icon_blue.png',
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                // Section Saldo
                Card(
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: CustomPaletteColors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Balance',
                            style: CustomTypography.bodyText1
                                .copyWith(color: Colors.white)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Rp 1,000,000',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.qrcode,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                // Aksi ketika tombol QR ditekan
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonSystems.payNowButton(() {
                              // Tindakan ketika tombol Pay Now ditekan
                            }),
                            ButtonSystems.topUpButton(() {
                              // Tindakan ketika tombol Top Up ditekan
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Tombol Aksi
                Container(
                  padding: EdgeInsets.all(8),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                    children: [
                      // ignore: deprecated_member_use
                      _buildActionButton(FontAwesomeIcons.tint, 'Water'),
                      _buildActionButton(
                          // ignore: deprecated_member_use
                          FontAwesomeIcons.university, 'Send To Bank'),
                      _buildActionButton(
                          // ignore: deprecated_member_use
                          FontAwesomeIcons.userFriends, 'Send to Contact'),
                      _buildActionButton(FontAwesomeIcons.lightbulb, 'Light'),
                      _buildActionButton(
                          FontAwesomeIcons.wallet, 'Cash Withdrawal'),
                      _buildActionButton(
                          // ignore: deprecated_member_use
                          FontAwesomeIcons.mobileAlt, 'Credit & Data'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Section Rekaman Keuangan
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Financial Records',
                            style: CustomTypography.bodyText1),
                        SizedBox(height: 8),
                        Text('1 Nov 2024 - 30 Nov 2024',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Income',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Rp ***',
                                    style: TextStyle(
                                        color: CustomPaletteColors.accent)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Expenditure',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('Rp ***',
                                    style: TextStyle(
                                        color: CustomPaletteColors.accent)),
                              ],
                            ),
                            ButtonSystems.showButton(() {
                              // Tindakan ketika tombol Show ditekan
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Spacer untuk BottomNavigationBar
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: CustomPaletteColors.secondary,
            child: Icon(icon, color: Colors.white, size: 16),
          ),
          SizedBox(height: 8),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomPaletteColors.textPrimary,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

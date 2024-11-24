import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../design_system/styles/custom_palette_colors.dart';
import '../design_system/styles/custom_typography.dart';
import '../design_system/styles/button_systems.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBalanceVisible = false; // State untuk menampilkan saldo

  void _toggleBalanceVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible; // Toggle visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomPaletteColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('DANA', style: CustomTypography.headline1),
            floating: true,
            centerTitle: true,
            backgroundColor: CustomPaletteColors.primary,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Balance Section
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: CustomPaletteColors.accent,
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
                            Text(
                              _isBalanceVisible
                                  ? 'Rp 1,000,000'
                                  : 'Rp ***', // Tampilkan saldo atau ***
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(
                                _isBalanceVisible
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                color: Colors.white,
                              ),
                              onPressed:
                                  _toggleBalanceVisibility, // Mengubah visibilitas saldo
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Action Buttons
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: [
                      _buildActionButton(FontAwesomeIcons.water, 'Water'),
                      _buildActionButton(FontAwesomeIcons.bank, 'Send To Bank'),
                      _buildActionButton(
                          FontAwesomeIcons.userFriends, 'Send To Contact'),
                      _buildActionButton(FontAwesomeIcons.lightbulb, 'Light'),
                      _buildActionButton(
                          FontAwesomeIcons.wallet, 'Cash Withdrawal'),
                      _buildActionButton(
                          FontAwesomeIcons.mobileAlt, 'Credit & Data'),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Financial Records Section
                  Text('Financial Records', style: CustomTypography.bodyText1),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Rp ***',
                              style:
                                  TextStyle(color: CustomPaletteColors.accent)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expenditure',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Rp ***',
                              style:
                                  TextStyle(color: CustomPaletteColors.accent)),
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
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: CustomPaletteColors.secondary,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: CustomPaletteColors.textPrimary)),
      ],
    );
  }
}

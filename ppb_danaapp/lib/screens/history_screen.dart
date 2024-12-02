import 'package:flutter/material.dart';
import 'package:ppb_danaapp/design_system/styles/custom_palette_colors.dart'; // Ganti dengan path yang sesuai

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomPaletteColors.background,
        body: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTransactionList(), // Tab 1
                  _buildTransactionList(), // Tab 2 (ganti dengan data sesuai kebutuhan)
                  _buildTransactionList(), // Tab 3 (ganti dengan data sesuai kebutuhan)
                ],
              ),
            ),
            _buildPrintButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(text: 'All'),
        Tab(text: 'Income'),
        Tab(text: 'Expenses'),
      ],
      indicatorColor: CustomPaletteColors.accent,
      labelColor: CustomPaletteColors.primary,
      unselectedLabelColor: CustomPaletteColors.textSecondary,
    );
  }

  Widget _buildTransactionList() {
    // Dummy data for transactions
    List<Map<String, String>> transactions = [
      {'title': 'Grocery Store', 'amount': '\$30.00'},
      {'title': 'Uber', 'amount': '\$15.00'},
      {'title': 'Amazon', 'amount': '\$20.00'},
      {'title': 'Starbucks', 'amount': '\$5.00'},
    ];

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactions[index]['title']!,
                style: TextStyle(
                  color: CustomPaletteColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                transactions[index]['amount']!,
                style: TextStyle(
                  color: CustomPaletteColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPrintButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomPaletteColors.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // Action for print receipt
        },
        child: Text(
          'Print E-Receipt',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
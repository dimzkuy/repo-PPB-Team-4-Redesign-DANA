import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transaction History'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All Transactions'),
              Tab(text: 'Income'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TransactionListView(filter: 'all'),
            TransactionListView(filter: 'income'),
          ],
        ),
      ),
    );
  }
}

class TransactionListView extends StatelessWidget {
  final String filter;

  const TransactionListView({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy transaction data
    final List<Map<String, String>> transactions = [
      {'date': '2025-01-01', 'description': 'Coffee Shop', 'amount': '-\$5.00'},
      {'date': '2025-01-02', 'description': 'Salary', 'amount': '+\$1500.00'},
      {'date': '2025-01-03', 'description': 'Groceries', 'amount': '-\$75.20'},
      {
        'date': '2025-01-04',
        'description': 'Electricity Bill',
        'amount': '-\$50.00'
      },
      {
        'date': '2025-01-05',
        'description': 'Gym Membership',
        'amount': '-\$25.00'
      },
    ];

    // Filter transactions based on the filter parameter
    final filteredTransactions = transactions.where((transaction) {
      if (filter == 'income') {
        return transaction['amount']!.startsWith('+');
      }
      return true; // Show all transactions for 'all'
    }).toList();

    return ListView.builder(
      itemCount: filteredTransactions.length,
      itemBuilder: (context, index) {
        final transaction = filteredTransactions[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: transaction['amount']!.startsWith('-')
                  ? Colors.red
                  : Colors.green,
              child: Icon(
                transaction['amount']!.startsWith('-')
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
            title: Text(transaction['description'] ?? 'Unknown'),
            subtitle: Text(transaction['date'] ?? 'Unknown'),
            trailing: Text(
              transaction['amount'] ?? '',
              style: TextStyle(
                color: transaction['amount']!.startsWith('-')
                    ? Colors.red
                    : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

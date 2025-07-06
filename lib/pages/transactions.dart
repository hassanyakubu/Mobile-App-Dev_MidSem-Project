import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactionHistory = [
      {
        'title': 'MTN Airtime',
        'date': '2025-06-28',
        'amount': -10.0,
        'type': 'Debit',
        'icon': Icons.phone_android,
      },
      {
        'title': 'Transfer to Kojo',
        'date': '2025-06-27',
        'amount': -150.0,
        'type': 'Debit',
        'icon': Icons.send,
      },
      {
        'title': 'Salary Credit',
        'date': '2025-06-25',
        'amount': 2000.0,
        'type': 'Credit',
        'icon': Icons.attach_money,
      },
      {
        'title': 'Water Bill',
        'date': '2025-06-22',
        'amount': -40.0,
        'type': 'Debit',
        'icon': Icons.water_drop,
      },
      {
        'title': 'TV Subscription',
        'date': '2025-06-20',
        'amount': -60.0,
        'type': 'Debit',
        'icon': Icons.tv,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: ListView.separated(
        itemCount: transactionHistory.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final tx = transactionHistory[index];
          final isCredit = tx['amount'] > 0;
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: isCredit ? Colors.green.shade100 : Colors.red.shade100,
              child: Icon(
                tx['icon'],
                color: isCredit ? Colors.green : Colors.red,
              ),
            ),
            title: Text(tx['title']),
            subtitle: Text(tx['date']),
            trailing: Text(
              "${isCredit ? '+' : '-'}GHS ${tx['amount'].abs().toStringAsFixed(2)}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isCredit ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Accounts extends StatelessWidget {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accounts = [
      {
        'type': 'Savings Account',
        'number': '9040013339664',
        'balance': 5620.00,
        'currency': 'GHS',
        'icon': Icons.savings,
      },
      {
        'type': 'Current Account',
        'number': '9040012228897',
        'balance': 1450.75,
        'currency': 'GHS',
        'icon': Icons.account_balance,
      },
      {
        'type': 'USD Account',
        'number': '9040017771112',
        'balance': 320.00,
        'currency': 'USD',
        'icon': Icons.attach_money,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Accounts'),
      ),
      body: ListView.separated(
        itemCount: accounts.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final account = accounts[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: ListTile(
              leading: Icon(account['icon'], size: 32, color: Colors.blue),
              title: Text(
                account['type'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Acc No: ${account['number']}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${account['currency']} ${account['balance'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text('Available'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

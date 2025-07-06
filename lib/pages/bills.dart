import 'package:flutter/material.dart';

class Bills extends StatefulWidget {
  const Bills({super.key});

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  final _formKey = GlobalKey<FormState>();
  final _accountController = TextEditingController();
  final _amountController = TextEditingController();

  String _selectedBill = 'Electricity';

  final List<String> _billTypes = [
    'Electricity',
    'Water',
    'Internet',
    'TV Subscription',
    'School Fees',
  ];

  void _submitPayment() {
    if (_formKey.currentState!.validate()) {
      // Optionally: Save transaction in memory

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$_selectedBill bill paid successfully!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _accountController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedBill,
                items: _billTypes
                    .map((bill) => DropdownMenuItem(
                          value: bill,
                          child: Text(bill),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBill = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Select Bill Type',
                  prefixIcon: Icon(Icons.receipt_long),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _accountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Customer/Account Number',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter account number' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount (GHS)',
                  prefixIcon: Icon(Icons.money),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final amount = double.tryParse(value ?? '');
                  if (amount == null || amount <= 0) {
                    return 'Enter a valid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.payment),
                  label: const Text('Pay Now'),
                  onPressed: _submitPayment,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _accountOrNumberController = TextEditingController();
  final _amountController = TextEditingController();

  String _transferType = 'Bank Account';
  String _selectedDestination = 'Bank of Ghana';

  final List<String> _transferTypes = ['Bank Account', 'Mobile Money'];

  final List<String> _banks = [
    'Bank of Ghana',
    'CalBank',
    'Ecobank',
    'GCB Bank',
    'Fidelity Bank',
    'Zenith Bank',
  ];

  final List<String> _wallets = [
    'MTN Mobile Money',
    'Vodafone Cash',
    'AirtelTigo Money',
  ];

  void _submitTransfer() {
    if (_formKey.currentState!.validate()) {
      // Example: Save or process transaction
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transfer successful!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _recipientController.dispose();
    _accountOrNumberController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final destinations =
        _transferType == 'Bank Account' ? _banks : _wallets;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Funds'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Transfer Type Selector
              DropdownButtonFormField<String>(
                value: _transferType,
                items: _transferTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _transferType = value!;
                    _selectedDestination =
                        _transferType == 'Bank Account' ? _banks[0] : _wallets[0];
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Transfer Type',
                  prefixIcon: Icon(Icons.swap_horiz),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Destination Bank or Wallet
              DropdownButtonFormField<String>(
                value: _selectedDestination,
                items: destinations
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDestination = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: _transferType == 'Bank Account'
                      ? 'Select Bank'
                      : 'Select Mobile Wallet',
                  prefixIcon: const Icon(Icons.account_balance_wallet),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Recipient Name
              TextFormField(
                controller: _recipientController,
                decoration: const InputDecoration(
                  labelText: 'Recipient Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter recipient name' : null,
              ),
              const SizedBox(height: 16),

              // Account Number or Phone Number
              TextFormField(
                controller: _accountOrNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: _transferType == 'Bank Account'
                      ? 'Account Number'
                      : 'Phone Number',
                  prefixIcon: Icon(_transferType == 'Bank Account'
                      ? Icons.numbers
                      : Icons.phone_android),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter a valid number' : null,
              ),
              const SizedBox(height: 16),

              // Amount
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

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text('Send Money'),
                  onPressed: _submitTransfer,
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

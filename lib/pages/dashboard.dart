import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isBalanceVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountSummary(),
            const SizedBox(height: 24),
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildQuickActions(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildAccountSummary() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HASSAN MALTITI YAKUBU',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            const Text('Account No: 9040013339664'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Balance: ${_isBalanceVisible ? "GHS 5,620.00" : "GHS ****"}',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: Icon(
                    _isBalanceVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _isBalanceVisible = !_isBalanceVisible;
                    });
                  },
                ),
              ],
            ),
            Text(
              'Latest Balance: ${_isBalanceVisible ? "GHS 5,620.00" : "GHS ****"}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildActionTile(
          icon: Icons.send,
          label: 'Transfer',
          onTap: () => Navigator.pushNamed(context, '/transfer'),
        ),
        _buildActionTile(
          icon: Icons.receipt,
          label: 'Bills',
          onTap: () => Navigator.pushNamed(context, '/bills'),
        ),
        _buildActionTile(
          icon: Icons.account_balance_wallet,
          label: 'Accounts',
          onTap: () => Navigator.pushNamed(context, '/accounts'),
        ),
        _buildActionTile(
          icon: Icons.history,
          label: 'Transactions',
          onTap: () => Navigator.pushNamed(context, '/transactions'),
        ),
      ],
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue.shade100,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.blue.shade900),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        // Implement navigation if needed
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Manage'),
        BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Transact'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Buy'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
      ],
    );
  }
}

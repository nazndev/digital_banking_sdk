// lib/src/digital_bank_dashboard.dart
import 'package:flutter/material.dart';
import 'account_management.dart';
import 'transactions.dart';
import 'balance_inquiries.dart';

class DigitalBankDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Bank Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.switch_account),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SwitchDigitalBankScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildDashboardItem(context, 'Create Account', Icons.account_circle, () => _createAccount(context)),
          _buildDashboardItem(context, 'Transfer Money', Icons.send, () => _transferMoney(context)),
          _buildDashboardItem(context, 'Check Balance', Icons.account_balance_wallet, () => _checkBalance(context)),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 48.0),
            SizedBox(height: 16.0),
            Text(title, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }

  void _createAccount(BuildContext context) {
    AccountManagement accountManagement = AccountManagement();
    accountManagement.createAccount('Nazmul Nazim', 'nazim@example.com');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Account created for Nazmul Nazim')),
    );
  }

  void _transferMoney(BuildContext context) {
    Transactions transactions = Transactions();
    transactions.transferMoney(100.0, 'Account1', 'Account2');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Transferred 100.0 from Account1 to Account2')),
    );
  }

  void _checkBalance(BuildContext context) async {
    BalanceInquiries balanceInquiries = BalanceInquiries();
    double balance = await balanceInquiries.getBalance('Account1');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Current balance: $balance')),
    );
  }
}

class SwitchDigitalBankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Digital Bank'),
      ),
      body: Center(
        child: Text('Here you can switch between different digital banks'),
      ),
    );
  }
}

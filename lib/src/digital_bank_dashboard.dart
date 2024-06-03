import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'account_management.dart';
import 'transactions.dart';
import 'balance_inquiries.dart';

class DigitalBankDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nagad Digital Bank Dashboard'),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.exchangeAlt),
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
          _buildDashboardItem(context, 'Create Account', FontAwesomeIcons.user, () => _createAccount(context)),
          _buildDashboardItem(context, 'Transfer Money', FontAwesomeIcons.moneyBillWave, () => _transferMoney(context)),
          _buildDashboardItem(context, 'Check Balance', FontAwesomeIcons.wallet, () => _checkBalance(context)),
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
            FaIcon(icon, size: 48.0),
            SizedBox(height: 16.0),
            Text(title, style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }

  void _createAccount(BuildContext context) {
    AccountManagement accountManagement = AccountManagement();
    accountManagement.createAccount('Nazmul Nazim', 'nazmul.nazim@nagad.com.bd');
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

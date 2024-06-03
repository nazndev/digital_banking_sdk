import 'package:flutter/material.dart';
import 'package:digital_banking_sdk/digital_banking_sdk.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Bank SDK Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DigitalBankDashboard(),
    );
  }
}

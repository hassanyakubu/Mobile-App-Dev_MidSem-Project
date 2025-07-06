import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/dashboard.dart';
import 'pages/transfer.dart';
import 'pages/bills.dart';
import 'pages/accounts.dart';
import 'pages/transactions.dart';

void main() {
  runApp(const MyBankApp());
}

class MyBankApp extends StatelessWidget {
  const MyBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stanbic Bank App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/dashboard': (context) => const Dashboard(),
        '/transfer': (context) => const Transfer(),
        '/bills': (context) => const Bills(),
        '/accounts': (context) => const Accounts(),
        '/transactions': (context) => const Transactions(),
      },
    );
  }
}

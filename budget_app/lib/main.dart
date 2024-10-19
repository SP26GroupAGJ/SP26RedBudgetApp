import 'package:budget_app/budget_page.dart';
import 'package:budget_app/create_acct_page.dart';
import 'package:budget_app/login_page.dart';
import 'package:budget_app/home_page.dart';
import 'package:budget_app/settings_page.dart';
import 'package:budget_app/spending_page.dart';
import 'package:budget_app/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:budget_app/database_helper.dart';

void main() {
  DatabaseHelper myDBHelper = DatabaseHelper();
  myDBHelper.connectDatabase();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build (BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: LoginPage(),
        routes: {
          '/login': (context) => HomePage(),
          '/logout': (context) => LoginPage(),
          '/create_accnt': (context) => CreateAcctPage(),
          '/settings': (context) => SettingsPage(),
          '/transactions': (context) => TransactionsPage(),
          '/bugdet': (context) => BudgetPage(),
          '/spending': (context) => SpendingPage(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

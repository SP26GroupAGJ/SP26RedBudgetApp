import 'package:budget_app/budget_page.dart';
import 'package:budget_app/settings_page.dart';
import 'package:budget_app/spending_page.dart';
import 'package:budget_app/transactions_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = BudgetPage();
        break;
      case 1:
        page = TransactionsPage();
        break;
      case 2:
        page = SpendingPage();
        break;
      case 3:
        page = SettingsPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        indicatorColor: Colors.blueGrey,
        selectedIndex: selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
              icon: Icon(Icons.monetization_on), label: 'Budget'),
          NavigationDestination(
              icon: Icon(Icons.account_balance), label: 'Transactions'),
          NavigationDestination(
              icon: Icon(Icons.ssid_chart), label: 'Spending'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: [
        BudgetPage(),
        TransactionsPage(),
        SpendingPage(),
        SettingsPage()
      ][selectedIndex],
    );
  }
}

/*
NavigationRail(
        extended: false,
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.monetization_on),
            label: Text('Budget'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.account_balance),
            label: Text('Transactions'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.ssid_chart),
            label: Text('Spending'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.settings),
            label: Text('Settings'),
          ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      */
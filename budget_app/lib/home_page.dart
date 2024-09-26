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
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indicatorColor: Theme.of(context).colorScheme.inversePrimary,
          selectedIndex: selectedIndex,
          destinations: <Widget>[
            NavigationDestination(
                icon: Icon(Icons.monetization_on,
                    color: Theme.of(context).colorScheme.secondary),
                label: 'Budget'),
            NavigationDestination(
                icon: Icon(Icons.account_balance,
                    color: Theme.of(context).colorScheme.secondary),
                label: 'Transactions'),
            NavigationDestination(
                icon: Icon(Icons.ssid_chart,
                    color: Theme.of(context).colorScheme.secondary),
                label: 'Spending'),
            NavigationDestination(
                icon: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.secondary),
                label: 'Settings'),
          ],
        ),
        body: [
          BudgetPage(),
          TransactionsPage(),
          SpendingPage(),
          SettingsPage(),
        ][selectedIndex]);
  }
}

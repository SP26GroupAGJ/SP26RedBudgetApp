import 'package:budget_app/transcation_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SpendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/logout');
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                Text('Spending Data'),
                /*
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return TransactionCard(
                      alignment: Alignment.centerRight,
                      amount: 10.99,
                      date: DateTime.now(),
                      category: 'Groceries');
                  },
                )
                */
              ],
            ),
          ),
          Text(
            '',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}

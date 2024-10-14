import 'package:budget_app/transaction_card.dart';
import 'package:budget_app/transaction_card_entity.dart';
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
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return TransactionCard(
                  entity: TransactionCardEntity(
                      category: "Grocery",
                      amount: 20.00,
                      date: DateTime(2023, 10, 13),
                      id: "1"),
                  alignment: Alignment.center);
            }));
  }
}

import 'dart:convert';

import 'package:budget_app/transaction_card.dart';
import 'package:budget_app/transaction_card_entity.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<TransactionCardEntity> _transactionsList = [];
  _loadInitTransactions(context) async {
    String response = await DefaultAssetBundle.of(context)
        .loadString('assets/mock_transactions.json');
    final List<dynamic> decodedList = jsonDecode(response) as List;
    final List<TransactionCardEntity> transactions =
        decodedList.map((listItem) {
      return TransactionCardEntity.fromJson(listItem);
    }).toList();

    setState(() {
      _transactionsList = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadInitTransactions(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(style: TextStyle(fontSize: 18), 'Recent Transactions'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/logout');
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _transactionsList.length,
                  itemBuilder: (context, index) {
                    return TransactionCard(
                        entity: _transactionsList[index],
                        alignment: Alignment.center);
                  }),
            ),
          ],
        ));
  }
}

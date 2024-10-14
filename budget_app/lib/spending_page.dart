import 'dart:convert';
import 'package:budget_app/transaction_card.dart';
import 'package:budget_app/transaction_card_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpendingPage extends StatefulWidget {
  @override
  State<SpendingPage> createState() => _SpendingPageState();
}

class _SpendingPageState extends State<SpendingPage> {
  List<TransactionCardEntity> _transactionsList = [];
  _loadInitTransactions(context) async {
    String response = await DefaultAssetBundle.of(context)
        .loadString('assets/mock_transactions.json');
    final List<dynamic> decodedList = jsonDecode(response) as List;
    print(response);
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
            itemCount: _transactionsList.length,
            itemBuilder: (context, index) {
              return TransactionCard(
                  entity: _transactionsList[index],
                  alignment: Alignment.center);
            }));
  }
}

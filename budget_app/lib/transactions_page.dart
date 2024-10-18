import 'dart:convert';

import 'package:budget_app/transaction_card.dart';
import 'package:budget_app/transaction_card_entity.dart';
import 'package:flutter/material.dart';

enum DateLabel {
  week('Week', 7),
  month('Month', 30),
  year('Year', 365),
  ninety('Last 3 Months', 90);

  const DateLabel(this.label, this.days);
  final String label;
  final int days;
}

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
    final TextEditingController dateController = TextEditingController();
    DateLabel? selectedDate;
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
            Text('Transaction Date Range:'),
            DropdownMenu<DateLabel>(
              initialSelection: DateLabel.ninety,
              controller: dateController,
              label: const Text('Date'),
              onSelected: (DateLabel? date) {
                setState(() {
                  selectedDate = date;
                });
              },
              dropdownMenuEntries: DateLabel.values
                  .map<DropdownMenuEntry<DateLabel>>((DateLabel days) {
                return DropdownMenuEntry<DateLabel>(
                  value: days,
                  label: days.label,
                );
              }).toList(),
            ),
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

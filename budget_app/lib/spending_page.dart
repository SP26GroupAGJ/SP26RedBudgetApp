import 'dart:convert';
import 'package:budget_app/transaction_card.dart';
import 'package:budget_app/transaction_card_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpendingPage extends StatefulWidget {
  @override
  State<SpendingPage> createState() => _SpendingPageState();
}

class _SpendingPageState extends State<SpendingPage> {
  List<TransactionCardEntity> _transactionsList = [];
  List<BarChartGroupData> _spendingBars = [];
  final barWidth = 8.0;

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

/*
  List<String> _getIntervalGroups (List<TransactionCardEntity> transacts) {
    
  }
*/

  List<BarChartGroupData> _buildBars(List<TransactionCardEntity> transacts,
      List<TransactionCardEntity> transactions) {
    List<BarChartGroupData> bars = [];
    if (transacts.length == 0 || transactions.length == 0) {
      return bars;
    }
    print(_spendingBars.length);
    List<double> catgTotals = [];
    print(catgTotals);
    transacts.forEach((budget) {
      double catSum = 0;
      transactions.forEach((transact) {
        if (transact.category == budget.category) {
          catSum += transact.amount;
        }
      });
      catgTotals.add(catSum);
    });

    for (int i = 0; i < catgTotals.length; i++) {
      bars.add(makeGroupData(i, transacts[i].amount, catgTotals[i]));
    }
    return bars;
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    Color colorComp = Colors.grey;
    if (y1 < y2) {
      colorComp = Colors.red;
    } else {
      colorComp = Colors.lightGreen;
    }
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(toY: y1, width: barWidth),
      BarChartRodData(toY: y2, color: colorComp, width: barWidth),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    _loadInitTransactions(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(style: TextStyle(fontSize: 18), 'Spending Analysis'),
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
            SizedBox(
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceDim,
                    ),
                    child: Text('Chart here'),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
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

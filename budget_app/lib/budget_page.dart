import 'dart:convert';

import 'package:budget_app/budget_card.dart';
import 'package:budget_app/budget_card_entity.dart';
import 'package:budget_app/transaction_card_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  List<BudgetCardEntity> _budgetList = [];
  List<TransactionCardEntity> _transactionsList = [];
  List<BarChartGroupData> _budgetBars = [];
  final barWidth = 8.0;

  _loadInitBudgets(context) async {
    String response = await DefaultAssetBundle.of(context)
        .loadString('assets/mock_budgets.json');
    final List<dynamic> decodedList = jsonDecode(response) as List;
    final List<BudgetCardEntity> budgets = decodedList.map((listItem) {
      return BudgetCardEntity.fromJson(listItem);
    }).toList();

    setState(() {
      _budgetList = budgets;
    });
  }

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

  List<String> _getBudgetCategories(List<BudgetCardEntity> budgets) {
    List<String> catgs = [];
    budgets.forEach((budget) {
      catgs.add(budget.category);
    });
    return catgs.toSet().toList();
  }

  List<BarChartGroupData> _buildBars(List<BudgetCardEntity> budgets,
      List<TransactionCardEntity> transactions) {
    List<BarChartGroupData> bars = [];
    if (budgets.length == 0 || transactions.length == 0) {
      return bars;
    }
    print(_budgetBars.length);
    List<double> catgTotals = [];
    print(catgTotals);
    budgets.forEach((budget) {
      double catSum = 0;
      transactions.forEach((transact) {
        if (transact.category == budget.category) {
          catSum += transact.amount;
        }
      });
      catgTotals.add(catSum);
    });

    for (int i = 0; i < catgTotals.length; i++) {
      bars.add(makeGroupData(i, budgets[i].total, catgTotals[i]));
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
    _loadInitBudgets(context);
    _loadInitTransactions(context);
    var bars = _buildBars(_budgetList, _transactionsList);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(style: TextStyle(fontSize: 18), 'Budget Tracking'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/logout');
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                          'Spending vs Targets'),
                      SizedBox(width: 20),
                      IconButton(
                          onPressed: () {
                            print('Icon press');
                          },
                          icon: const Icon(
                            Icons.notifications_outlined,
                            size: 30,
                          ))
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 3,
                  width: MediaQuery.sizeOf(context).width - 40,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: BarChart(
                      BarChartData(
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              getTitlesWidget: getTitles,
                            ),
                          ),
                          leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
                        alignment: BarChartAlignment.spaceAround,
                        barGroups: bars,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          print('Icon press');
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {
                          print('Icon press');
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/api');
                        },
                        icon: const Icon(
                          Icons.sync,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {
                          print('Icon press');
                        },
                        icon: const Icon(
                          Icons.more_horiz,
                          size: 30,
                        ))
                  ],
                ),
              ),
              Divider(),
              Text(style: TextStyle(fontSize: 24), 'Categories'),
              Expanded(
                child: ListView.builder(
                    itemCount: _budgetList.length,
                    itemBuilder: (context, index) {
                      return BudgetCard(
                        entity: _budgetList[index],
                      );
                    }),
              ),
            ],
          ),
        ));
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis);
    final titles = _getBudgetCategories(_budgetList);

    final Widget text = SizedBox(
      width: 50,
      child: Text(
        titles[value.toInt()],
        style: style,
      ),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 14,
      child: text,
    );
  }
}

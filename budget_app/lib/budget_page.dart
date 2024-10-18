import 'dart:convert';

import 'package:budget_app/budget_card.dart';
import 'package:budget_app/budget_card_entity.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  List<BudgetCardEntity> _budgetList = [];
  _loadInitBudgets(context) async {
    String response = await DefaultAssetBundle.of(context)
        .loadString('assets/mock_budgets.json');
    final List<dynamic> decodedList = jsonDecode(response) as List;
    final List<BudgetCardEntity> transactions = decodedList.map((listItem) {
      return BudgetCardEntity.fromJson(listItem);
    }).toList();

    setState(() {
      _budgetList = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadInitBudgets(context);
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceDim,
                  ),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height / 3,
                    width: MediaQuery.sizeOf(context).width - 40,
                    child: Text('bar graph here'),
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
                          print('Icon press');
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
}

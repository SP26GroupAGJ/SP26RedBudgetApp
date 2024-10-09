import 'package:budget_app/models/transaction_card_entity.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final TransactionCardEntity entity;
  final Alignment alignment;

  const TransactionCard(
      {Key? key, required this.alignment, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: Container(
          child: Column(
            children: [
              Text(
                'Category: ${entity.category}}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Transaction Date: ${entity.date}}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Amount: ${entity.amount}}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ));
  }
}

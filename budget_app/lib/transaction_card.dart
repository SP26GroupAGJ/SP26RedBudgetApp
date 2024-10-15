import 'package:budget_app/transaction_card_entity.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final TransactionCardEntity entity;
  final Alignment alignment;

  const TransactionCard(
      {super.key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 223, 223, 223),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          padding: EdgeInsets.all(24),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    entity.category,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: Text('${entity.date}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center),
                ),
                VerticalDivider(),
                Expanded(
                  child: Text('${entity.amount}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.right),
                ),
              ],
            ),
          ),
        ));
  }
}

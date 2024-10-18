import 'package:budget_app/budget_card_entity.dart';
import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  final BudgetCardEntity entity;

  const BudgetCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 240, 240),
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
              child: Text('${entity.startDate}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
            ),
            VerticalDivider(),
            Expanded(
              child: Text('${entity.total}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.right),
            ),
          ],
        ),
      ),
    );
  }
}

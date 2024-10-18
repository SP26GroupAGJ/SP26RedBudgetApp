import 'package:flutter/material.dart';

class TextButtonCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const TextButtonCard(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.surface),
            child: TextButton(
              onPressed: () {
                print('sample');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inverseSurface),
                      title),
                  Text(
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      subtitle)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

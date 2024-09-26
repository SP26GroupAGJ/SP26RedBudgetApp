import 'package:flutter/material.dart';

class SpendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: const Text(
              'Spending Analysis Here',
            ),
          ),
          Text(
            '',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}

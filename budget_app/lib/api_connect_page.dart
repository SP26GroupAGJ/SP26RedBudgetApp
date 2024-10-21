import 'package:flutter/material.dart';
import 'package:plaid_flutter/plaid_flutter.dart';

class ApiConnectPage extends StatefulWidget {
  @override
  State<ApiConnectPage> createState() => _ApiConnectPageState();
}

class _ApiConnectPageState extends State<ApiConnectPage> {
  final PLAID_CLIENT_ID = "670d2e62040495001a6f104c";
  final PLAID_SECRET = "3e264c7ac475d93a8a12c9b13e1a0c";
  final PLAID_ENV = 'sandbox';
  final PLAID_PRODUCTS = ["auth", "transactions"];
  final PLAID_COUNTRY_CODES = "US";
  var ACCESS_TOKEN;
  var PUBLIC_TOKEN;
  var ITEM_ID;

  _generateToken() async {
    // request link token from server

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(style: TextStyle(fontSize: 18), 'Api Testing'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/logout');
              },
            )
          ],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Text(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      'API Settings'),
                  Divider(),
                ],
              ),
            ),
          ],
        ));
  }
}

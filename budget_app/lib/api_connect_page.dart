import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plaid_flutter/plaid_flutter.dart';

class ApiConnectPage extends StatefulWidget {
  const ApiConnectPage({super.key});

  @override
  _ApiConnectPageState createState() => _ApiConnectPageState();
}

class _ApiConnectPageState extends State<ApiConnectPage> {
  LinkTokenConfiguration? _configuration;
  StreamSubscription<LinkEvent>? _streamEvent;
  StreamSubscription<LinkExit>? _streamExit;
  StreamSubscription<LinkSuccess>? _streamSuccess;
  LinkObject? _successObject;

  @override
  void initState() {
    super.initState();

    _streamEvent = PlaidLink.onEvent.listen(_onEvent);
    _streamExit = PlaidLink.onExit.listen(_onExit);
    _streamSuccess = PlaidLink.onSuccess.listen(_onSuccess);
  }

  @override
  void dispose() {
    _streamEvent?.cancel();
    _streamExit?.cancel();
    _streamSuccess?.cancel();
    super.dispose();
  }

  void _createLinkTokenConfiguration() {
    setState(() {
      _configuration = const LinkTokenConfiguration(
        token: "link-sandbox-e682ccd7-73d8-4892-b427-7c133c202eb2",
      );
      PlaidLink.create(configuration: _configuration!);
    });
  }

  void _onEvent(LinkEvent event) {
    final name = event.name;
    final metadata = event.metadata.description();
    print("onEvent: $name, metadata: $metadata");
  }

  void _onSuccess(LinkSuccess event) {
    final token = event.publicToken;
    final metadata = event.metadata.description();
    print("onSuccess: $token, metadata: $metadata");
    setState(() => _successObject = event);
  }

  void _onExit(LinkExit event) {
    final metadata = event.metadata.description();
    final error = event.error?.description();
    print("onExit metadata: $metadata, error: $error");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    _configuration?.toJson().toString() ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _createLinkTokenConfiguration,
                child: const Text("Create Link Token Configuration"),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed:
                    _configuration != null ? () => PlaidLink.open() : null,
                child: const Text("Open"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _configuration != null
                    ? () {
                        PlaidLink.submit(
                          SubmissionData(
                            phoneNumber: "14155550015",
                          ),
                        );
                      }
                    : null,
                child: const Text("Submit Phone Number"),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _successObject?.toJson().toString() ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
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

  LinkTokenConfiguration? _configuration;
  StreamSubscription<LinkEvent>? _streamEvent;
  StreamSubscription<LinkExit>? _streamExit;
  StreamSubscription<LinkSuccess>? _streamSuccess;
  LinkObject? _successObject;

  @override
  void initState() {
    super.initState();

    _streamEvent = PlaidLink.onEvent.listen(_onEvent);
    _streamExit = PlaidLink.onExit.listen(_onExit);
    _streamSuccess = PlaidLink.onSuccess.listen(_onSuccess);
  }

  @override
  void dispose() {
    _streamEvent?.cancel();
    _streamExit?.cancel();
    _streamSuccess?.cancel();
    super.dispose();
  }

  void _createLinkTokenConfiguration() {
    setState(() {
      _configuration = const LinkTokenConfiguration(
        token: "link-sandbox-e682ccd7-73d8-4892-b427-7c133c202eb2",
      );

      PlaidLink.create(configuration: _configuration!);
    });
  }

  void _onEvent(LinkEvent event) {
    final name = event.name;
    final metadata = event.metadata.description();
    print("onEvent: $name, metadata: $metadata");
  }

  void _onSuccess(LinkSuccess event) {
    final token = event.publicToken;
    final metadata = event.metadata.description();
    print("onSuccess: $token, metadata: $metadata");
    setState(() => _successObject = event);
  }

  void _onExit(LinkExit event) {
    final metadata = event.metadata.description();
    final error = event.error?.description();
    print("onExit metadata: $metadata, error: $error");
  }

  @override
  Widget build(BuildContext context) {
    LinkTokenConfiguration config = LinkTokenConfiguration(token: "");
    PlaidLink.create(configuration: config);

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
                  ElevatedButton(
                      onPressed: _createLinkTokenConfiguration,
                      child: Text("Create Link")),
                  ElevatedButton(
                    onPressed:
                        _configuration != null ? () => PlaidLink.open() : null,
                    child: const Text("Open"),
                  ),
                  ElevatedButton(
                    onPressed: _configuration != null
                        ? () {
                            PlaidLink.submit(
                              SubmissionData(
                                phoneNumber: "14155550015",
                              ),
                            );
                          }
                        : null,
                    child: const Text("Submit Phone Number"),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        _successObject?.toJson().toString() ?? "",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
*/
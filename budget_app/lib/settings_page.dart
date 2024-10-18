import 'package:budget_app/text_button_card.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(style: TextStyle(fontSize: 18), 'Settings'),
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
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      'Settings'),
                  Text(
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inverseSurface),
                      'Account'),
                  Divider(),
                  TextButtonCard(
                      title: "Username",
                      subtitle: "Edit username and personal information"),
                  TextButtonCard(
                      title: "Password", subtitle: "Change password"),
                  TextButtonCard(
                      title: "2FA Settings",
                      subtitle: "Configure two factor authentication"),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      'Settings'),
                  Text(
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inverseSurface),
                      'Notifications'),
                  Divider(),
                  TextButtonCard(
                      title: 'Turn off Notifications',
                      subtitle: 'Disable app notifications'),
                  TextButtonCard(
                      title: 'Edit Notification Preferences',
                      subtitle: "Change which notifications are sent"),
                ],
              ),
            ),
          ],
        ));
  }
}

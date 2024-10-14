import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final String username = "testUser";
  final String password = "testPass";
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login Page',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  if (userController.text == username &&
                      passController.text == password) {
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {}
                },
                child: Text("To Home Screen")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Username'),
                controller: userController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Password'),
                controller: passController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_accnt');
                },
                child: Text("To Create Account")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:budget_app/database_helper.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String username = "";
  String password = "";
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
    DatabaseHelper myDBHelper = DatabaseHelper();
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
            //Text field for users to enter their username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Username'),
                controller: userController,
              ),
            ),
            //Text field for users to enter their password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Password'),
                controller: passController,
              ),
            ),

            ElevatedButton(
                onPressed: () async  {
                  if(userController.text !="" && passController.text != ""){
                    myDBHelper.connectDatabase();
                    username = userController.text;
                    password = passController.text;
                    String query = 'SELECT COUNT(*) FROM users WHERE username = \'$username\' AND password = \'$password\';';
                    String result = await myDBHelper.databaseConnection.getData(query);
                    print(result);
                    if (result.contains("1")){
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, '/login');
                    }
                  }  
                },
                child: Text("Login")),

            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_accnt');
                },
                child: Text("Create Account")),
          ],
        ),
      ),
    );
  }
}

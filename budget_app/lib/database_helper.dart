import 'package:mssql_connection/mssql_connection.dart';

class DatabaseHelper {
  MssqlConnection databaseConnection = MssqlConnection.getInstance();
  bool isConnected = false;
  void connectDatabase () async{
        isConnected = await databaseConnection.connect(
        ip: '127.0.0.1',
        port: '4096',
        databaseName: 'SP26_Red_Budget_app',
        username: 'jAGsp26',
        password: 'WrhredBA',
        timeoutInSeconds: 15,
      );
      print(isConnected);  
  }
}
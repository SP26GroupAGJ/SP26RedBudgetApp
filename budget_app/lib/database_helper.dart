import 'package:mssql_connection/mssql_connection.dart';

class DatabaseHelper {
  MssqlConnection databaseConnection = MssqlConnection.getInstance();
  Future <void> connectDatabase () async{
    try{
        await databaseConnection.connect(
        ip: '10.0.0.210',
        port: '1433',
        databaseName: 'SP26_Red_Budget_app',
        username: 'jAGsp26',
        password: 'WrhredBA',
        timeoutInSeconds: 15,
      );
    } catch (e){
      print(e.toString());
    }
  }
  Future <void> writeData (String query) async{
    try{
      await databaseConnection.writeData(query);
    }
    catch (e){
      print(e.toString());
    }
  }
}
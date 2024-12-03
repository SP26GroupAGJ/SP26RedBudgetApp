import 'package:mssql_connection/mssql_connection.dart';

class DatabaseHelper {
  MssqlConnection databaseConnection = MssqlConnection.getInstance();
  Future <void> connectDatabase () async{
    try{
        await databaseConnection.connect(
        ip: 'sp26redbudgetdatabase.cdgieoauqi86.us-east-1.rds.amazonaws.com',
        port: '1433',
        databaseName: 'Sp26RedBudgetapp',
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
  Future <void> getData (String query) async{
    try{
      await databaseConnection.getData(query);
    }
    catch (e){
      print(e.toString());
    }
  }
}
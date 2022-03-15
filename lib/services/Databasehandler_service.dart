import 'package:path/path.dart';
import 'package:shop/models/User_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler{
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'user_database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,age INTEGER NOT NULL, country TEXT NOT NULL, email TEXT)",
        );
      },
      version: 1,
    );
  }

  //INSERT
  Future<int> insertUser(List<UserModel> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var user in users){
      result = await db.insert('users', user.toMap());
    }
    return result;
  }

  //RETRIEVE
  Future<List<UserModel>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => UserModel.fromMap(e)).toList();
  }

  //DELETE
  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}
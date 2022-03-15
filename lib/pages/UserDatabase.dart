import 'package:flutter/material.dart';
import 'package:shop/models/User_model.dart';
import 'package:shop/services/Databasehandler_service.dart';

class UserDatabase extends StatefulWidget {
  const UserDatabase({Key? key}) : super(key: key);

  @override
  _UserDatabaseState createState() => _UserDatabaseState();
}

class _UserDatabaseState extends State<UserDatabase> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
      await this.addUsers();
      setState(() {});
      printuser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: FutureBuilder(
        future: this.handler.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.delete_forever),
                  ),
                  key: ValueKey<int>(snapshot.data![index].id!),
                  onDismissed: (DismissDirection direction) async {
                    await this.handler.deleteUser(snapshot.data![index].id!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Card(
                      child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].age.toString()),
                  )),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<int> addUsers() async {
    UserModel firstUser = UserModel(name: "peter", age: 24, country: "Lebanon");
    UserModel secondUser = UserModel(name: "john", age: 31, country: "United Kingdom");
    List<UserModel> listOfUsers = [firstUser, secondUser];
    return await this.handler.insertUser(listOfUsers);
  }

  void printuser() async {
    var data = await this.handler.retrieveUsers();
    print(data.length);
  }


}

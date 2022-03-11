import 'package:flutter/material.dart';
import 'package:shop/utils/Routes.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber
                ),
                accountName: Text('Nayeem'),
                accountEmail: Text('Nayeem@sama.com'),
                currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('assets/images/dark.jpg'),
                ),
              )
          ),
          Card(
            child: ListTile(
              onTap: (){
                Navigator.pushNamed(context, Routes.loginRoute);
              },
              leading: Icon(Icons.login,
                color: Colors.black,
              ),
              title: Text('Login',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                Navigator.pushNamed(context, Routes.movieListRoute);
              },
              leading: Icon(Icons.list,
                color: Colors.black,
              ),
              title: Text('Movie List',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                Navigator.pushNamed(context, Routes.alertDialogWidgetRoute);
              },
              leading: Icon(Icons.add_alert,
                color: Colors.black,
              ),
              title: Text('Alert Dialog',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                Navigator.pushNamed(context, Routes.bottomNavigationWidgetRoute);
              },
              leading: Icon(Icons.arrow_downward,
                color: Colors.black,
              ),
              title: Text('Bottom Navigation',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: (){
                Navigator.pushNamed(context, Routes.bottomSheetWidgetRoute);
              },
              leading: Icon(Icons.filter_list,
                color: Colors.black,
              ),
              title: Text('Bottom Sheet',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

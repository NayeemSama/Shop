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
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, Routes.homeRoute);
            },
            leading: Icon(Icons.home,
              color: Colors.black,
            ),
            title: Text('Home',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ),
            ),
          ),
          ListTile(
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
          )
        ],
      ),
    );
  }
}

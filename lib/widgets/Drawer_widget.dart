import 'package:flutter/material.dart';
import 'package:shop/utils/Routes.dart';

class HomeDrawer extends StatelessWidget {

  var pageRoute = [
    Routes.loginRoute,
    Routes.movieListRoute,
    Routes.alertDialogWidgetRoute,
    Routes.bottomNavigationWidgetRoute,
    Routes.bottomSheetWidgetRoute,
    Routes.tableWidgetRoute,
    Routes.tabBarWidgetRoute,
    Routes.carouselWidgetRoute,
    Routes.gridViewWidgetRoute,
    Routes.animationWidgetRoute,
  ];

  var pageName = [
    'Login',
    'Movie List',
    'Alert Dialog',
    'Bottom Navigation',
    'Bottom Sheet',
    'Table',
    'Tab Bar',
    'Carousel',
    'Grid View',
    'Animation',
  ];

  var pageIcon = [
    Icons.login,
    Icons.list,
    Icons.add_alert,
    Icons.arrow_downward,
    Icons.filter_list,
    Icons.table_chart,
    Icons.tab,
    Icons.workspaces_outline,
    Icons.grid_on_rounded,
    Icons.star
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: Column(
        // padding: EdgeInsets.zero,
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
          Flexible(
            child: ListView.builder(
                padding: EdgeInsets.all(5),
                shrinkWrap: true,
                itemCount: pageName.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, pageRoute[index]);
                      },
                      leading: Icon(pageIcon[index],
                        color: Colors.black,
                      ),
                      title: Text(pageName[index],
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}

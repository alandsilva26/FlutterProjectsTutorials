import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData iconData, Function tapHandler) {
    return ListTile(
      leading: Icon(iconData, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.pop(context);
            	Navigator.of(context).pushNamed('/');
            },

          ),
          buildListTile(
            'Settings',
            Icons.settings,
            () {
              Navigator.pop(context);
            	Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

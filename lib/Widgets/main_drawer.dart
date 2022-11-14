import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(
        {required IconData icon,
        required String label,
        required VoidCallback tapHandler}) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          label,
          style: TextStyle(
              fontFamily: 'Roboto Condensed',
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 128,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Welcome to Jonah Restaurant!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
              icon: Icons.restaurant_menu,
              label: 'Meals',
              tapHandler: (() =>
                  Navigator.of(context).pushReplacementNamed('/'))),
          Divider(),
          buildListTile(
              icon: Icons.settings,
              label: 'Filters',
              tapHandler: (() => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName))),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Stork Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Admin Create Product'),
            onTap: () {
              Navigator.pushNamed(context, '/create_product');
            },
          ),
          ListTile(
            title: Text('Create Order'),
            onTap: () {
              Navigator.pushNamed(context, '/create_order');
            },
          ),
          ListTile(
            title: Text('Search User'),
            onTap: () {
              Navigator.pushNamed(context, '/search_user');
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mailmagario/providers/login_provider.dart';


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
              color: Colors.orange,
            ),
          ),
          ListTile(
            title: Text('My HK Address'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Create Order'),
            onTap: () {
              Navigator.pushNamed(context, '/create_order');
            },
          ),
          ListTile(
            title: Text('Manage/Create Addresses'),
            onTap: () {
              Navigator.pushNamed(context, '/manage_addresses');
            },
          ),
          ListTile(
            title: Text('Search User and create product'),
            onTap: () {
              Navigator.pushNamed(context, '/search_user');
            },
          ),
       /*   RaisedButton(
            onPressed: () {
              context.read<LoginProvider>().logout();
            },
            child: Text('Logout'),
          )
          */
        ],
      ),
    );
  }
}
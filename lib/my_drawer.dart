import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/pages/auth/auth_providers.dart';
import 'package:mailmagario/theme_data.dart';

class MyDrawer extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _auth = watch(authServicesProvider);
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
              color: myTheme.primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(FontAwesome5.building),
            title: Text('My HK Address'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(AntDesign.file1),
            title: Text('Create Order'),
            onTap: () {
              Navigator.pushNamed(context, '/create_order');
            },
          ),
          ListTile(
            leading: Icon(FontAwesome5.building),
            title: Text('Manage/Create Addresses'),
            onTap: () {
              Navigator.pushNamed(context, '/manage_addresses');
            },
          ),
          ListTile(
            leading: Icon(Feather.gift),
            title: Text('Search User and create product'),
            onTap: () {
              Navigator.pushNamed(context, '/search_user');
            },
          ),
          ListTile(
            leading: Icon(Feather.log_out),
            title: Text('Log out'),
            onTap: () {
              _auth.signout();
            },
          ),
        ],
      ),
    );
  }
}


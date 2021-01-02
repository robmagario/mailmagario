import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:get/get.dart';

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
              Get.toNamed("/");
            },
          ),
          ListTile(
            title: Text('Create Order'),
            onTap: () {
              Get.toNamed("/create_order");
            },
          ),
          ListTile(
            title: Text('Manage/Create Addresses'),
            onTap: () {
              Get.toNamed("/manage_addresses");
            },
          ),
          ListTile(
            title: Text('Search User and create product'),
            onTap: () {
              Get.toNamed("/search_user");
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
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
              print(Get.currentRoute);
              Get.back();
              Get.offNamed("/");
            },
          ),
          ListTile(
            title: Text('Create Order'),
            onTap: () {
              Get.back();
              Get.offNamed("/create_order");
            },
          ),
          ListTile(
            title: Text('Manage/Create Addresses'),
            onTap: () {
              Get.back();
              Get.offNamed("/manage_addresses");
            },
          ),
          ListTile(
            title: Text('Search User and create product'),
            onTap: () {
              Get.back();
              Get.offNamed("/search_user");
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyDrawer extends StatelessWidget {
  final AuthController authController = AuthController.to;
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
            leading: Icon(FontAwesome5.building),
            title: Text('My HK Address'),
            onTap: () {
              print(Get.currentRoute);
              Get.back();
              Get.offNamed("/");
            },
          ),
          ListTile(
            leading: Icon(AntDesign.file1),
            title: Text('Create Order'),
            onTap: () {
              Get.back();
              Get.offNamed("/create_order");
            },
          ),
          ListTile(
            leading: Icon(FontAwesome5.building),
            title: Text('Manage/Create Addresses'),
            onTap: () {
              Get.back();
              Get.offNamed("/manage_addresses");
            },
          ),
          ListTile(
            leading: Icon(Feather.gift),
            title: Text('Search User and create product'),
            onTap: () {
              Get.back();
              Get.offNamed("/search_user");
            },
          ),
          ListTile(
            leading: Icon(Feather.log_out),
            title: Text('Log out'),
            onTap: () {
              authController.signOut();
            },
          ),
        ],
      ),
    );
  }
}


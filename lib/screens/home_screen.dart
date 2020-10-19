import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(user.email),
            Text(user.uid),
            RaisedButton(
              onPressed: () {
                context.read<LoginProvider>().logout();
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
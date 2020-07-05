import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mailmagario/search_user.dart';
import 'package:mailmagario/see_shipping_rates.dart';
import 'package:mailmagario/LoginSignupPage.dart';
import 'package:mailmagario/authentication.dart';
import 'package:mailmagario/root_page.dart';
import 'package:mailmagario/create_order.dart';
import 'package:mailmagario/create_product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: const Color(0xFFff5722),
        accentColor: const Color(0xFFff5722),
        canvasColor: const Color(0xFFfafafa),
    // Define the default font family.
        fontFamily: 'Roboto',

      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyMain(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/see_shipping_rates': (context) => SeeShippingRates(),
        '/create_order': (context) => CreateOrder(),
        '/search_user': (context) => SearchUser(),
      },
      title: 'Stork',
    );
  }
}

class MyMain extends StatefulWidget {
  @override
  _MyMainState createState() {
    return _MyMainState();
  }
}

class _MyMainState extends State<MyMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      body: _buildBody(context),

    );
  }

  Widget _buildBody(BuildContext context) {
    return RootPage(
      auth: new Auth(),
    );
  }
}

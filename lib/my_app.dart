import 'package:flutter/material.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:mailmagario/screens/home_screen.dart';
import 'package:mailmagario/screens/login_screen.dart';
import 'package:mailmagario/screens/splash_screen.dart';
import 'package:mailmagario/see_shipping_rates.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => MyMain(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/see_shipping_rates': (context) => SeeShippingRates(),
       // '/create_order': (context) => CreateOrder(),
      //  '/search_user': (context) => SearchUser(),
      },
      title: 'Flutter Provider Proto',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: _showScreen(context),
    );
  }
}

Widget _showScreen(BuildContext context) {
  switch (context.watch<LoginProvider>().appState) {
    case AppState.authenticating:
    case AppState.unauthenticated:
      return LoginScreen();
    case AppState.initial:
      return SplashScreen();
    case AppState.authenticated:
      return HomeScreen(
        user: context.watch<LoginProvider>().user,
      );
  }
  return Container();
}
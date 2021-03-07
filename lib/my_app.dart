import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailmagario/constants/app_routes.dart';
import 'package:mailmagario/screens/login_page.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/pages/auth/auth_providers.dart';
import 'package:mailmagario/screens/home_screen.dart';
import 'package:mailmagario/screens/login_screen.dart';



/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final user = watch(authServiceProvider);
        if (user.getUser == null) {
          return LoginScreen();
        }
        else {
          return HomeScreen();
        }
      } );
  }
}
*/

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);
    return _authState.when(
      data: (value) {
        if (value != null) {
          return HomeScreen();
        }
        return LoginPage();
      },
      loading: () {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (_, __) {
        return Scaffold(
          body: Center(
            child: Text("OOPS"),
          ),
        );
      },
    );
  }
  /*@override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(authStateProvider).data?.value;
    return MaterialApp(
      builder: OneContext().builder,
      locale: Get.deviceLocale,
     // initialRoute: '/',
      home: user != null ? HomeScreen() : LoginScreen(),
      routes: appRoutes,
      title: 'Flutter Provider Proto',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.cyan[600],
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
    ),),
    );
  }*/
}

/*

Widget _showScreen(BuildContext context) {
  switch (context.watch<LoginProvider>().appState) {
    case AppState.authenticating:
    case AppState.unauthenticated:
      return LoginScreen();
    case AppState.initial:
      return SplashScreen();
    case AppState.authenticated:
      return HomeScreen(
        //user: context.watch<LoginProvider>().user,
      );
  }
  return Container();
}

 */
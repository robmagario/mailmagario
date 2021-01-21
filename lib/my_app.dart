import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailmagario/constants/app_routes.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      initialRoute: '/',
      getPages: AppRoutes.routes,
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

  //    home: _showScreen(context),
    );
  }
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
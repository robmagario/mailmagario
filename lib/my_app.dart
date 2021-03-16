import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailmagario/constants/app_routes.dart';
import 'package:mailmagario/screens/login_page.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/pages/auth/auth_providers.dart';
import 'package:mailmagario/screens/home_screen.dart';
import 'package:mailmagario/screens/login_screen.dart';


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

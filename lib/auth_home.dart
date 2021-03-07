import 'package:flutter/material.dart';
import 'package:mailmagario/screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/app/top_level_providers.dart';
import 'package:mailmagario/pages/auth/auth_providers.dart';



class AuthHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {

    return Consumer(
        builder: (context, watch, _) {
          final authStateChanges = watch(authStateChangesProvider);
          if (authStateChanges.data. == null) {
            return LoginScreen();
          }
          else {
            //return HomeScreen();
            return LoginScreen();
          }
        } );
  }
}
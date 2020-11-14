import 'package:flutter/material.dart';
import 'package:mailmagario/my_app.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginProvider.instance())
    ],
    child: MyApp(),
  ));
}
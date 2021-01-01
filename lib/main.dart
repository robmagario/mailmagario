import 'package:flutter/material.dart';
import 'package:mailmagario/my_app.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mailmagario/providers/cart.dart';
import 'package:get/get.dart';
import 'package:mailmagario/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthController>(AuthController());
  /*runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginProvider.instance()),
      ChangeNotifierProvider(create: (_) => CartModel()),
    ],
    child: MyApp(),
  ));
  */
  runApp(MyApp());
}
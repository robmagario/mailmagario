import 'package:flutter/material.dart';
import 'package:mailmagario/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:mailmagario/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // await initServices();
  Get.put<AuthController>(AuthController());
  Get.put<AppController>(AppController());
  //runApp(MyApp());
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
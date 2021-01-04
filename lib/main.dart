import 'package:flutter/material.dart';
import 'package:mailmagario/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mailmagario/providers/cart.dart';
import 'package:get/get.dart';
import 'package:mailmagario/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // await initServices();
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}
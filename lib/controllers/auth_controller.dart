import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mailmagario/screens/login_screen.dart';
import 'package:mailmagario/screens/home_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';


class AuthController extends GetxController {
  static AuthController to = Get.find();
  //AppLocalizations_Labels labels;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User> firebaseUser = Rx<User>();
  //Rx<UserModel> firestoreUser = Rx<UserModel>();
  final RxBool admin = false.obs;

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.value = await getUser;
    firebaseUser.bindStream(user);
    super.onReady();
  }

  @override
  void onClose() {
    firstNameController?.dispose();
    familyNameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
/*    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
      await isAdmin();
    }
*/
    if (_firebaseUser == null) {
      Get.offAll(LoginScreen());
    } else {
      Get.offAll(HomeScreen());
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser;

  // Firebase user a realtime stream
  Stream<User> get user => _auth.authStateChanges();


  //Method to handle user sign in using email and password
  signInWithEmailAndPassword(BuildContext context) async {
  //  final labels = AppLocalizations.of(context);
    //showLoadingIndicator();
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emailController.clear();
      passwordController.clear();
    //  hideLoadingIndicator();
    } catch (error) {
    //  hideLoadingIndicator();
      Get.snackbar("there was an error", "in signing you in",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // User registration using email and password
  registerWithEmailAndPassword(BuildContext context) async {
 //   final labels = AppLocalizations.of(context);
   // showLoadingIndicator();
    try {
      await _auth
          .createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text)
          .then((result) async {
        print('uID: ' + result.user.uid);
        print('email: ' + result.user.email);
        emailController.clear();
        passwordController.clear();
      //  hideLoadingIndicator();
      });
    } catch (error) {
   //   hideLoadingIndicator();
      Get.snackbar("there was an error", error.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }


/*

  //password reset email
  Future<void> sendPasswordResetEmail(BuildContext context) async {
    final labels = AppLocalizations.of(context);
    showLoadingIndicator();
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      hideLoadingIndicator();
      Get.snackbar(
          labels.auth.resetPasswordNoticeTitle, labels.auth.resetPasswordNotice,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } catch (error) {
      hideLoadingIndicator();
      Get.snackbar(labels.auth.resetPasswordFailed, error.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }
*/
  /*
  //check if user is an admin user
  isAdmin() async {
    await getUser.then((user) async {
      DocumentSnapshot adminRef =
      await _db.collection('admin').doc(user?.uid).get();
      if (adminRef.exists) {
        admin.value = true;
      } else {
        admin.value = false;
      }
      update();
    });
  }
*/
  // Sign out
  Future<void> signOut() {
    firstNameController.clear();
    familyNameController.clear();
    emailController.clear();
    passwordController.clear();
    return _auth.signOut();
  }
}

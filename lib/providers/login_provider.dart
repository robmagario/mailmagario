import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:mailmagario/firestore_service.dart';

enum AppState { initial, authenticated, authenticating, unauthenticated }

class LoginProvider with ChangeNotifier {
  FirebaseAuth _auth;
  //FirestoreService _firestoreService =  FirestoreService();
  User _user;
  AppState _appState = AppState.initial;

  AppState get appState => _appState;
  User get user => _user;

  LoginProvider.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        _appState = AppState.unauthenticated;
      } else {
        _user = user;
        _appState = AppState.authenticated;
      }

      notifyListeners();
    });
  }

  Future<bool> login(String email, String password) async {
    try {
      _appState = AppState.authenticating; //set current state to loading state.
      notifyListeners();

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _appState = AppState.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signup(String email, String firstName, String familyName, String password, String role) async {

    try {
      _appState = AppState.authenticating; //set current state to loading state.
      notifyListeners();

      UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _appState = AppState.unauthenticated;
      notifyListeners();
      return false;
    }
 /*     return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
    //  print(e.toString());
      _appState = AppState.unauthenticated;
      notifyListeners();
      return false; */



   /* await _firestoreService.createUser(User(
        id: user.uid,
        email: email,
        firstName: firstName,
        familyName: familyName,
        role: role));
    return user.uid; */
  }


  Future logout() async {
    await _auth.signOut();
    _appState = AppState.unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
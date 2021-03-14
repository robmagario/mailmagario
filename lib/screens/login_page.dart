import 'package:mailmagario/pages/auth/auth_providers.dart';
import 'package:mailmagario/pages/auth/login_page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends ConsumerWidget {
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  Color _backgroundColor = Color(0xFFE43F3F);
  Color _underlineColor = Color(0xFFCCCCCC);
  Color _buttonColor = Color(0xFFCC1D1D);

  void updateEmail(BuildContext context, String email) {
    context.read(emailProvider).state = email;
  }

  void updatePassword(BuildContext context, String pass) {
    context.read(passwordProvider).state = pass;
  }


  void _toggleObscureText(_obscureText) {
  //  setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
   // });
  }

  @override
  Widget build(BuildContext context, ScopedReader watch)  {
    final email = watch(emailProvider).state;
    final pass = watch(passwordProvider).state;

    final _auth = watch(authServicesProvider);
    return Scaffold(
        backgroundColor: _backgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Platform.isIOS?SystemUiOverlayStyle.light:SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(32, 72, 32, 24),
            children: [
              Container(
                child: Image.asset('assets/images/icon.png', height: 120),
              ),
              SizedBox(
                height: 32,
              ),
              TextField(
                onChanged: (value) => updateEmail(context, value),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _underlineColor),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                onChanged: (value) => updatePassword(context, value),
                obscureText: _obscureText,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  /*suffixIcon: IconButton(
                      icon: Icon(_iconVisible, color: Colors.white, size: 20),
                      onPressed: () {
                        _toggleObscureText(_obscureText);
                      }),*/
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: 'Click forgot password', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('Forgot Password?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                    ),
                    textAlign: TextAlign.right
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: _buttonColor,
                        width: 1,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(3)
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                textColor: Colors.white,
                color: _buttonColor,
                onPressed: (){
                  //Fluttertoast.showToast(msg: 'Click login', toastLength: Toast.LENGTH_SHORT);
                  _auth.signIn(email: email, password: pass);
                },
                child: Text('LOGIN', style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold
                )),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Text('Sign in with', style: TextStyle(
                    fontSize: 15, color: Colors.white
                )),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Signin with google', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(4)
                          ),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/google.png'),
                          width: 24,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Signin with facebook', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Image(
                          image: AssetImage('assets/images/facebook.png'),
                          width: 40,
                          color: Colors.white
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Signin with twitter', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Image(
                          image: AssetImage('assets/images/twitter.png'),
                          width: 40,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Click signup', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Text('No account yet? Create one', style: TextStyle(
                      fontSize: 15, color: Colors.white
                  )),
                ),
              )
            ],
          ),
        )
    );
  }

/*
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final email = watch(emailProvider).state;
    final pass = watch(passwordProvider).state;
    final _auth = watch(authServicesProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          TextField(
            onChanged: (value) => updateEmail(context, value),
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            onChanged: (value) => updatePassword(context, value),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          RaisedButton(
            onPressed: () => _auth.signIn(email: email, password: pass),
            child: Text('Sign-in'),
          ),
        ],
      ),
    );
  }*/
}
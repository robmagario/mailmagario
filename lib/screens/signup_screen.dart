import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _firstName;
  TextEditingController _familyName;
  TextEditingController _email;
  TextEditingController _password;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController(text: "");
    _familyName = TextEditingController(text: "");
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Stork HK Postal Box'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
                children: <Widget>[
                  Image.asset('assets/images/stork_cover.png'),
                  Container(
                    padding:
                    EdgeInsets.only(left: 10.0, right: 50.0, top: 30, bottom: 30),
                    child: Center(child: Text(
                        "Deliver internationally from HK / China to your doorstep.",
                        textAlign: TextAlign.center,

                        style: TextStyle(color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],))),),
                ]
            ),
            TextField(
              decoration: InputDecoration(hintText: 'First Name'),
              controller: _firstName,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Family Name'),
              controller: _familyName,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: _email,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
              controller: _password,
            ),
            RaisedButton(
              onPressed: () async {
                if (!await context
                    .read<LoginProvider>()
                    .signup(_email.text, _firstName.text, _familyName.text, _password.text, "user")) {
                  _key.currentState.showSnackBar(
                      SnackBar(content: Text('Unable to login.')));
                }
              },
              child: Text('Create Account',
                style: TextStyle(fontSize: 20, color: Colors.white),),

            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstName.dispose();
    _familyName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
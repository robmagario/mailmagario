import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

class User {
  final String id;
  final String firstName;
  final String familyName;
  final String email;
  User({this.id, this.firstName, this.familyName, this.email});
  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        firstName = data['firstName'],
        familyName = data['familyName'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'familyName': familyName,
      'email': email,

    };
  }
}

enum FormMode { LOGIN, SIGNUP }

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _firstName;
  String _familyName;

  String _errorMessage = "";

  // this will be used to identify the form to show
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text("Stork"),
      ),
      body: Column(
        children: <Widget>[
          logoWidget(),
          formWidget(),
          loginButtonWidget(),
          secondaryButton(),
          seeShippingRates(),
          errorWidget(),
          progressWidget()
        ],
      ),
      /*bottomNavigationBar: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.menu),),
          ],
        ),
      ),*/
      /*floatingActionButton: new FloatingActionButton.extended(
        icon: Icon(Icons.attach_money),
        label: Text('See shipping rates'),
        backgroundColor: Colors.indigoAccent,
        onPressed: () {
          Navigator.pushNamed(context, '/see_shipping_rates');
        },
        shape: new BeveledRectangleBorder(
            borderRadius: new BorderRadius.circular(0.0)),
      ),
      */
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Stork Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Admin Create Product'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pushNamed(context, '/create_product');
              },
            ),
            ListTile(
              title: Text('Create Order'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget progressWidget() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget logoWidget() {
    return Stack(
        children: <Widget>[
          Image.asset('assets/images/stork_cover.png'),
          Container(
              padding:
              EdgeInsets.only(left: 10.0, right: 50.0, top: 30, bottom: 30),
              child: Center(child: Text("Deliver internationally from HK / China to your doorstep.",
              textAlign: TextAlign.center,

            style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold, shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(5.0, 5.0),
              ),
            ],))),),
        ]
    );
  }

  Widget formWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _firstNameWidget(),
          _familyNameWidget(),
          _emailWidget(),
          _passwordWidget(),
        ],
      ),
    );
  }

  Widget _firstNameWidget() {
    if (_formMode == FormMode.LOGIN) {
      return Container();
    }
    else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Enter First Name',
              icon: new Icon(
                Icons.person,
                color: Colors.grey,
              )),
          validator: (value) =>
          value.isEmpty
              ? 'First Name cannot be empty'
              : null,
          onSaved: (value) => _firstName = value.trim(),
        ),
      );
    }
  }
  Widget _familyNameWidget() {
    if (_formMode == FormMode.LOGIN) {
      return Container();
    }
    else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.text,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Enter Family Name',
              icon: new Icon(
                Icons.person,
                color: Colors.grey,
              )),
          validator: (value) =>
          value.isEmpty
              ? 'Family Name cannot be empty'
              : null,
          onSaved: (value) => _familyName = value.trim(),
        ),
      );
    }
  }

  Widget _emailWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Enter Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email cannot be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _passwordWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password cannot be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget loginButtonWidget() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: new MaterialButton(
          elevation: 5.0,
          minWidth: 200.0,
          height: 42.0,
          color: Colors.blue,
          child: _formMode == FormMode.LOGIN
              ? new Text('Login',
              style: new TextStyle(fontSize: 20.0, color: Colors.white))
              : new Text('Create account',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: _validateAndSubmit,
        ));
  }

  Widget seeShippingRates() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        child: new MaterialButton(
          elevation: 5.0,
          minWidth: 250.0,
          height: 42.0,
          color: Colors.indigoAccent,
          child: new Text('\$ See Our Shipping Rates',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: () {
            Navigator.pushNamed(context, '/see_shipping_rates');
          },
        ));
  }

  Widget secondaryButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN
          ? new Text('Create an account',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : new Text('Have an account? Sign in',
          style:
          new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _formMode == FormMode.LOGIN ? showSignupForm : showLoginForm,
    );
  }

  void showSignupForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void showLoginForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  Widget errorWidget() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await widget.auth.signIn(_email, _password);
        } else {
          userId = await widget.auth.signUp(_email, _firstName, _familyName, _password);
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          widget.onSignedIn();
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
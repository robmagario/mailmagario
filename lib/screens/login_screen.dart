import 'package:flutter/material.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:mailmagario/screens/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();
  TextEditingController _firstName;
  TextEditingController _familyName;
  TextEditingController _email;
  TextEditingController _password;
  String  _errorMessage = "";
  final _key = GlobalKey<ScaffoldState>();

  FormMode _formMode = FormMode.LOGIN;
  bool _isIos = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController(text: "");
    _familyName = TextEditingController(text: "");
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }
/*

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: false,
      key: _key,
      appBar: AppBar(
        title: Text('Stork HK Postal Box'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            logoWidget(),
            formWidget(),
           /*TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: _email,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
              controller: _password,
            ),*/
            RaisedButton(
              onPressed:  _formMode == FormMode.LOGIN
                 ? () async {
                if (!await context
                    .read<LoginProvider>()
                    .login(_email.text, _password.text)) {
                  _key.currentState.showSnackBar(
                      SnackBar(content: Text('Unable to login.')));
                }
              }
              :() async {
                if (!await context
                    .read<LoginProvider>()
                    .signup(_email.text, _firstName.text, _familyName.text, _password.text, "user")) {
                  _key.currentState.showSnackBar(
                      SnackBar(content: Text('Unable to login.')));
                }
              },
              child:  _formMode == FormMode.LOGIN
                  ? new Text('Login',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white))
                  : new Text('Create account',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white)),

            ),
       //     _createAccountLabel(),
            secondaryButton(),
            seeShippingRates(),
          ],
        ),
      ),
    );
  }

  Widget _firstNameWidget() {
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
       // onSaved: (value) => _firstName = value.trim(),
        controller: _firstName,
      ),
    );
  }

  Widget _familyNameWidget() {
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
     //     onSaved: (value) => _familyName = value.trim(),
          controller: _familyName,
        ),
      );
  }

  Widget logoWidget() {
    return Stack(
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
      );
  }

  Widget formWidget() {
    if (_formMode == FormMode.LOGIN) {
      return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _emailWidget(),
            _passwordWidget(),

          ],
        ),
      );
    }
    else {
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
       // onSaved: (value) => _email = value.trim(),
        controller: _email,
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
    //    onSaved: (value) => _password = value.trim(),
        controller: _password,
      ),
    );
  }


  Widget seeShippingRates() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        child: new MaterialButton(
          elevation: 5.0,
          minWidth: 250.0,
          height: 42.0,
          color: Colors.lightGreen[900],
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
          ? new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Register',
            style: TextStyle(
                color: Color(0xfff79c4f),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ],
      )
          : new  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Have an account ?',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Sign in',
          style: TextStyle(
              color: Color(0xfff79c4f),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
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

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
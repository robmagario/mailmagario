import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:mailmagario/myDrawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stork'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
            padding:
            EdgeInsets.only(left: 10.0, right: 50.0, top: 30, bottom: 30),
          
          child: Column (
            children: <Widget>[Row(
              children: [Text('My Hong Kong address:')]
            ),Row(
                children: [Text('27A, The Met Focus')]
            ),Row(
                children: [Text('8 Pak Kung Street')]
            ),Row(
                children: [Text('Hong Kong')]
            ),],
          )
        )
      ),
    );
  }
}
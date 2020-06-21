import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';

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
  String _userId = "";
  String _email = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
          _email = user?.email;
        }
      });
    });
  }
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
              children: <Widget>[Text(_email)],
            )
              ,Row(
              children: [Container(

                  child:Text('My Hong Kong address:'))]
            ),Flexible(
              child: Container(

                child: Row(
                  mainAxisSize: MainAxisSize.max,
              children: <Widget>[Text('Use this address for receiving your packages in HK.')],
            ),),),
              Row(
                children: <Widget>[Text(' ')],
              ),
              Row(
                children: [Container(
                  width: 200.0,
                  child:Text('27A, The Met Focus'),),
                  RaisedButton(
                    child: Text('Copy to Clipboard'),
                    onPressed: () {
                      FlutterClipboardManager.copyToClipBoard(
                                 "27A, The Met Focus")
                             .then((result) {
                        final snackBar = SnackBar(
                          content: Text('Copied to Clipboard'),
                          action: SnackBarAction(
                            label: 'Okay',
                            onPressed: () {},
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),
                ]
            ),Row(
                children: [Container(
                    width: 200.0,
                    child: Text('Street: 8 Pak Kung Street'),),
                  RaisedButton(
                    child: Text('Copy to Clipboard'),
                    onPressed: () {
                      FlutterClipboardManager.copyToClipBoard(
                          "8 Pak Kung Street")
                          .then((result) {
                        final snackBar = SnackBar(
                          content: Text('Copied to Clipboard'),
                          action: SnackBarAction(
                            label: 'Okay',
                            onPressed: () {},
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),]
            ),Row(
                children: [Container(
                    width: 200.0,
                    child: Text('District: Hung Hom'),),
                  RaisedButton(
                    child: Text('Copy to Clipboard'),
                    onPressed: () {
                      FlutterClipboardManager.copyToClipBoard(
                          "Hung Hom")
                          .then((result) {
                        final snackBar = SnackBar(
                          content: Text('Copied to Clipboard'),
                          action: SnackBarAction(
                            label: 'Okay',
                            onPressed: () {},
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),]
            ),
              Row(
                  children: [Container(
                      width: 200.0,
                      child: Text('City: Hong Kong'),),
                    RaisedButton(
                      child: Text('Copy to Clipboard'),
                      onPressed: () {
                        FlutterClipboardManager.copyToClipBoard(
                            "Hong Kong")
                            .then((result) {
                          final snackBar = SnackBar(
                            content: Text('Copied to Clipboard'),
                            action: SnackBarAction(
                              label: 'Okay',
                              onPressed: () {},
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        });
                      },
                    ),]
              ),
              Row(
                  children: [Container(
                    width: 200.0,
                    child: Text('TEL: 6818-3401'),),
                    RaisedButton(
                      child: Text('Copy to Clipboard'),
                      onPressed: () {
                        FlutterClipboardManager.copyToClipBoard(
                            "6818-3401")
                            .then((result) {
                          final snackBar = SnackBar(
                            content: Text('Copied to Clipboard'),
                            action: SnackBarAction(
                              label: 'Okay',
                              onPressed: () {},
                            ),
                          );
                          Scaffold.of(context).showSnackBar(snackBar);
                        });
                      },
                    ),]
              ),
            ],
          )
        )
      ),
    );
  }
}
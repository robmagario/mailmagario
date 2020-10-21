import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
            padding:
            EdgeInsets.only(left: 10.0, right: 50.0, top: 30, bottom: 30),

            child: Column (
              children: <Widget>[Row(
                children: <Widget>[Text(user.email)],
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
                      child:Text(user.email),),
                      RaisedButton(
                        child: Text('Copy to Clipboard'),
                        onPressed: () {
                          FlutterClipboardManager.copyToClipBoard(
                              "10E, The Met Focus")
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
                      child:Text('10E, The Met Focus'),),
                      RaisedButton(
                        child: Text('Copy to Clipboard'),
                        onPressed: () {
                          FlutterClipboardManager.copyToClipBoard(
                              "10E, The Met Focus")
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
        /*Column(
          children: [
            Text(user.email),
            Text(user.uid),
            RaisedButton(
              onPressed: () {
                context.read<LoginProvider>().logout();
              },
              child: Text('Logout'),
            )
          ],
        ),*/
      ),
    );
  }
}
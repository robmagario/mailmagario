import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
         actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesome.sign_out),
            tooltip: 'logout',
            onPressed: () {
              context.read<LoginProvider>().logout();
            },
          )],

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
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(FontAwesome5.building),
                        title: Text('Your HK address:'),
                        subtitle: Text('Use this address as your "Ship to" address when purchasing from Hong Kong online retailers.'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:8.0,left:8.0),
                            child: Text('Address Line 1: Room 10E, The Met Focus'),
                          ),
                        ],
                      ),
                      Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:8.0),
                            child: Text('Address Line 2: Hung Hom'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Builder (
                            builder: (context) => FlatButton(
                            child: Row(
                              children: [Icon(FontAwesome5.copy),const Text('Copy'),],
                            ),
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
                            color: Colors.orange,
                          )
                          ) ],
                      ),
                    ],
                  ),
                ),

              ],
            )
        )
      ),
    );
  }
}

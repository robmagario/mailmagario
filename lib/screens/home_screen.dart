import 'package:flutter/material.dart';
import 'package:mailmagario/my_drawer.dart';
import 'package:flutter_clipboard_manager/flutter_clipboard_manager.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:mailmagario/pages/auth/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
//  final User user;
 // final AuthController authController = AuthController.to;
//  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _auth = watch(authServicesProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
         actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesome.sign_out),
            tooltip: 'logout',
            onPressed: () =>  _auth.signout(),
          )],

      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
            padding:
            EdgeInsets.only(left: 10.0, right: 50.0, top: 30, bottom: 30),

            child:
            Column (
              children: <Widget>[
                /*Row(
                children: <Widget>[Text(user.email)],
              )
                ,*/
                Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.only(left:30.0)),
                    ]
                ),
                Card(
                  margin: EdgeInsets.only (left:20.0),
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
                            padding: const EdgeInsets.only(top:8.0,left:8.0, bottom:1.0),
                            child: Text('Address Line 1: Flat 10E, The Met Focus'),
                          ),
                        ],
                      ),
                      Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:1.0),
                            child: Text('Address Line 2: 8 Pak Kung Street, Hung Hom, Kowloon'),
                          ),
                        ],
                      ),
                      Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:1.0),
                            child: Text('Hong Kong, S.A.R.'),
                          ),
                        ],
                      ),Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:1.0),
                            child: Text('TEL: +852-9400-9505'),
                          ),
                        ],
                      ), Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:8.0),
                            child: Text('Postal Code: 999077 (if needed) '),
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
                                  "10E, The Met Focus, 8 Pak Kung Street, Hung Hom, Hong Kong S.A.R.")
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
                         //   color: Colors.orange,
                          )
                          ) ],
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.only (left:20.0, top: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    children: <Widget>[

                      const ListTile(
                        leading: Icon(FontAwesome5.building),
                        title: Text('Your HK address in Chinese:'),
                        subtitle: Text('The same address but in Chinese language in case you need it.'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top:8.0,left:8.0, bottom:1.0),
                            child: Text('Address Line 1: 10E, 薈點'),
                          ),
                        ],
                      ),
                      Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:1.0),
                            child: Text('Address Line 2: 香港紅磡北拱街8號'),
                          ),
                        ],
                      ),
                      Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:1.0),
                            child: Text('香港'),
                          ),
                        ],
                      ),Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:1.0),
                            child: Text('TEL: +852-9400-9505'),
                          ),
                        ],
                      ), Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom:8.0),
                            child: Text('Postal Code: 999077 (if needed) '),
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
                                      "10E 薈點 香港紅磡北拱街8號 TEL:+852-9400-9505")
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
                            //    color: Colors.orange,
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

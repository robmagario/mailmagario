import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

final people = <Person>[Person('Alice', '123 Main'), Person('Bob', '456 Main')];

class CreateProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "See Shipping Rates",
      home: MyCreateProduct(),


    );
  }
}
class MyCreateProduct extends StatefulWidget {
  MyCreateProduct({Key key}) : super(key: key);
  @override
  _MyCreateProduct createState() {
    return _MyCreateProduct();
  }
}

class _MyCreateProduct extends State<MyCreateProduct> {
  String dropdownValue = 'argentina';
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Create Product')),
      body: _buildBody(context),

    );
  }


  Widget _buildBody(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("country").snapshots(),
        builder: (context, snapshot) {
          var length = snapshot.data.documents.length;
          DocumentSnapshot ds = snapshot.data.documents[length - 1];
          return new Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Create new product"), Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.card_giftcard),
                        hintText: 'Please insert the product name',
                        labelText: 'Product name',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the name!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.linear_scale),
                        hintText: 'Please insert the weight in grams',
                        labelText: 'Weight',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the weight!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Autocomplete username',
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the user!';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {

                            Scaffold.of(context).showBottomSheet((BuildContext context) {
                              return new Container(
                                  height: 350.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [Container(
                                      width: 60.0,
                                      child:(Column(
                                          children: [Text("eExpress"),]
                                      )),), Container(
                                      width: 50.0,
                                      child: Column(
                                          children: [Text("20 HKD"),]
                                      ),),
                                      Flexible(
                                        child: Container(
                                          width: 100.0,
                                          child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [new Text('''Estimation: 10-15 days. Signature required upon delivery.'''),]
                                          ),),),

                                    ],));
                            });
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),],

            ),
          );
        }
    );


  }
}

class Record {
  final String email;
  final String familyName;
  final String firstName;
  final String id;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['email'] != null),
        assert(map['familyName'] != null),
        assert(map['firstName'] != null),
        assert(map['id'] != null),
        email = map['email'],
        familyName = map['familyName'],
        firstName = map['firstName',
        id = map['id'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
/*
  @override
  String toString() => "Record<$name:$votes>";
  */

}
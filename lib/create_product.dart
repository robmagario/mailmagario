import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      appBar: AppBar(title: Text('See Shipping Rates')),
      body: _buildBody(context),

    );
  }


  Widget _buildBody(BuildContext context) {


    return StreamBuilder<QuerySnapshot>(
    );

  }
}
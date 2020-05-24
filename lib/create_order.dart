import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreateOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "See Shipping Rates",
      home: MyCreateOrder(),


    );
  }
}
class MyCreateOrder extends StatefulWidget {
  MyCreateOrder({Key key}) : super(key: key);
  @override
  _MyCreateOrder createState() {
    return _MyCreateOrder();
  }
}

class _MyCreateOrder extends State<MyCreateOrder> {
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
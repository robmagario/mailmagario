import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SeeShippingRates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: "See Shipping Rates",
        home: MyShippingRates(),


    );
  }
}
  class MyShippingRates extends StatefulWidget {
    MyShippingRates({Key key}) : super(key: key);
  @override
  _MyShippingRates createState() {
  return _MyShippingRates();
  }
  }

   class _MyShippingRates extends State<MyShippingRates> {
     String dropdownValue = 'One';

     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('See Shipping Rates')),
         body: _buildBody(context),

       );
     }


     Widget _buildBody(BuildContext context) {
       var category;
       return StreamBuilder<QuerySnapshot>(
           stream: Firestore.instance.collection("country").snapshots(),
           builder: (context, snapshot) {
             var length = snapshot.data.documents.length;
             DocumentSnapshot ds = snapshot.data.documents[length - 1];
             return new DropdownButton(
               items: snapshot.data.documents.map((DocumentSnapshot document) {
                 return DropdownMenuItem(
                     child: new Text(document.data['name']));
               }).toList(),
               onChanged: (newValue) {
                 setState(() {
                   category = newValue;
                 });
               },

             );
           }
       );
     }
   }
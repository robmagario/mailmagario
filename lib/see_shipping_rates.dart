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
       return StreamBuilder<QuerySnapshot>(
         stream: Firestore.instance.collection('country').snapshots(),
         builder: (context, snapshot) {
           if (!snapshot.hasData) return LinearProgressIndicator();

           return _buildDropDown(context, snapshot.data.documents);
         },
       );
     }

     Widget _buildDropDown(BuildContext context,
         List<DocumentSnapshot> snapshot) {
       return DropdownButton(
         value: dropdownValue,
         icon: Icon(Icons.arrow_downward),
         iconSize: 24,
         elevation: 16,
         style: TextStyle(color: Colors.deepPurple),
         underline: Container(
           height: 2,
           color: Colors.deepPurpleAccent,
         ),
         onChanged: (String newValue) {
           setState(() {
             dropdownValue = newValue;
           });
         },
         items: snapshot.map((data) => _buildDropDownItem(context, data))
             .toList(),
       );
     }

     Widget _buildDropDownItem(BuildContext context, DocumentSnapshot data) {
       final record = Record.fromSnapshot(data);

       return DropdownMenuItem<String>(
         value: record.name,
         child: Text(record.name),
       );
     }

   }
class Record {
  final String name;
  final int zone;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['zone'] != null),
        name = map['name'],
        zone = map['zone'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$zone>";
}
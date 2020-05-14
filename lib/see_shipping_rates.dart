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
           stream: Firestore.instance.collection("country").snapshots(),
           builder: (context, snapshot) {
             var length = snapshot.data.documents.length;
             DocumentSnapshot ds = snapshot.data.documents[length - 1];
             return new Container(
                 padding: EdgeInsets.all(20),
                 alignment: Alignment.center,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [Text("Please select your destination country"), DropdownButton(
               value: dropdownValue,

               onChanged: (String newValue) {
                 setState(() {
                   dropdownValue = newValue;
                 });
               },
               items: snapshot.data.documents.map((DocumentSnapshot document) {
                 return DropdownMenuItem(
                     value: document.documentID.toString(),
                     child: new Text(document.data['name']));
               }).toList(),


             ), Form(
               key: _formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                      TextFormField(
                     keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.linear_scale),
                          hintText: 'Please insert the weight in grams',
                          labelText: 'Weight',
                        ),
                     validator: (value) {

                       if (value.isEmpty) {
                         return 'Please enter the weight.';
                       }

                       return null;
                     },
                   ),
                   Text("grams"),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 16.0),
                     child: RaisedButton(
                       onPressed: () {
                         FocusScope.of(context).requestFocus(new FocusNode());
                         // Validate returns true if the form is valid, or false
                         // otherwise.
                         if (_formKey.currentState.validate()) {

                           Scaffold.of(context).showBottomSheet((BuildContext context) {
                             return new Table(

                               defaultVerticalAlignment: TableCellVerticalAlignment.top,
                               children: <TableRow>[
                                 ///First table row with 3 children
                                 TableRow(children: <Widget>[
                                   FittedBox(
                                     fit: BoxFit.none,
                                     child: Container(
                                       margin: EdgeInsets.all(1),
                                       color: Colors.red,
                                       width: 30.0,
                                       height: 20.0,
                                       child: Center(
                                         child: Text(
                                           "eExpress",
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 6.0,
                                               fontFamily: 'Open Sans'),
                                         ),
                                       ),
                                     ),
                                   ),

                                   FittedBox(
                                     fit: BoxFit.contain,
                                     child: Container(
                                       margin: EdgeInsets.all(1),
                                       color: Colors.blue,
                                       width: 70.0,
                                       height: 20.0,
                                       child: Center(
                                         child: Text(
                                           "HK\$25.00. Gets to Argentina within 2 weeks.",
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 6.0,
                                               fontFamily: 'Open Sans'),
                                         ),
                                       ),
                                     ),
                                   ),
                                 ]),
                                 ///Second table row with 3 children
                                 TableRow(children: <Widget>[
                                   FittedBox(
                                     fit: BoxFit.none,
                                     child: Container(
                                       margin: EdgeInsets.all(1),
                                       color: Colors.lightBlue,
                                       width: 30.0,
                                       height: 20.0,
                                       child: Center(
                                         child: Text(
                                           "Normal Airmail",
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 6.0,
                                               fontFamily: 'Open Sans'),
                                         ),
                                       ),
                                     ),
                                   ),

                                   FittedBox(
                                     fit: BoxFit.contain,
                                     child: Container(
                                       margin: EdgeInsets.all(2),
                                       color: Colors.blue,
                                       width: 70.0,
                                       height: 20.0,
                                       child: Center(
                                         child: Text(
                                           "HK\$68.00. Gets to Argentina within 2-3 weeks.",
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 6.0,
                                               fontFamily: 'Open Sans'),
                                         ),
                                       ),
                                     ),
                                   ),
                                 ]),
                               ],
                             );
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
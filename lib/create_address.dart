import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:provider/provider.dart';


class CreateAddress extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MyCreateAddress();
  }
}
class MyCreateAddress extends StatefulWidget {

  @override
  _MyCreateAddress createState() {
    return _MyCreateAddress();
  }
}

class _MyCreateAddress extends State<MyCreateAddress> {

  String dropdownValue = 'argentina';
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Address')),
      body: _buildBody(context),
      drawer: MyDrawer(),

    );
  }

  Widget _buildBody(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController address1Controller = TextEditingController();
    TextEditingController address2Controller = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController zipCodeController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    final snackBar = SnackBar(content: Text('Product created successfully!'), backgroundColor: Colors.deepOrange);

    final User _userId = context.watch<LoginProvider>().user;
    return new Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("Create new address"), Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(MaterialCommunityIcons.account),
                  hintText: 'Please insert the first name and family name',
                  labelText: 'First name and Family Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the first name and family name!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: address1Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(MaterialCommunityIcons.map_marker),
                  hintText: 'Please insert the address line 1',
                  labelText: 'Address Line 1',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the address line 1!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: address2Controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(MaterialCommunityIcons.map_marker),
                  hintText: 'Please insert the address line 2',
                  labelText: 'Address Line 2',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the address line 2!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: cityController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(MaterialCommunityIcons.city),
                  hintText: 'Please insert the city',
                  labelText: 'City',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the city!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(MaterialCommunityIcons.phone),
                  hintText: 'Please insert the phone',
                  labelText: 'Phone',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the phone!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: zipCodeController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Text('〒'),
                  hintText: 'Please insert the zip code',
                  labelText: 'Zip Code',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the zip code!';
                  }
                  return null;
                },
              ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("country").snapshots(),
            builder: (context, snapshot) {
              var length = snapshot.data.docs.length;
              DocumentSnapshot ds = snapshot.data.docs[length - 1];
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
                    items: snapshot.data.docs.map((DocumentSnapshot document) {
                      return DropdownMenuItem(
                          value: document.id.toString(),
                          child: new Text(document.data()["name"]));
                    }).toList(),


                  ),
                    ],

                ),
              );
            }
        ),
    Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      //createRecord(productNameController.text, weightController.text, person.id);
                      Scaffold.of(context).showSnackBar(snackBar);
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



}

class Record {
  final String address1;
  final String address2;
  final String city;
  final String country;
  final String name;
  final String phone;
  final String userId;
  final String zipCode;
  final DocumentReference reference;
  bool selected;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['address1'] != null),
        assert(map['address2'] != null),
        assert(map['city'] != null),
        assert(map['country'] != null),
        assert(map['name'] != null),
        assert(map['phone'] != null),
        assert(map['userId'] != null),
        assert(map['zipCode'] != null),
        assert(map['selected'] != null),
        address1 = map['address1'],
        address2 = map['address2'],
        city = map['city'],
        country = map['country'],
        name = map['name'],
        phone = map['phone'],
        userId = map['userId'],
        zipCode = map['zipCode'],
        selected = map['selected'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

//  @override
// String toString() => "Record<$name:$votes>";
}


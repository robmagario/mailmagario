import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';


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
  TextEditingController nameController;
  TextEditingController address1Controller;
  TextEditingController address2Controller;
  TextEditingController cityController;
  TextEditingController phoneController;
  TextEditingController zipCodeController;
  TextEditingController countryController;

  void initState() {
    super.initState();
    nameController = TextEditingController();
    address1Controller = TextEditingController();
    address2Controller = TextEditingController();
    cityController = TextEditingController();
    phoneController = TextEditingController();
    zipCodeController = TextEditingController();
    countryController = TextEditingController();
  }

  void dispose() {
    nameController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    cityController.dispose();
    phoneController.dispose();
    zipCodeController.dispose();
    countryController.dispose();
    super.dispose();
  }


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

    final snackBar = SnackBar(content: Text('Product created successfully!'), backgroundColor: Colors.deepOrange);

    final String _userId = context.watch<LoginProvider>().user.uid;
    return new Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("Create new address" + " "), Form(
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
                padding: EdgeInsets.only(top: 20.0),
                alignment: Alignment.topLeft,
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
                      createRecord(address1Controller.text,
                          address2Controller.text,
                          cityController.text,
                          countryController.text,
                          nameController.text,
                          phoneController.text,
                          true,
                          _userId,
                          zipCodeController.text);
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

void createRecord(String address1Controller, String address2Controller,
    String cityController, String countryController, String nameController, String phoneController,
    bool selectedController, String userIdController, String zipCodeController) async {
  final databaseReference = FirebaseFirestore.instance;
  await databaseReference.collection("addresses")
      .add({
    'address1': address1Controller,
    'address2': address2Controller,
    'city': cityController,
    'country': countryController,
    'name': nameController,
    'phone': phoneController,
    'selected': selectedController,
    'userId': userIdController,
    'zipCode': zipCodeController,
  });

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


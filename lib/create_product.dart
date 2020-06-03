import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:mailmagario/myDrawer.dart';

class CreateProduct extends StatelessWidget {

 // CreateProduct({Key key, @required this.id}) : super(key: key);
  CreateProduct(this.id);
  final String id;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Create Product",
      home: new Scaffold(body: new MyCreateProduct(id)),


    );
  }
}
class MyCreateProduct extends StatefulWidget {
  final String id;
  MyCreateProduct(this.id);
  //MyCreateProduct({Key key}) : super(key: key);
  @override
  _MyCreateProduct createState() {
    return _MyCreateProduct(id);
  }
}

class _MyCreateProduct extends State<MyCreateProduct> {
  String id;
  @override
  void initState() {
    super.initState();
  }

  _MyCreateProduct(String id) {
    this.id = id;
  }

  //String dropdownValue = 'argentina';
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Create Product')),
      body: _buildBody(context),
      drawer: MyDrawer(),

    );
  }


  Widget _buildBody(BuildContext context) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    final snackBar = SnackBar(content: Text('Product created successfully!'), backgroundColor: Colors.deepOrange);

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
                      controller: productNameController,
                      keyboardType: TextInputType.text,
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
                      controller: weightController,
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
                    Text ("User email address"),
                    Text (id),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                            FocusScope.of(context).requestFocus(new FocusNode());
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                         if (_formKey.currentState.validate()) {
                            createRecord(productNameController.text, weightController.text, emailController.text);
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

void createRecord(String productNameController, String weightController, String emailController) async {
  final databaseReference = Firestore.instance;
  await databaseReference.collection("products")
      .add({
    'productName': productNameController,
    'weight': int.parse(weightController),
    'email' : emailController
  });

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
        firstName = map['firstName'],
        id = map['id'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
/*
  @override
  String toString() => "Record<$name:$votes>";
  */

}
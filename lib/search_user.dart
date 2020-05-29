import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: MySearchUser(),


    );
  }
}
class MySearchUser extends StatefulWidget {
  MySearchUser({Key key}) : super(key: key);
  @override
  _MySearchUser createState() {
    return _MySearchUser();
  }
}

class _MySearchUser extends State<MySearchUser> {

  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search User')),
      body: _buildBody(context),

    );
  }


  Widget _buildBody(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    final firestoreInstance = Firestore.instance;

    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("Enter email address"), Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(Icons.card_giftcard),
                  hintText: 'Please enter the email address to search',
                  labelText: 'Email address',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the email address!';
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
                     // createRecord(productNameController.text, weightController.text, emailController.text);
                     // Scaffold.of(context).showSnackBar(snackBar);
                    //  _showRelatedEmails(emailController.text);
                      firestoreInstance
                          .collection("users")
                          .where("email", isGreaterThanOrEqualTo: emailController.text)
                          .getDocuments()
                          .then((value) {
                        value.documents.forEach((result) {
                          print(result.data);
                        });
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
  Widget _showRelatedEmails(String emailController) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.email),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.email),
          trailing: Text(record.firstName.toString()),
         // onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)}),       ),
      ),
    ),);
  }

}

class Record {
  final String email;
  final String firstName;
  final String familyName;
  final String id;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['email'] != null),
        assert(map['firstName'] != null),
        assert(map['familyName'] != null),
        assert(map['id'] != null),

        email = map['email'],
        firstName = map['firstName'],
        familyName = map['familyName'],
        id = map['id'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$email:$id>";
}
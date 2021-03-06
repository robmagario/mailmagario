import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mailmagario/my_drawer.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ManageAddresses extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MyManageAddresses();
  }
}
class MyManageAddresses extends StatefulWidget {

  @override
  _MyManageAddresses createState() {
    return _MyManageAddresses();
  }
}

class _MyManageAddresses extends State<MyManageAddresses> {


  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Addresses')),
      body: _buildBody(context),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_address');
          // Add your onPressed code here!
        },
        child: Container(
          child:
          Column (
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Add'),
              ),
              Icon(FontAwesome.plus),
            ],

          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    AuthController authController = AuthController.to;
    final String _userId = authController.user.toString();
    return StreamBuilder<QuerySnapshot>(
     // stream: FirebaseFirestore.instance.collection('addresses').where('userId', isEqualTo: _userId.uid).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
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
      key: ValueKey(record.address1),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          subtitle: Text(record.address1+' '+record.address2+' '+record.city+' '+record.phone+' '+record.zipCode),
          onLongPress: (){
            //record.reference.delete();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Confirmation"),
                content: Text("Would you like to delete this address?"),
                actions: <Widget>[
                  FlatButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.of(context).pop()),
                  FlatButton(
                    child: Text("Yes, delete it."),
                    onPressed: () {
                                    record.reference.delete();
                                    Navigator.of(context).pop();
                                  } )
                ],

              ),
            );
          },
        /*  trailing: (record.selected == true)
              ? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
          onTap: () => (record.selected == true)
              ? record.reference.update({'selected': false}):record.reference.update({'selected': true}),
*/
        ),
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


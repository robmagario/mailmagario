import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:mailmagario/providers/login_provider.dart';
import 'package:provider/provider.dart';


class CreateOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MyCreateOrder();
  }
}
class MyCreateOrder extends StatefulWidget {

  @override
  _MyCreateOrder createState() {
    return _MyCreateOrder();
  }
}

class _MyCreateOrder extends State<MyCreateOrder> {


  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Order')),
      body: _buildBody(context),
      drawer: MyDrawer(),
    );
  }

  Widget _buildBody(BuildContext context) {
    final User _userId = context.watch<LoginProvider>().user;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').where('id', isEqualTo: _userId.uid).snapshots(),
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
      key: ValueKey(record.productName),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.productName),
          subtitle: Text(record.weight.toString() + " grams"),
          trailing: (record.selected == true)
              ? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
          onTap: () => (record.selected == true)
            ? record.reference.update({'selected': false}):record.reference.update({'selected': true}),
        
        ),
      ),
    );
  }
}



class Record {
  final String id;
  final String productName;
  final int weight;
  final DocumentReference reference;
  bool selected;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['productName'] != null),
        assert(map['weight'] != null),
        assert(map['selected'] != null),
        id = map['id'],
        productName = map['productName'],
        weight = map['weight'],
        selected = map['selected'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

//  @override
 // String toString() => "Record<$name:$votes>";
}


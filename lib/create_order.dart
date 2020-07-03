import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mailmagario/myDrawer.dart';
import 'authentication.dart';

class CreateOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MyCreateOrder();



  }
}
class MyCreateOrder extends StatefulWidget {
 // MyCreateOrder({Key key}) : super(key: key);

  MyCreateOrder({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  _MyCreateOrder createState() {
    return _MyCreateOrder();
  }
}

class _MyCreateOrder extends State<MyCreateOrder> {
  String _userId = "";
  String _email = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
          _email = user?.email;
        }
      });
    });
  }


  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Order')),
      body: _buildBody(context),
      drawer: MyDrawer(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').where('id', isEqualTo: _userId).snapshots(),
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
      key: ValueKey(record.productName),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.productName),
          trailing: (record.selected == true)
              ? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
          onTap: () => (record.selected == true)
            ? record.reference.updateData({'selected': false}):record.reference.updateData({'selected': true}),
        
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
      : this.fromMap(snapshot.data, reference: snapshot.reference);

//  @override
 // String toString() => "Record<$name:$votes>";
}


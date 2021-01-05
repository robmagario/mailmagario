import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:get/get.dart';
import 'package:mailmagario/models/product.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:mailmagario/controllers/product_controller.dart';
import 'package:mailmagario/services/database.dart';

class CreateOrder extends StatelessWidget {
  CreateOrder({Key key}) : super(key: key);
  AuthController authController = AuthController.to;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ProductController c = Get.put<ProductController>(ProductController());
    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(),
      appBar: AppBar(
        /*title: Obx(() => authController.user != null
              ? Text(" ${authController?.user?.value?.email}")
              : Container()),*/
        title: Text('Create Order'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                authController.signOut();
              })
        ],
      ),
      body: GetX<ProductController>(
        init: Get.put<ProductController>(ProductController()),
        builder: (ProductController productController) {
          if (productController != null && productController.products != null) {
            return Column(
              children: [Expanded(
            child: ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (_, index) {
                  return //Text(productController.products[index].productName);
                    ListTile(
                      title: Text(productController.products[index].productName),
                      subtitle: Text(productController.products[index].weight.toString() + " grams"),
                      trailing: (productController.products[index].selected == true)
                          ? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
//  ? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
                      onTap: () {

                        if (productController.products[index].selected == true) {
                          Database().updateSelectedProduct(false, productController.products[index].id);
                          productController.deductfromTotal(productController.products[index].weight);
                        } else
                        {
                          Database().updateSelectedProduct(true, productController.products[index].id);
                          productController.addtoTotal(productController.products[index].weight);
                        }
                      },

                    );


                },
              ),),
          Divider(),
          Align(
          alignment: Alignment.centerRight,
          child: Text(
          // remember, context.select allows you to
          // listen to specific properties, and ignore the rest of a class
          'TOTAL: ${productController.total.toString()} grams',
          style: Theme.of(context).textTheme.headline3,
          ),)
              ]
            );
          } else {
            return Text("loading...");
          }
        },
      ),



    );
  }
}


/*
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
  //  final User _userId = context.watch<LoginProvider>().user;
    AuthController authController = AuthController.to;
    final String _userId = authController.user.toString();
    return StreamBuilder<QuerySnapshot>(
      //stream: FirebaseFirestore.instance.collection('products').where('id', isEqualTo: _userId.uid).snapshots(),
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
    final cartController = Get.put(CartController());
    Product product = Product(id: record.id,
        productName: record.productName,
        weight: record.weight);


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
          trailing: (cartController.containsCart(product) == true)
             ? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
//  ? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
          onTap: () {

            if (cartController.containsCart(product) == false) {
              cartController.addToCart(product);
            } else
              {
                cartController.removeFromCart(product);
              }
          },
        ),
      ),
    );
  }
}

class Record {
  final String id;
  final String productName;
  final double weight;
  final DocumentReference reference;
  bool selected;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['id'] != null),
        assert(map['productName'] != null),
        assert(map['weight'] != null),

        id = map['id'],
        productName = map['productName'],
        weight = map['weight'],
        selected = map['selected'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);


}

*/
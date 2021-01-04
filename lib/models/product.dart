import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
 // String content;
 // String todoId;
 // Timestamp dateCreated;
 // bool done;
   String id;
   String productName;
   double weight;
   String receivedTrackingNumber;
   String sentTrackingNumber;
   String userId;
   Timestamp createdOn;
   bool selected;

  ProductModel({ this.id,
    this.productName,
    this.weight,
    this.receivedTrackingNumber,
    this.sentTrackingNumber,
    this.userId,
    this.createdOn,
    this.selected,
  }
      );


   factory ProductModel.fromSnapshot(DocumentSnapshot snap) {
     return ProductModel(
         id: snap.id,
         productName: snap.data()["productName"],
         weight: snap.data()['weight'],
         receivedTrackingNumber: snap.data()['receivedTrackingNumber'],
         sentTrackingNumber: snap.data()['sentTrackingNumber'],
         userId:snap.data()['userId'],
         createdOn: snap.data()['createdOn'],
         selected: snap.data()['selected'],
     );
   }


/*
  ProductModel.fromDocumentSnapshot(
      DocumentSnapshot snap,
      ) {
    id: snap.id;
    productName: snap.data()["productName"];
    weight: snap.data()['weight'];
    receivedTrackingNumber: snap.data()['receivedTrackingNumber'];
    sentTrackingNumber: snap.data()['sentTrackingNumber'];
    userId:snap.data()['userId'];
  }
   */
}


/*
class Product {
  final String id;
  final String productName;
  final double weight;
  final String receivedTrackingNumber;
  final String sentTrackingNumber;
  final String userId;

  Product({
    this.id,
    this.productName,
    this.weight,
    this.receivedTrackingNumber,
    this.sentTrackingNumber,
    this.userId,
  });


  final isFavorite = false.obs;

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
        id: snap.id,
        productName: snap.data()["productName"],
        weight: snap.data()['weight'],
        receivedTrackingNumber: snap.data()['receivedTrackingNumber'],
        sentTrackingNumber: snap.data()['sentTrackingNumber'],
        userId:snap.data()['userId']);
  }

  CollectionReference productsRef = FirebaseFirestore.instance.collection("products");
  Stream<Iterable<Product>> findAll(userId) {
    return productsRef
        .where("userId", isEqualTo: userId)
        .get()
        .then((value) {
      return value.docs.map((e) => Product.fromSnapshot(e));
    }).asStream();
    //Here we are converting the firebase snapshot to a stream of user todo list.
  }



}
*/
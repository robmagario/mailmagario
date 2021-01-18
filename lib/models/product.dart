import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
   String id;
   String productName;
   double weight;
   String receivedTrackingNumber;
   String sentTrackingNumber;
   String userId;
   Timestamp createdOn;

  ProductModel({ this.id,
    this.productName,
    this.weight,
    this.receivedTrackingNumber,
    this.sentTrackingNumber,
    this.userId,
    this.createdOn,

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

     );
   }
}


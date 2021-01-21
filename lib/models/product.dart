import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductModel {
  ProductModel({
   String id,
   String productName,
   double weight,
   String receivedTrackingNumber,
   String sentTrackingNumber,
   String userId,
   Timestamp createdOn,
  }) {
    this.id = id;
    this.productName = productName;
    this.weight = weight;
    this.receivedTrackingNumber = receivedTrackingNumber;
    this.sentTrackingNumber = sentTrackingNumber;
    this.userId = userId;
    this.createdOn = createdOn;
  }


   RxString _id = RxString();
   set id(String value) => _id.value = value;
   String get id => _id.value;

   RxString _productName = RxString();
   set productName(String value) => _productName.value = value;
   String get productName => _productName.value;

   RxDouble _weight = RxDouble();
   set weight(double value) => _weight.value = value;
   double get weight => _weight.value;

   RxString _receivedTrackingNumber = RxString();
   set receivedTrackingNumber(String value) => _receivedTrackingNumber.value = value;
   String get receivedTrackingNumber => _receivedTrackingNumber.value;

   RxString _sentTrackingNumber = RxString();
   set sentTrackingNumber(String value) => _sentTrackingNumber.value = value;
   String get sentTrackingNumber => _sentTrackingNumber.value;

   RxString _userId = RxString();
   set userId(String value) => _userId.value = value;
   String get userId => _userId.value;

    Rx<Timestamp> _createdOn = Rx<Timestamp>();
    set createdOn(Timestamp value) => _createdOn.value = value;
    Timestamp get createdOn => _createdOn.value;




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


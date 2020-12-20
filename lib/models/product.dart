import 'package:get/state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String productName;
  final double weight;

  Product({
    this.id,
    this.productName,
    this.weight,
  });

  final isFavorite = false.obs;

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
        id: snap.id,
        productName: snap.data()["productName"],
        weight: snap.data()['weight']);
  }

}

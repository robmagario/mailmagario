import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailmagario/models/product.dart';

class ProductService {
  CollectionReference productsRef = FirebaseFirestore.instance.collection("products");
  Stream<Iterable<Product>> findAll(userId) {
    return productsRef
        .where("user_id", isEqualTo: userId)
        .get()
        .then((value) {
      return value.docs.map((e) => Product.fromSnapshot(e)).toList();
    }).asStream();
    //Here we are converting the firebase snapshot to a stream of user todo list.
  }

  Future<Product> findOne(String id) async {
    var result = await productsRef.doc(id).get();
    return Product.fromSnapshot(result);
  }

  Future<Product> addOne(String userId, String title, {bool done = false}) async {
    var result =
    await productsRef.add({"user_id": userId, "title": title, "done": done});
    return Product(id: result.id, title: title, done: done);
  }

  Future<void> updateOne(Product product) async {
    productsRef.doc(product.id).update(product.toJson());
  }

  deleteOne(String id) {
    productsRef.doc(id).delete();
  }
}
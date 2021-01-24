import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailmagario/models/product.dart';


class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*
  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").document(user.id).setData({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
*/
  /*
  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
      await _firestore.collection("users").document(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
*/

  Future<void> addProduct(String content, String uid) async {
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("products")
          .add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ProductModel> findOne(String id) async {
   // var result = await _firestore.doc(id).get();
    var result = await _firestore.collection("products").doc(id).get();
    return ProductModel.fromSnapshot(result);
  }

  Stream<List<ProductModel>> productStream(String uid) {
    return _firestore
       // .doc(uid)
        .collection("products")
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ProductModel.fromSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .updateData({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateSelectedProduct(bool newValue, String id) async {
    try {
      _firestore
          .collection("products")
          .doc(id)
          .update({"selected": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }


}
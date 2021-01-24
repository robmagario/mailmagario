import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mailmagario/controller.dart';
import 'package:mailmagario/models/product.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:mailmagario/services/database.dart';
import 'package:mailmagario/models/cart_item.dart';

class CreateOrderController extends GetxController {
  AppController appController = Get.find();
  RxList<ProductModel> productList = RxList<ProductModel>([]);
  List<ProductModel> get products => productList.value;

  int get cartQuantity {
    return appController.cartItems.length;
  }
/*
  bool containsCart(ProductModel product){
    return appController.cartItems.contains(product);
  }
*/
  CreateOrderController() {
    loadProducts();
  }

  loadProducts() async  {
    String uid = Get.find<AuthController>().user.toString();
    productList
        .bindStream(Database().productStream(uid)); //stream coming from firebase
  }


}
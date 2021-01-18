import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:mailmagario/models/cart_item.dart';
import 'package:mailmagario/models/product.dart';
import 'package:mailmagario/controller.dart';
import 'package:mailmagario/services/database.dart';


class ProductController extends GetxController {
  AppController appController = Get.find();
  Rx<ProductModel> _product = Rx<ProductModel>();
  setProduct(ProductModel value) => _product.value = value;

  ProductModel get product {
    return _product.value;
  }

  ProductController() {
    loadProduct();
  }

 String id = Get.parameters["id"].toString();


  loadProduct() async {
    try {


      setProduct(await Database().findOne(id));
  } catch (error) {
  print(error.toString());
  }
}
/*
addProduct() {
  try {
    CartItemModel cartItem =
    appController.cartItems.value.firstWhere((cartItem) {
      return cartItem.product.id == this.product.id;
    });
    cartItem.incrementQuantity();
  } catch (error) {
    appController.cartItems.add(CartItemModel(
      product: this.product,
      quantity: 1,
    ));
  }
  Get.back();
}
*/
}

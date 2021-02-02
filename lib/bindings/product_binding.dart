import 'package:get/get.dart';

import 'package:mailmagario/pages/cart/cart_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<CartController>(() => CartController());
  }
}
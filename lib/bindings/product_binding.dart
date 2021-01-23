import 'package:get/get.dart';

import 'package:mailmagario/pages/cart/cart_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {

   // Get.create<ProductController>(() => ProductController()); // different instances for different list items

  //  Get.put<ProductController>(ProductController(), tag: 'selected'); // seperate instance to display total
  //  Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
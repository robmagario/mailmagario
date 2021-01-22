import 'package:get/state_manager.dart';
import 'package:mailmagario/models/product.dart';
import 'package:mailmagario/controller.dart';
import 'package:get/get.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:mailmagario/utils/colors.dart';
import 'package:mailmagario/models/cart_item.dart';

class CartController extends GetxController {
  AppController appController = Get.find();

  String get total {
    double fold = appController.cartItems.value.fold(0, (subtotal, cartItem) {
      return subtotal + cartItem.product.weight;
    });
    return "U\$" + fold.toStringAsFixed(2);
  }

  deleteItem(CartItemModel cartItemModel) {
    appController.cartItems.removeWhere((cartItem) {
      return cartItem.product.id == cartItemModel.product.id;
    });
  }

  bool containsCart(ProductModel product){
    return appController.cartItems.contains(product);
  }

  placeOrder() {
    appController.cartItems.clear();
    Get.back();
    Get.snackbar(
      "Placed",
      "Order placed with success!",
      backgroundColor: AppColors.DARK,
      colorText: AppColors.WHITE,
      padding: EdgeInsets.all(15),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(25),
      icon: Icon(Feather.check, color: AppColors.LIGHT_GREEN, size: 21),
    );
  }

}

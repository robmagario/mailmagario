import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:get/get.dart';
import 'package:mailmagario/models/product.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mailmagario/services/database.dart';
import 'package:mailmagario/pages/create_order/create_order_controller.dart';
import 'package:mailmagario/widgets/appbar_action.dart';
import 'package:mailmagario/pages/create_order/widgets/list_products.dart';
import 'package:mailmagario/pages/cart/cart_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final cartRiverpodProvider = StateNotifierProvider((ref) => new CartRiverpod());

class CreateOrder extends ConsumerWidget {
  CreateOrder({Key key}) : super(key: key);
  AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final productList = watch(cartRiverpodProvider.state);
    return GetBuilder<CreateOrderController>(
        init: CreateOrderController(),
        builder: (controller) {
          return Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              title: Text('Create Order'),
              centerTitle: true,
              actions: <Widget>[
                Obx(
                      () =>
                      CustomAppBarAction(
                            () => Get.toNamed("/cart"),
                        Feather.shopping_cart,
                        //quantity: controller.cartQuantity,
                        quantity: productList.length,
                      ),
                ),
              ],
            ),
            body: ListProducts(),
          );
        });
  }
}

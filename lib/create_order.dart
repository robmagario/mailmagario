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
import 'package:mailmagario/controllers/create_order_controller.dart';
import 'package:mailmagario/widgets/appbar_action.dart';

class CreateOrder extends StatelessWidget {
  AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
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
                        quantity: controller.cartQuantity,
                      ),
                ),
              ],
            ),
            body: GetX<CreateOrderController>(
              init: Get.put<CreateOrderController>(CreateOrderController()),
              builder: (CreateOrderController createOrderController) {
                if (createOrderController != null &&
                    createOrderController.products != null) {
                  return Column(
                      children: [Expanded(
                        child: ListView.builder(
                          itemCount: createOrderController.products.length,
                          itemBuilder: (_, index) {
                            return //Text(productController.products[index].productName);
                              ListTile(
                                title: Text(
                                    createOrderController.products[index]
                                        .productName),
                                subtitle: Text(
                                    createOrderController.products[index].weight
                                        .toString() + " grams"),
                                onTap: () {
                                  Get.toNamed("/products/${createOrderController
                                      .products[index].id.toString()}");
                                },

                              );
                          },
                        ),),
                        Divider(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            // remember, context.select allows you to
                            // listen to specific properties, and ignore the rest of a class
                            'TOTAL:  grams',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline3,
                          ),)
                      ]
                  );
                } else {
                  return Text("loading...");
                }
              },
            ),


          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:mailmagario/pages/product/product_controller.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Product extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AuthController authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          key: scaffoldKey,
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text('Product Detail'),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
                icon: Icon(Icons.menu)),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    authController.signOut();
                  })
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
            //  color: AppColors.WHITE,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(

              children: <Widget>[
                Obx(
                      () => Text(
                    controller.product.productName,
                      //  controller.id.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Obx(
                      () => Text(
                    controller.product.weight.toString(),
                    //  controller.id.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Obx(
                      () => Text(
                    controller.product.receivedTrackingNumber,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: FloatingActionButton.extended(
                onPressed: () {controller.addProduct();},
                icon: Icon(Feather.shopping_cart),
                label: Text('ADD TO CART'),
                  ),
                ),
              ],
            ),
          ),
          //bottomNavigationBar: Obx(() => ProductDetails(controller.product)),
        );
      },
    );
  }
}

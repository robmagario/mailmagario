import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mailmagario/pages/product/product_controller.dart';
import 'package:mailmagario/myDrawer.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailmagario/pages/cart/cart_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/pages/create_order/create_order_view.dart';
import 'package:mailmagario/services/database.dart';

class Product extends ConsumerWidget {
  Product({Key key}) : super(key: key);
  String id;


 // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context, ScopedReader watch) {

    RouteSettings settings = ModalRoute.of(context).settings;
    id = settings.arguments;
    final productStream = watch(findOneFamily(id));


    return Scaffold(
        //  key: scaffoldKey,
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text('Product Detail'),
            centerTitle: true,
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
                 Text(
                    productStream.data.value.productName,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                 Text(
                   productStream.data.value.weight.toString(),
                    //  controller.id.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Text(
                  productStream.data.value.receivedTrackingNumber,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Container(
                  child: FloatingActionButton.extended(

                    onPressed: () {
                      context.read(cartRiverpodProvider).add(productStream.data.value);
                      Navigator.pop(context);
                      },
                icon: Icon(Feather.shopping_cart),
                label: Text('ADD TO CART'),
                  ),
                ),
              ],
            ),
          ),
          //bottomNavigationBar: Obx(() => ProductDetails(controller.product)),
        );

  }
}

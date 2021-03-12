import 'package:flutter/material.dart';
import 'package:mailmagario/my_drawer.dart';
import 'package:mailmagario/controllers/auth_controller.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mailmagario/widgets/appbar_action.dart';
import 'package:mailmagario/pages/create_order/widgets/list_products.dart';
import 'package:mailmagario/pages/cart/cart_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartRiverpodProvider = StateNotifierProvider((ref) => new CartRiverpod());

final totalProvider = Provider((ref) {
  double weight = 0;
  final cart = ref.watch(cartRiverpodProvider.state);
  for (final product in cart) {
    weight = weight + product.weight;
  }
  return weight;
});
       //  for (final product in .watch(cartRiverpodProvider.state) {

 // return ref
  //    .watch(cartRiverpodProvider.state)
  //    .length.toString();


class CreateOrder extends ConsumerWidget {
  CreateOrder({Key key}) : super(key: key);
  AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final productList = watch(cartRiverpodProvider.state);

          return Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              title: Text('Create Order'),
              centerTitle: true,
              actions: <Widget>[
                      CustomAppBarAction("cart",
                       Feather.shopping_cart,
                        quantity: productList.length,

                  //    ),
                     ),
             ],),
              body: ListProducts(),
          );
      //  });
  }
}

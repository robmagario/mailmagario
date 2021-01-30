import 'package:flutter/material.dart';
import 'package:mailmagario/models/cart_item.dart';
import 'package:mailmagario/pages/cart/cart_controller.dart';
import 'package:mailmagario/pages/cart/cart_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/pages/product/product_view.dart';
import 'package:mailmagario/pages/create_order/create_order_view.dart';



class CartList extends ConsumerWidget {
  CartList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final cartList = watch(cartRiverpodProvider.state);
    return Column(
      children: [
      Container(
      height: 100,
      child: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (BuildContext context, int index) {
          CartItemModel cartItem = cartList[index];
          return ListTile(
            title: Text(cartList[index].product.productName),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              // 3
              onPressed: () =>
                  context.read(cartRiverpodProvider).remove(cartItem.id),
            ),
          );
        },
      ),
    ),
    ]);

    /*   return ListView.separated(
        padding: EdgeInsets.all(25),
        itemCount: cartList.length,
        separatorBuilder: (context, index) => Divider(height: 25),
        itemBuilder: (context, index) {
          return CartItem();
        },
      ); */

  }
}

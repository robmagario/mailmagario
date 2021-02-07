import 'package:flutter/material.dart';
import 'package:mailmagario/models/cart_item.dart';
import 'package:mailmagario/pages/cart/cart_controller.dart';
import 'package:mailmagario/pages/cart/cart_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/pages/product/product_view.dart';
import 'package:mailmagario/pages/create_order/create_order_view.dart';
import 'package:timeago/timeago.dart' as timeago;


class CartList extends ConsumerWidget {
 // CartList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {

    final productList = watch(cartRiverpodProvider.state);
    return Column(
      children: [
      Container(
      height: 500,
      child: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          CartItemModel cartItem = productList[index];
          return ListTile(
            title: Text(productList[index].product.productName),
            subtitle: Text('Date: ${timeago.format(productList[index].product.createdOn.toDate())} Tracking Number: ${productList[index].product.receivedTrackingNumber} Weight: ${productList[index].product.weight.toString()} grams'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              // 3
              onPressed: () =>
                  context.read(cartRiverpodProvider).remove(cartItem.id),
            ),
            isThreeLine: true,

          );
        },
      ),
    ),
    ]);

  }
}

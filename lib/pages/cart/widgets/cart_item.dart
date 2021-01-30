import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:mailmagario/models/cart_item.dart';
import 'package:mailmagario/pages/cart/cart_controller.dart';
import 'package:mailmagario/pages/cart/widgets/cart_item_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/pages/product/product_view.dart';


class CartItem extends ConsumerWidget{
  const CartItem({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final cartItem = watch(cartRiverpodProvider.state);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
               // this.cartItem.product.productName,
                "aaaaaa",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                ],
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
           // CartItemButton(Feather.minus, this.cartItem.decrementQuantity),
          //  SizedBox(width: 10),
          //  CartItemButton(Feather.plus, this.cartItem.incrementQuantity),
            SizedBox(width: 10),
            CartItemButton(Feather.trash, () => cartController.deleteItem(this.cartItem)),
          ],
        )
      ],
    );
  }
}

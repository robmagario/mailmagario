import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:mailmagario/models/cart_item.dart';
import 'package:mailmagario/pages/cart/cart_controller.dart';
import 'package:mailmagario/pages/cart/widgets/cart_item_button.dart';

class CartItem extends StatelessWidget {
  final CartController cartController = Get.find();
  final CartItemModel cartItem;
  CartItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
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
                this.cartItem.product.productName,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                this.cartItem.product.id,
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

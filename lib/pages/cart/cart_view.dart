import 'package:flutter/material.dart';
import 'package:mailmagario/utils/colors.dart';
import 'widgets/cart_list.dart';
import 'widgets/cart_total.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColors.LIGHT,
          appBar: AppBar(
            title: Text('Cart'),
            centerTitle: true,
          ),
          body: CartList(),
          bottomNavigationBar: CartTotal(),
        );

  }
}

import 'package:flutter/material.dart';
import 'package:mailmagario/utils/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/pages/create_order/create_order_view.dart';
import 'package:intl/intl.dart';

class CartTotal extends ConsumerWidget  {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final cart = watch(cartRiverpodProvider);
    final total = watch(totalProvider);
    var f = new NumberFormat("#,###", "en_US");

    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.WHITE,
        border: Border(
          top: BorderSide(
            color: AppColors.LIGHT,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "TOTAL",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.DARK,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                //  Obx(
                   //     () =>
                            Text(
                           //   f.format(totalProvider),
                              total.toString(),

                      style: TextStyle(
                        fontSize: 26,
                        color: AppColors.LIGHT_GREEN,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
               //  )
                ],
              ),
            ),
            Expanded(
              child: Text("PURCHASE"),
              /*OrganicButton(
                controller.placeOrder,
                "PURCHASE",
                Feather.chevron_right,
              ),*/
            ),
          ],
        ),
      ),
    );
  }
}

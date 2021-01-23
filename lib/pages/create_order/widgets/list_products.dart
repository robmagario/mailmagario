import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailmagario/pages/create_order/create_order_controller.dart';


class ListProducts extends StatelessWidget {
  final CreateOrderController createOrderController = Get.find();
  final double itemHeight = 130;
  final double itemWidth = Get.width / 2 - 100;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        return Column(
            children: [Expanded(
              child: ListView.builder(
                itemCount: createOrderController.products.length,
                itemBuilder: (_, index) {
                  return
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
                      //   enabled: controller.containsCart(createOrderController.products[index].id.toString()) ? false : true,

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
      },
    );
  }
}

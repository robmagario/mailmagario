import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailmagario/services/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListProducts extends ConsumerWidget {
  ListProducts({Key key}) : super(key: key);
 // final CreateOrderController createOrderController = Get.find();
  final double itemHeight = 130;
  final double itemWidth = Get.width / 2 - 100;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
   final productStream = watch(productListStreamProvider);
   return ListView.builder(
       padding: const EdgeInsets.all(8),
       itemCount: productStream.data.value.length,
       itemBuilder: (BuildContext context, int index) {
         return ListTile(
             title: Text(productStream.data.value[index].productName),
             subtitle: Text(
                 productStream.data.value[index].weight
             .toString() + " grams"),
         onTap: () {
             // Navigator.pushNamed(context, '/products/${productStream.data.value[index].id.toString()}');
              Navigator.pushNamed(context, '/products', arguments: productStream.data.value[index].id.toString());
         },
         //   enabled: controller.containsCart(createOrderController.products[index].id.toString()) ? false : true,

         );
         /*return Container(
           height: 50,
           child: Center(child: Text('Entry ${productStream.data.value[index].productName}')),
         );
         */
       }
   );
  }
    /*return Obx(
          () {
        return Column(
            children: [Expanded(
              child: StreamBuilder<List<productStream>>(
                itemCount: productStream.data.value.length,
                itemBuilder: (_, index) {
                  return
                    ListTile(
                      title: Text(

                       //   createOrderController.products[index]
                      //        .productName),
                      subtitle: Text(
                          createOrderController.products[index].weight
                              .toString() + " grams"),
                      onTap: () {
                        Get.toNamed("/products/${createOrderController
                            .products[index].id.toString()}");

                     //   Navigator.pushNamed(context, "/products", arguments: {"id", createOrderController.products[index].id.toString()});
                  //      Navigator.pushNamed(context, '/products/${createOrderController.products[index].id.toString()}');

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
    );*/
  }


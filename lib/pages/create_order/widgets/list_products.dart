import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailmagario/services/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:mailmagario/pages/create_order/create_order_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:mailmagario/pages/product/product_list.dart';

/*
final productListProvider = StateNotifierProvider((ref) {
  final proListSt =  ref.watch(productListStreamProvider);
  return proListSt;
});

 */

//final productListProvider = StateNotifierProvider((ref) => new ProductList());

class ListProducts extends ConsumerWidget {
  ListProducts({Key key}) : super(key: key);
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

             subtitle: Text('Date: ${timeago.format(productStream.data.value[index].createdOn.toDate())} Tracking Number: ${productStream.data.value[index].receivedTrackingNumber} Weight: ${productStream.data.value[index].weight.toString()} grams'),
           onTap: () {
              Navigator.pushNamed(context, '/products', arguments: productStream.data.value[index].id.toString());
         },


         );
       }
   );
  }

  }


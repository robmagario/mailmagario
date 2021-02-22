import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailmagario/models/product.dart';
import 'package:mailmagario/services/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:mailmagario/pages/create_order/create_order_view.dart';

class ProductList extends StateNotifier<List<ProductModel>> {

  ProductList(this._read, [List<ProductModel> products]) : super(products??[]);

  final Reader _read;

  void getProductState() async {
  state = [_read(productListStreamProvider)];
          }

  //ProductList([List<ProductModel>? initialProducts]) : super(initialProducts ?? []);


  void toggle(String id) {
    state = [
      for (final product in state)
        if (product.id == id)
          ProductModel(
            id: product.id,
            productName: product.productName,
            weight: product.weight,
            receivedTrackingNumber: product.receivedTrackingNumber,
            sentTrackingNumber: product.sentTrackingNumber,
            userId: product.userId,
            createdOn: product.createdOn,
            ordered: !product.ordered,
          )
        else
          product,
    ];
  }

}
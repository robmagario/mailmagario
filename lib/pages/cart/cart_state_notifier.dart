import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/models/cart_item.dart';
import "package:mailmagario/models/product.dart";
import 'package:mailmagario/services/database.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter/material.dart';
import 'package:mailmagario/pages/cart/cart_riverpod.dart';
import 'package:mailmagario/pages/create_order/create_order_view.dart';

class CartStateNotifier extends StateNotifier<double>{

CartStateNotifier(total) : super(total ?? []);

double total = 0;
// final cartRiverpodProvider = StateNotifierProvider((ref) => new CartRiverpod());

final cartList = ref.watch(cartRiverpodProvider.state);

void initState() {
for (final product in cartRiverpodProvider) {
total = total + product.weight;

}
}



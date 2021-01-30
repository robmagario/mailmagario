import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/models/cart_item.dart';
import "package:mailmagario/models/product.dart";


class CartRiverpod extends StateNotifier<List<CartItemModel>> {
  // 3
  CartRiverpod([List<CartItemModel> products]) : super(products ?? []);

  // 4
  void add(ProductModel product) {
    state = [...state, new CartItemModel(product:product)];
    print ("added");
  }
  // 4
  /*
  void toggle(String id) {
    state = [
      for (final product in state)
        if (product.id == id)
          ProductModel(
            id: product.id,
            completed: !product.completed,
            title: product.title,
          )
        else
          product,
    ];
  }
  // 4
  void edit(Todo updatedTodo) {
    state = [
      for (final todo in state)
        if (todo.id == updatedTodo.id)
          Todo(
            id: todo.id,
            completed: todo.completed,
            title: updatedTodo.title,
          )
        else
          todo,
    ];
  }

   */
  // 4
  void remove(String id) {
    state = state.where((product) => product.id != id).toList();
  }
}
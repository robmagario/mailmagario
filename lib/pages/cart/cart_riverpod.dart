import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailmagario/models/cart_item.dart';
import "package:mailmagario/models/product.dart";
import 'package:mailmagario/services/database.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter/material.dart';

class CartRiverpod extends StateNotifier<List<CartItemModel>> {

  CartRiverpod([List<CartItemModel> products]) : super(products ?? []);
 // final productStream = FutureProvider<List<ProductModel>>((ref) async {
 //   final ListofProducts = await ref.watch(productListStreamProvider);
 // });
  //final productStream = ref.watch(productListStreamProvider);



    void add(ProductModel addProduct) {
      bool productExists = false;

        for (final product in state) {
          if (product.id == addProduct.id) {
            print("not added");
            productExists = true;
            OneContext().showSnackBar(
                builder: (_) => SnackBar(content: Text('Item was already in shopping cart and cannot be added again!'), backgroundColor:Colors.red)
            );
          }
      else {

          }
    }
        if (productExists==false)
      {
        state = [
          ...state, new CartItemModel(product: addProduct),
        ];
        print("added");
      }

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
  */
/*
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

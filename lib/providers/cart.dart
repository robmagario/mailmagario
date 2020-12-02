/*
import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {

  /// Internal, private state of the cart. Stores the ids of each item.
//  final List<Item> _items = [];

  Map<int, int> _items = {};

  Map<int, int> get items => _items;

  /// List of items in the cart.
//  List<Item> get items => List(_items);

  /// The current total price of all items.
  int get totalPrice =>
      _items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _items.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item.id);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }

}

//@immutable
class Item {
  final int id;
  final String productName;
  final int weight;

  Item(this.id, this.productName, this.weight);
  // To make the sample app look nicer, each item is given one of the
  // Material Design primary colors.
  // : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

 */
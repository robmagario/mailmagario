import 'package:get/state_manager.dart';

class Product {
  final String id;
  final String productName;
  final double weight;

  Product({
    this.id,
    this.productName,
    this.weight,
  });

  final isFavorite = false.obs;
}

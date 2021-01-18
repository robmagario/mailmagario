import 'package:get/state_manager.dart';
import 'package:mailmagario/models/product.dart';

class CartController extends GetxController {
  var cartItems = List<ProductModel>().obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.weight);

  addToCart(ProductModel product) {
    cartItems.add(product);
  }

  removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  bool containsCart(ProductModel product){
    return cartItems.contains(product);
  }

}

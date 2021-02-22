import 'package:get/get.dart';
import './product.dart';


class CartItemModel  {
  CartItemModel({
    ProductModel product,
    bool selected,
}) {
    this.product = product;
    this.selected = selected;
  }

  String get id {
    return product.id;
  }


  Rx<ProductModel> _product = Rx<ProductModel>();
  set product(ProductModel value) => _product.value = value;
  ProductModel get product => _product.value;

  RxBool _selected = RxBool();
  set selected(bool value) => _selected.value = value;
  bool get selected => _selected.value;

  makeTrue(){
    this.selected = true;
  }

  makeFalse(){
    this.selected = false;
  }

}
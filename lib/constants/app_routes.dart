import 'package:get/get.dart';
import 'package:mailmagario/pages/cart/cart_controller.dart';
import 'package:mailmagario/my_app.dart';
import 'package:mailmagario/screens/splash_screen.dart';
import 'package:mailmagario/see_shipping_rates.dart';
import 'package:mailmagario/search_user.dart';
import 'package:mailmagario/manage_addresses.dart';
import 'package:mailmagario/create_address.dart';
import 'package:mailmagario/create_order.dart';
import 'package:mailmagario/screens/home_screen.dart';
import 'package:mailmagario/pages/product/product_view.dart';
import 'package:mailmagario/pages/cart/cart_view.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: '/see_shipping_rates', page: () => SeeShippingRates()),
    GetPage(name: '/create_order', page: () => CreateOrder()),
    GetPage(name: '/search_user', page: () => SearchUser()),
    GetPage(name: '/manage_addresses', page: () => ManageAddresses()),
    GetPage(name: '/create_address', page: () => CreateAddress()),
    GetPage(name: "products/:id", page: () => Product()),
    GetPage(name: "/cart", page: () => Cart()),
  ];
}
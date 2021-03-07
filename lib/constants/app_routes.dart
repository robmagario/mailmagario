import 'package:mailmagario/see_shipping_rates.dart';
import 'package:mailmagario/search_user.dart';
import 'package:mailmagario/manage_addresses.dart';
import 'package:mailmagario/create_address.dart';
import 'package:mailmagario/pages/create_order/create_order_view.dart';
import 'package:mailmagario/screens/home_screen.dart';
import 'package:mailmagario/pages/product/product_view.dart';
import 'package:mailmagario/pages/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:mailmagario/my_app.dart';
//import 'package:mailmagario/auth_home.dart';

var appRoutes = <String, WidgetBuilder>{
 // '/': (context) => MyApp(),
  '/see_shipping_rates': (context) => SeeShippingRates(),
  '/create_order': (context) => CreateOrder(),
  '/search_user': (context) => SearchUser(),
  '/manage_addresses': (context) => ManageAddresses(),
  '/create_address': (context) => CreateAddress(),
  '/products': (context) => Product(),
  '/cart': (context) => Cart(),
};

//
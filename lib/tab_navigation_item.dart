/// lib/presentation/tabs/models/tab_navigation_item.dart
import 'package:flutter/widgets.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: HomePage(),
      icon: Icon(Icons.home),
      title: "Home",
    ),
    TabNavigationItem(
      page: ShopPage(),
      icon: Icon(Icons.shopping_basket),
      title: "Shop",
    ),
    TabNavigationItem(
      page: SearchPage(),
      icon: Icon(Icons.search),
      title: "Search",
    ),
  ];
}
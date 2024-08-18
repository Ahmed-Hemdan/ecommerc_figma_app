import 'package:ecommerc_figma_app/Views/CartScreen/cart_screen.dart';
import 'package:ecommerc_figma_app/Views/HomePage/HomePage.dart';
import 'package:ecommerc_figma_app/Views/MainScreen/Controller/MainScreenController.dart';
import 'package:ecommerc_figma_app/Views/SearchScreen/search_screen.dart';
import 'package:ecommerc_figma_app/Views/SettingScreen/setting_screen.dart';
import 'package:ecommerc_figma_app/Views/WishList/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import 'package:screen_go/extensions/responsive_nums.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenController _controller = Get.put(MainScreenController());

  List<PersistentTabConfig> navBarsItems = [
    PersistentTabConfig(
      screen: HomePage(),
      item: ItemConfig(
        icon: Icon(Icons.home),
        title: "Home",
        activeForegroundColor: const Color(0xffEB3030),
        inactiveForegroundColor: Colors.black,
      ),
    ),
    PersistentTabConfig(
      screen: WishListScreen(),
      item: ItemConfig(
        icon: Icon(Icons.favorite),
        title: "WhishList",
        activeForegroundColor: const Color(0xffEB3030),
        inactiveForegroundColor: Colors.black,
      ),
    ),
    PersistentTabConfig(
      screen: const CartScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.shopping_cart),
        title: "",
        activeForegroundColor: const Color(0xffEB3030),
        inactiveBackgroundColor: Colors.white,
        
        inactiveForegroundColor: Colors.black,
      ),
    ),
    PersistentTabConfig(
      screen: const SearchScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.search),
        title: "Search",
       activeForegroundColor: const Color(0xffEB3030),
        inactiveForegroundColor: Colors.black,
      ),
    ),
    PersistentTabConfig(
      screen: const SettingScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.settings),
        title: "Setting",
       activeForegroundColor: const Color(0xffEB3030),
        inactiveForegroundColor: Colors.black,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 7.8.h,
      tabs: navBarsItems,
      navBarBuilder: (navBarConfig) => Style15BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}

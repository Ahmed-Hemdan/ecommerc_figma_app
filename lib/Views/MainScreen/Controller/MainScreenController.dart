import 'package:ecommerc_figma_app/Views/CartScreen/cart_screen.dart';
import 'package:ecommerc_figma_app/Views/HomePage/HomePage.dart';
import 'package:ecommerc_figma_app/Views/SearchScreen/search_screen.dart';
import 'package:ecommerc_figma_app/Views/SettingScreen/setting_screen.dart';
import 'package:ecommerc_figma_app/Views/WishList/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainScreenController extends GetxController {
  int currentIndex = 0 ;
  void navChangeIndex (int index ) {
    currentIndex = index  ;
  }
    List<Widget> navPages = const [
      HomePage(), 
      WishListScreen(),
      CartScreen(),
      SearchScreen(),
      SettingScreen(),
    ];



}
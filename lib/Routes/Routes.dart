import 'package:ecommerc_figma_app/Views/CartScreen/cart_screen.dart';
import 'package:ecommerc_figma_app/Views/OnboardingScreens/OnboardingScreen.dart';
import 'package:ecommerc_figma_app/Views/SearchScreen/search_screen.dart';
import 'package:ecommerc_figma_app/Views/SettingScreen/setting_screen.dart';
import 'package:ecommerc_figma_app/Views/SplashScreen/SplashScreen.dart';
import 'package:ecommerc_figma_app/Views/WishList/wish_list_screen.dart';
import 'package:get/get.dart';

import '../Auth/View/ForgetPasswordScreen/ForgetPasswordScreen.dart';
import '../Auth/View/LoginScreen/LoginScreen.dart';
import '../Auth/View/RegisterScreen/RegisterScreen.dart';
import '../Views/GetStarted/GetStratedScreen.dart';
import '../Views/MainScreen/MainScreen.dart';

List<GetPage> routes = [
  GetPage(name: "/MainScreen", page: () => const MainScreen()),
  GetPage(name: "/LoginScreen", page: () => const LoginScreen()),
  GetPage(name: "/RegisterScreen", page: () => const RegisterScreen()),
  GetPage(
      name: "/ForgetPasswordScreen", page: () => const ForgetPasswordScreen()),
  GetPage(name: "/GetStartedScreen", page: () => const GetStartedScreen()),
  GetPage(name: "/OnboardingScreen", page: () => const OnboardingScreen()),
  GetPage(name: "/SplashScreen", page: () => const SplashScreen()),
  GetPage(name: "/WishListScreen", page: () => const WishListScreen()),
  GetPage(name: "/CartScreen", page: () => const CartScreen()),
  GetPage(name: "/SearchScreen", page: () => const SearchScreen()),
  GetPage(name: "/SettingScreen", page: () => const SettingScreen()),
];

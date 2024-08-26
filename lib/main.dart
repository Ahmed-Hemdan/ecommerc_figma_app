
import 'package:ecommerc_figma_app/UploadScreen.dart';
import 'package:ecommerc_figma_app/Views/HomePage/HomePage.dart';
import 'package:ecommerc_figma_app/Views/MainScreen/MainScreen.dart';
import 'package:ecommerc_figma_app/Views/OnboardingScreens/OnboardingScreen.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/ProductDetailsScreen.dart';
import 'package:ecommerc_figma_app/Views/TestScreen/TestScreen.dart';
import 'package:ecommerc_figma_app/Views/WishList/wish_list_screen.dart';
import 'package:ecommerc_figma_app/Views/checkout/checkout_screen.dart';
import 'package:ecommerc_figma_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:screen_go/screen_go.dart';

import 'Auth/View/LoginScreen/LoginScreen.dart';
import 'Routes/Routes.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenGo(
      materialApp: true,
      builder: (context, deviceInfo) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: GetMaterialApp(
            getPages: routes,
            debugShowCheckedModeBanner: false,
            title: '',
            theme: ThemeData(
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                )
              ),
              scaffoldBackgroundColor: const Color(0xfff9f9f9),
              fontFamily: "Montserrat",
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // home: const MainScreen(),
            home: FirebaseAuth.instance.currentUser == null ? const OnboardingScreen() : const MainScreen(),
            // home: const ProductDetailsScreen(),
            // home: const CheckoutScreen(),
          ),
        );
      },
    );
  }
}

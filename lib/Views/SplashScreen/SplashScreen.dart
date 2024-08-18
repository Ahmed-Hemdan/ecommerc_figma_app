

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../MainScreen/MainScreen.dart';
import '../OnboardingScreens/OnboardingScreen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "assets/images/logo.png",
      nextScreen: FirebaseAuth.instance.currentUser == null ? const OnboardingScreen() : const MainScreen(),
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 50,
    );
  }
}

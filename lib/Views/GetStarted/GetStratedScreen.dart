
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

import '../Components/Mainbutton.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/GetStarted/getStarted.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment
                          .bottomCenter, // Starting point of the gradient
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.0)
                      ]),
                ),
              ),
            ),
            Positioned(
              top: 70.h - 50,
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "You want\n",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500),
                  children: const [
                    TextSpan(text: "Authentic, here\n"),
                    TextSpan(text: "you go!"),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 14.h,
              child: Text(
                textAlign: TextAlign.center,
                "Find it here, buy it now!",
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ),
            ),
            Positioned(
              bottom: 4.h,
              child: MainButton(
                text: "Get Started",
                width: 84.w,
                onPressed: () {
                  Get.offAllNamed("/MainScreen");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

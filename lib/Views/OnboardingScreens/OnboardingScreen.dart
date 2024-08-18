

import 'package:ecommerc_figma_app/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  List<String> imagelist = [
    "assets/images/Onboarding/onboarding_one.png",
    "assets/images/Onboarding/onboarding_two.png",
    "assets/images/Onboarding/onboarding_three.png",
  ];

  get get => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${index + 1}",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: "/3",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed("/LoginScreen");
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    imagelist[index],
                    width: 85.w,
                  ),
                  Text(
                    "Choose Products",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Amet minim mollit non deserunt ullamco est/n",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                        ),
                        TextSpan(
                          text:
                              "sit aliqua dolor do amet sint. Velit officia/n",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                        ),
                        TextSpan(
                          text: "consequat duis enim velit mollit.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          disabledBackgroundColor: Colors.transparent,
                          disabledForegroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          controller.animateToPage(
                            index - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linearToEaseOut,
                          );
                        },
                        child: Text(
                          "Prev",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: controller, // PageController
                        count: imagelist.length,
                        effect: const ExpandingDotsEffect(
                            activeDotColor: Color(0xff17223B),
                            dotWidth: 13,
                            dotHeight: 13), // your preferred effect
                        onDotClicked: (index) {},
                      ),
                      TextButton(
                        onPressed: () {
                          if (index == imagelist.length - 1) {
                            Get.offAllNamed("/LoginScreen");
                          } else {
                            controller.animateToPage(
                              index + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.linearToEaseOut,
                            );
                          }
                        },
                        child: Text(
                          index == imagelist.length - 1
                              ? "Get Started"
                              : "Next",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

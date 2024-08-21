import 'package:ecommerc_figma_app/Views/HomePage/Controller/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 35.w,
            height: 7.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 25.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xff14459d), Color(0xff3886f0)],
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Go to Cart", style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ),
                Positioned(
                  left: 1.2.w,
                  bottom: 0.5.h,
                  child: Container(
                    width: 6.h,
                    height: 6.h,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 87, 187),
                        borderRadius: BorderRadius.circular(100000000000)),
                    child: const Icon(Icons.shopping_cart_outlined , color: Colors.white,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

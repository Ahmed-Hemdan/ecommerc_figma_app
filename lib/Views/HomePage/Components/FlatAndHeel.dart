import 'package:ecommerc_figma_app/Colors/colors.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Controller/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class FlatAndHeels extends StatelessWidget {
  final String image;

  const FlatAndHeels({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: const Color(0xffFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetX<HomePageController>(
            builder: (controller) => controller.flatandheel.isNotEmpty
                ? Image.network(
                    image,
                    height: 20.h,
                  )
                : SizedBox(
                    height: 20.h,
                    width: 20.w,
                  ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Flat and Heels",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Stand a chance to get rewarded",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: mainColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Row(
                      children: [
                        Text(
                          "view all ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.east,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

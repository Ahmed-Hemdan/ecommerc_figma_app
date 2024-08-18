import 'package:ecommerc_figma_app/Views/HomePage/Controller/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class SpecialOffer extends StatelessWidget {
  final String image;
  const SpecialOffer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 12.h,
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GetX<HomePageController>(
            builder: (controller) => controller.specialOfferImage.isNotEmpty
                ? Image.network(
                    image,
                    height: 10.h,
                  )
                : SizedBox(
                    height: 10.h,
                    width: 20.w,
                  ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Special Offers 😱",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                "We make sure you get the \n offer you need at best prices",
                style: TextStyle(fontSize: 14.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}

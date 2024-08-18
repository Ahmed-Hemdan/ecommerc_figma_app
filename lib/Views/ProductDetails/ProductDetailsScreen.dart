import 'package:ecommerc_figma_app/Views/ProductDetails/Components/policy_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios, size: 22.sp),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 28.h,
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/e-commerce-figma-app.appspot.com/o/Images%2FAllproducts%2FFashion%2F1000026595.png?alt=media&token=81757a69-5658-4e1f-8dea-72f2e5a5e134"),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Nike Sneaker",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingStars(
                      value: 4,
                      starBuilder: (index, color) => Icon(
                        Icons.star,
                        color: color,
                      ),
                      starCount: 5,
                      starSize: 20,
                      valueLabelVisibility: false,
                      maxValue: 5,
                      starSpacing: 1,
                      animationDuration: const Duration(milliseconds: 1000),
                      starOffColor: const Color(0xffe7e8ea),
                      starColor: const Color(0xffedb310),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "56,890",
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "2,999",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "1500",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "50% OFF",
                    style: TextStyle(
                        color: const Color(0xffFA7189), fontSize: 15.sp),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: Text(
                  "Product Description",
                  style:
                      TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data demo data ",
                style: TextStyle(
                  fontSize: 15.sp,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 6,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  PolicyGroub(
                    text: 'Nearest Store',
                    icon: Icons.location_on_outlined,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PolicyGroub(
                    text: 'VIP',
                    icon: Icons.lock_outline,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PolicyGroub(
                    text: ' Return policy',
                    icon: Icons.currency_exchange,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

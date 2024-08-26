import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:ecommerc_figma_app/Views/Components/FilterButton.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/ProductCard.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/Components/go_to_cart.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/Components/policy_group.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/Components/view_similar.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/controller/product_details_controller.dart';
import 'package:ecommerc_figma_app/Views/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ProductDetailsScreen extends StatelessWidget {
 
const ProductDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
  final Product product = Get.arguments;
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      SizedBox(
                        height: 28.h,
                        child: Center(
                          child: Image.network(
                            fit: BoxFit.fitHeight,
                            product.image,),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        product.title,
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
                              value: product.rate,
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
                            product.oldPrice,
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
                            product.realTimePrice,
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${product.sale} OFF",
                            style: TextStyle(
                                color: const Color(0xffFA7189), fontSize: 15.sp),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Text(
                          "Product Description",
                          style: TextStyle(
                              fontSize: 16.5.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        product.description,
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
                      ),
                       Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const GoToCart(
                              gradientColor: [
                                Color(0xff14459d),
                                Color(0xff3886f0),
                              ],
                              iconColor: Color.fromARGB(255, 34, 87, 187),
                              icon: Icons.shopping_cart_outlined,
                              text: "Go To Cart",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const CheckoutScreen());
                            },
                            child: const GoToCart(
                              gradientColor: [
                                Color(0xff32b76a),
                                Color(0xff70f8a8),
                              ],
                              iconColor: Color(0xff36ac67),
                              icon: Icons.shopping_cart_outlined,
                              text: "Buy Now",
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffFFCCD5),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 9.0.w, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivered in",
                                style: TextStyle(
                                    fontSize: 15.sp, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Within 1 Hour",
                                style: TextStyle(
                                    fontSize: 16.sp, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ViewSimilar(
                              icon: Icons.visibility_outlined,
                              text: " View Similar",
                            ),
                            ViewSimilar(
                              icon: Icons.style,
                              text: " Add to Compare",
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Similar To",
                        style:
                            TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "282+ Iteams ",
                            style: TextStyle(
                                fontSize: 19.sp, fontWeight: FontWeight.w600),
                          ),
                          FilterRow(
                            onTap1: () {},
                            onTap2: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GetX<ProductDetailsCotroller>(
                              builder: (controller) =>
                                  controller.similarProducts.isNotEmpty
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          physics: const BouncingScrollPhysics(),
                                          itemCount: controller.similarProducts.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: GetX<ProductDetailsCotroller>(
                                                builder: (controller) =>
                                                    ProtraitProductCard(
                                                  value: controller.similarProducts[index]
                                                      ['rate'],
                                                  image: controller.similarProducts[index]
                                                      ['image'],
                                                  title: controller.similarProducts[index]
                                                      ['title'],
                                                  description:
                                                      controller.similarProducts[index]
                                                          ['description'],
                                                  price: controller.similarProducts[index]
                                                      ['realTimePrice'],
                                                  oldPrice: controller
                                                      .similarProducts[index]['oldPrice'],
                                                  sale: controller.similarProducts[index]
                                                      ['sale'],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : Container(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerc_figma_app/Views/CartScreen/controller/cartController.dart';
// import 'package:ecommerc_figma_app/Views/CartScreen/controller/controller.dart';
import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/Components/Mainbutton.dart';
import 'package:ecommerc_figma_app/Views/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Cartcontroller controller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const AppbarCom(),
            GetX<Cartcontroller>(
              builder: (controller) {
                if (controller.cartProducts.isEmpty &&
                    controller.isLoading.value == true) {
                  return Expanded(
                    child: Skeletonizer(
                      enabled: controller.isLoading.value,
                      child: Column(
                        // Added Column here
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return const CartItem(
                                    image:
                                        "https://media.istockphoto.com/id/1222357475/vector/image-preview-icon-picture-placeholder-for-website-or-ui-ux-design-vector-illustration.jpg?s=612x612&w=0&k=20&c=KuCo-dRBYV7nz2gbk4J9w1WtTAgpTdznHu55W9FjimE=",
                                    title: "fsdfsldfjsdlfsjdflsd",
                                    description:
                                        'dddddddddddddddddddddddddddddddddddddddddd',
                                    rate: 3.5,
                                    realTimePrice: 'dsf',
                                    sale: 'dfd',
                                    oldPrice: 'fdfd');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (controller.cartProducts.isEmpty &&
                    controller.isLoading.value == false) {
                  return const Center(
                    child: Column(
                      children: [
                        Text("There is no producs"),
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed("/ProductDetails",
                                arguments: controller.cartProducts[index]);
                          },
                          child: CartItem(
                            image: controller.cartProducts[index].image,
                            description:
                                controller.cartProducts[index].description,
                            rate: controller.cartProducts[index].rate,
                            realTimePrice:
                                controller.cartProducts[index].realTimePrice,
                            title: controller.cartProducts[index].title,
                            sale: controller.cartProducts[index].sale,
                            oldPrice: controller.cartProducts[index].oldPrice,
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MainButton(text: "PayNow", width: double.infinity, onPressed: (){
                Get.to(const CheckoutScreen());
              }),
            )
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double rate;
  final String realTimePrice;
  final String sale;
  final String oldPrice;
  const CartItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.rate,
    required this.realTimePrice,
    required this.sale,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 23.h,
        decoration: BoxDecoration(
          color: const Color(0xfff9f9f9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Image.network(
                        width: 37.w,
                        // height: 10.h,
                        image,
                        errorBuilder: (context, error, stackTrace) =>
                            const Image(
                          image: AssetImage("assets/Images/empty_image.jpj"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 49.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingStars(
                          value: rate,
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
                          starColor: Colors.yellow,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          realTimePrice,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        sale == " %"
                            ? const SizedBox()
                            : Text(
                                "upto ${sale} off",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                        oldPrice == "₹"
                            ? const SizedBox()
                            : Text(
                                oldPrice,
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Order (1) :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$ ${realTimePrice}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

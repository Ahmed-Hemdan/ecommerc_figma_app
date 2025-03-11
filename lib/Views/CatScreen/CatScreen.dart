import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:ecommerc_figma_app/Views/CatScreen/controller/cat_controller.dart';
import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/ProductCard.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/ProductDetailsScreen.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final CatController _controller = Get.put(CatController(Get.arguments));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 20.sp),
                  ),
                  Image.asset(
                    'assets/images/Profile/profile.png',
                    width: 11.w,
                  ),
                ],
              ),
            ),
            GetX<CatController>(
              builder: (controller) => controller.catProducts.isEmpty
                  ? const Center(
                      child: Text("There is no products"),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.75,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 330),
                          itemCount: controller.catProducts.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Get.to(const ProductDetailsScreen(),
                                arguments: Product(
                                  isFavorite:
                                      controller.catProducts[index].isFavorite,
                                  title: controller.catProducts[index].title,
                                  image: controller.catProducts[index].image,
                                  oldPrice:
                                      controller.catProducts[index].oldPrice,
                                  realTimePrice: controller
                                      .catProducts[index].realTimePrice,
                                  sale: controller.catProducts[index].sale,
                                  rate: controller.catProducts[index].rate,
                                  description:
                                      controller.catProducts[index].description,
                                  cat: controller.catProducts[index].cat,
                                )),
                            child: ProtraitProductCard(
                              value: controller.catProducts[index].rate,
                              image: controller.catProducts[index].image,
                              title: controller.catProducts[index].title,
                              description:
                                  controller.catProducts[index].description,
                              price:
                                  controller.catProducts[index].realTimePrice,
                              oldPrice: controller.catProducts[index].oldPrice,
                              sale: controller.catProducts[index].sale,
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/Components/Search.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/ProductCard.dart';
import 'package:ecommerc_figma_app/Views/WishList/Controller/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  WishListController controller = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const AppbarCom(),
              SearchField(
                controller: controller.searchContorller,
                onChanged: (value) {
                  controller.search();
                },
              ),
              GetX<WishListController>(builder: (controller) {
                if (controller.searchList.isEmpty &&
                    controller.searchContorller.text.isNotEmpty) {
                  return const Center(
                    child: Text("No Product Found"),
                  );
                } else if (controller.searchList.isEmpty &&
                    controller.searchContorller.text.isEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 330,
                      ),
                      itemCount: controller.wishListProducts.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Get.toNamed("/ProductDetails",
                              arguments: controller.wishListProducts[index]);
                        },
                        child: ProtraitProductCard(
                          value: controller.wishListProducts[index].rate,
                          image: controller.wishListProducts[index].image,
                          title: controller.wishListProducts[index].title,
                          description:
                              controller.wishListProducts[index].description,
                          price:
                              controller.wishListProducts[index].realTimePrice,
                          oldPrice: controller.wishListProducts[index].oldPrice,
                          sale: controller.wishListProducts[index].sale,
                        ),
                      ),
                    ),
                  );
                }else  {
                    return Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 330,
                            ),
                            itemCount: controller.searchList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Get.toNamed("/ProductDetails",
                                    arguments: controller.searchList[index]);
                              },
                              child: ProtraitProductCard(
                                value: controller.searchList[index].rate,
                                image: controller.searchList[index].image,
                                title: controller.searchList[index].title,
                                description:
                                    controller.searchList[index].description,
                                price: controller.searchList[index].realTimePrice,
                                oldPrice: controller.searchList[index].oldPrice,
                                sale: controller.searchList[index].sale,
                              ),
                            ),
                          ),
                        );
                  
                }
              }
                  //   if (controller.searchList.isEmpty && controller.searchContorller.text.isEmpty) {
                  //     if (controller.wishListProducts.isEmpty) {
                  //       return Container();
                  //     } else {
                  //       return Expanded(
                  //         child: GridView.builder(
                  //           shrinkWrap: true,
                  //           physics: const BouncingScrollPhysics(),
                  //           gridDelegate:
                  //               const SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 2,
                  //             childAspectRatio: 0.75,
                  //             mainAxisSpacing: 10,
                  //             crossAxisSpacing: 10,
                  //             mainAxisExtent: 330,
                  //           ),
                  //           itemCount: controller.wishListProducts.length,
                  //           itemBuilder: (context, index) => InkWell(
                  //             onTap: () {
                  //               Get.toNamed("/ProductDetails",
                  //                   arguments:
                  //                       controller.wishListProducts[index]);
                  //             },
                  //             child: ProtraitProductCard(
                  //               value: controller.wishListProducts[index].rate,
                  //               image: controller.wishListProducts[index].image,
                  //               title: controller.wishListProducts[index].title,
                  //               description: controller
                  //                   .wishListProducts[index].description,
                  //               price: controller
                  //                   .wishListProducts[index].realTimePrice,
                  //               oldPrice:
                  //                   controller.wishListProducts[index].oldPrice,
                  //               sale: controller.wishListProducts[index].sale,
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //   } else {
                  //     if (controller.searchList.isEmpty) {
                  //       return Container();
                  //     } else {
                  //       return Expanded(
                  //         child: GridView.builder(
                  //           shrinkWrap: true,
                  //           physics: const BouncingScrollPhysics(),
                  //           gridDelegate:
                  //               const SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 2,
                  //             childAspectRatio: 0.75,
                  //             mainAxisSpacing: 10,
                  //             crossAxisSpacing: 10,
                  //             mainAxisExtent: 330,
                  //           ),
                  //           itemCount: controller.searchList.length,
                  //           itemBuilder: (context, index) => InkWell(
                  //             onTap: () {
                  //               Get.toNamed("/ProductDetails",
                  //                   arguments: controller.searchList[index]);
                  //             },
                  //             child: ProtraitProductCard(
                  //               value: controller.searchList[index].rate,
                  //               image: controller.searchList[index].image,
                  //               title: controller.searchList[index].title,
                  //               description:
                  //                   controller.searchList[index].description,
                  //               price: controller.searchList[index].realTimePrice,
                  //               oldPrice: controller.searchList[index].oldPrice,
                  //               sale: controller.searchList[index].sale,
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //   }
                  // },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

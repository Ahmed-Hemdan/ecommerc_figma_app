import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/Components/Search.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/ProductCard.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Controller/HomePageController.dart';
import 'package:ecommerc_figma_app/Views/WishList/Controller/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final TextEditingController _searchContorller = TextEditingController();

  @override
  void dispose() {
    _searchContorller.dispose();
    super.dispose();
  }

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
                controller: _searchContorller,
              ),
              GetX<WishListController>(
                init: WishListController(),
                builder: (controller) => controller.wishListProducts.isEmpty
                    ? Container()
                    : Expanded(
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
                          itemCount: controller.wishListProducts.length,
                          itemBuilder: (context, index) => ProtraitProductCard(
                            value: controller.wishListProducts[index].rate,
                            image: controller.wishListProducts[index].image,
                            title: controller.wishListProducts[index].title,
                            description:
                                controller.wishListProducts[index].description,
                            price: controller
                                .wishListProducts[index].realTimePrice,
                            oldPrice:
                                controller.wishListProducts[index].oldPrice,
                            sale: controller.wishListProducts[index].sale,
                          ),
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

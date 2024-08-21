import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/Components/Search.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/ProductCard.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Controller/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

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
               GetX<HomePageController>(
                  init: HomePageController(),
                  builder: (controller) => controller.allProducts.isEmpty
                      ? Container()
                      : Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  0.75, // Adjust aspect ratio as needed
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 330
                            ),
                            itemCount: controller.allProducts.length,
                            itemBuilder: (context, index) => ProtraitProductCard(
                              value: controller.allProducts[index]['rate'],
                              image: controller.allProducts[index]['image'],
                              title: controller.allProducts[index]['title'],
                              description: controller.allProducts[index]
                                  ['description'],
                              price: controller.allProducts[index]
                                  ['realTimePrice'],
                              oldPrice: controller.allProducts[index ]
                                  ['oldPrice'],
                              sale: controller.allProducts[index]['sale'],
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

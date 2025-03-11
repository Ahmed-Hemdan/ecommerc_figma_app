import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/Components/Search.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/ProductCard.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/ProductDetailsScreen.dart';
import 'package:ecommerc_figma_app/Views/SearchScreen/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final SearchControllerr controller = Get.put(SearchControllerr());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
          child: Column(
        children: [
          const AppbarCom(),
          SearchField(
            controller: controller.searchController,
            onChanged: (value) {
              controller.getSearchProducts(value);
            },
          ),
          GetX<SearchControllerr>(builder: (controller) {
            if (controller.searchController.text.isEmpty && controller.isLoading.value == false) {
              return const Center(
                child: Text("Search about Something"),
              );
            }else if (controller.searchController.text.isNotEmpty && controller.isLoading.value ==  false && controller.searchProducts.isEmpty) {
              return const Center(
                child: Text("No Product Found"),
              );
            }else if (controller.searchController.text.isNotEmpty && controller.isLoading.value ==  true){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return Expanded(
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
                          itemCount: controller.searchProducts.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Get.to(const ProductDetailsScreen(),
                                arguments: Product(
                                  isFavorite:
                                      controller.searchProducts[index].isFavorite,
                                  title: controller.searchProducts[index].title,
                                  image: controller.searchProducts[index].image,
                                  oldPrice:
                                      controller.searchProducts[index].oldPrice,
                                  realTimePrice: controller
                                      .searchProducts[index].realTimePrice,
                                  sale: controller.searchProducts[index].sale,
                                  rate: controller.searchProducts[index].rate,
                                  description:
                                      controller.searchProducts[index].description,
                                  cat: controller.searchProducts[index].cat,
                                )),
                            child: ProtraitProductCard(
                              value: controller.searchProducts[index].rate,
                              image: controller.searchProducts[index].image,
                              title: controller.searchProducts[index].title,
                              description:
                                  controller.searchProducts[index].description,
                              price:
                                  controller.searchProducts[index].realTimePrice,
                              oldPrice: controller.searchProducts[index].oldPrice,
                              sale: controller.searchProducts[index].sale,
                            ),
                          ),
                        ),
                      ),
              );
            }
          }),
        ],
      )),
    ));
  }
}

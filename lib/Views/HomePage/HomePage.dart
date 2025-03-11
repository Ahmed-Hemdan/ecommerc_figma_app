import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/DealOfTheDay.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/SpecialOffer.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Controller/HomePageController.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/ProductCard.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Controller/category_item.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/ProductDetailsScreen.dart';
import 'package:ecommerc_figma_app/Views/ProductDetails/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Components/FlatAndHeel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _controller = Get.put(HomePageController());
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const AppbarCom(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GetX<HomePageController>(
                        builder: (controller) {
                          if (controller.bannersData.isEmpty &&
                              controller.isBannersLoading.value == true) {
                            return Skeletonizer(
                              child: carousel.CarouselSlider.builder(
                                itemCount: controller.bannersData.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Image.network(
                                        "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D"),
                                  );
                                },
                                options: carousel.CarouselOptions(
                                  height: 28.h,
                                  viewportFraction: 1,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    controller.changeIndex(index);
                                  },
                                ),
                              ),
                            );
                          } else if (controller.bannersData.isEmpty &&
                              controller.isBannersLoading.value == false) {
                            return Container();
                          } else {
                            return carousel.CarouselSlider.builder(
                              itemCount: controller.bannersData.length,
                              itemBuilder: (context, index, realIndex) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Image.network(
                                      "${controller.bannersData[index]["image"]}"),
                                );
                              },
                              options: carousel.CarouselOptions(
                                height: 28.h,
                                viewportFraction: 1,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  controller.changeIndex(index);
                                },
                              ),
                            );
                          }
                        },
                      ),
                      GetX<HomePageController>(
                        builder: (context) => AnimatedSmoothIndicator(
                          activeIndex: _controller.currentIndex.value,
                          count: _controller.bannersData.length,
                          effect: const SlideEffect(
                            activeDotColor: Color(0xffFFA3B3),
                            dotHeight: 9,
                            dotWidth: 9,
                          ),
                        ),
                      ),
                      const DealOfTheDay(
                        title: "Deal of the day",
                        time: " 22h 55m 20s remaining ",
                        icon: Icons.alarm,
                        color: Color(0xff4392F9),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "All Featured",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GetX<HomePageController>(builder: (controller) {
                        if (controller.categoriesData.isEmpty &&
                            controller.isCategoriesLoading.value == true) {
                          return Skeletonizer(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                height: 12.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 8),
                                            child: ClipOval(
                                              child: Image.network(
                                                "https://media.istockphoto.com/id/1222357475/vector/image-preview-icon-picture-placeholder-for-website-or-ui-ux-design-vector-illustration.jpg?s=612x612&w=0&k=20&c=KuCo-dRBYV7nz2gbk4J9w1WtTAgpTdznHu55W9FjimE=",
                                                height: 7.h,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    const Image(
                                                  image: AssetImage(
                                                      "assets/Images/empty_image.jpj"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "sdfds",
                                            style: TextStyle(fontSize: 15.sp),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (controller.categoriesData.isEmpty &&
                            controller.isCategoriesLoading.value == false) {
                          return Container();
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 12.h,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.categoriesData.length,
                                  itemBuilder: (context, index) {
                                    return CatigoeryItem(
                                      controller: _controller,
                                      index: index,
                                      onTap: () {
                                        Get.toNamed("/CatScreen",
                                            arguments:
                                                controller.categoriesData[index]
                                                    ["title"]);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                      }),
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
                            child: GetX<HomePageController>(
                              builder: (controller) => controller
                                      .allProducts.isNotEmpty
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GetX<HomePageController>(
                                            builder: (controller) => InkWell(
                                              onTap: () {
                                                Get.lazyPut(
                                                  () => ProductDetailsCotroller(
                                                    controller
                                                        .allProducts[index],
                                                  ),
                                                );
                                                Get.to(
                                                  const ProductDetailsScreen(),
                                                  arguments: Product(
                                                    isFavorite: controller
                                                        .allProducts[index]
                                                        .isFavorite,
                                                    title: controller
                                                        .allProducts[index]
                                                        .title,
                                                    image: controller
                                                        .allProducts[index]
                                                        .image,
                                                    oldPrice: controller
                                                        .allProducts[index]
                                                        .oldPrice,
                                                    realTimePrice: controller
                                                        .allProducts[index]
                                                        .realTimePrice,
                                                    sale: controller
                                                        .allProducts[index]
                                                        .sale,
                                                    rate: controller
                                                        .allProducts[index]
                                                        .rate,
                                                    description: controller
                                                        .allProducts[index]
                                                        .description,
                                                    cat: controller
                                                        .allProducts[index].cat,
                                                  ),
                                                );
                                              },
                                              child: ProtraitProductCard(
                                                value: controller
                                                    .allProducts[index].rate,
                                                image: controller
                                                    .allProducts[index].image,
                                                title: controller
                                                    .allProducts[index].title,
                                                description: controller
                                                    .allProducts[index]
                                                    .description,
                                                price: controller
                                                    .allProducts[index]
                                                    .realTimePrice,
                                                oldPrice: controller
                                                    .allProducts[index]
                                                    .oldPrice,
                                                sale: controller
                                                    .allProducts[index].sale,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                      ),
                      GetX<HomePageController>(
                        builder: (controller) => SpecialOffer(
                          image: controller.specialOfferImage.isNotEmpty
                              ? controller.specialOfferImage[0]["image"]
                              : '',
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      GetX<HomePageController>(
                        builder: (controller) => FlatAndHeels(
                          image: controller.flatandheel.isNotEmpty
                              ? controller.flatandheel[0]["image"]
                              : '',
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const DealOfTheDay(
                        title: "Trending Products ",
                        time: " Last Date 29/02/22",
                        icon: Icons.date_range,
                        color: Color(0xffFD6E87),
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
                            child: GetX<HomePageController>(
                              builder: (controller) => controller
                                      .allProducts.isNotEmpty
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GetX<HomePageController>(
                                            builder: (controller) => InkWell(
                                              onTap: () {
                                                Get.lazyPut(
                                                  () => ProductDetailsCotroller(
                                                    controller
                                                        .allProducts[index + 4],
                                                  ),
                                                );
                                                Get.to(
                                                  const ProductDetailsScreen(),
                                                  arguments: Product(
                                                    isFavorite: controller
                                                        .allProducts[index + 4]
                                                        .isFavorite,
                                                    title: controller
                                                        .allProducts[index + 4]
                                                        .title,
                                                    image: controller
                                                        .allProducts[index + 4]
                                                        .image,
                                                    oldPrice: controller
                                                        .allProducts[index + 4]
                                                        .oldPrice,
                                                    realTimePrice: controller
                                                        .allProducts[index + 4]
                                                        .realTimePrice,
                                                    sale: controller
                                                        .allProducts[index + 4]
                                                        .sale,
                                                    rate: controller
                                                        .allProducts[index + 4]
                                                        .rate,
                                                    description: controller
                                                        .allProducts[index + 4]
                                                        .description,
                                                    cat: controller
                                                        .allProducts[index + 4]
                                                        .cat,
                                                  ),
                                                );
                                              },
                                              child: ProtraitProductCard(
                                                value: controller
                                                    .allProducts[index + 4]
                                                    .rate,
                                                image: controller
                                                    .allProducts[index + 4]
                                                    .image,
                                                title: controller
                                                    .allProducts[index + 4]
                                                    .title,
                                                description: controller
                                                    .allProducts[index + 4]
                                                    .description,
                                                price: controller
                                                    .allProducts[index + 4]
                                                    .realTimePrice,
                                                oldPrice: controller
                                                    .allProducts[index + 4]
                                                    .oldPrice,
                                                sale: controller
                                                    .allProducts[index + 4]
                                                    .sale,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                      ),
                      GetX<HomePageController>(
                        builder: (controller) => controller.allProducts.isEmpty
                            ? Container()
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.75, // Adjust aspect ratio as needed
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 330,
                                ),
                                itemCount: controller.allProducts.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Get.lazyPut(
                                      () => ProductDetailsCotroller(
                                        controller.allProducts[index],
                                      ),
                                    );
                                    Get.to(
                                      const ProductDetailsScreen(),
                                      arguments: Product(
                                        isFavorite: controller
                                            .allProducts[index].isFavorite,
                                        title:
                                            controller.allProducts[index].title,
                                        image:
                                            controller.allProducts[index].image,
                                        oldPrice: controller
                                            .allProducts[index].oldPrice,
                                        realTimePrice: controller
                                            .allProducts[index].realTimePrice,
                                        sale:
                                            controller.allProducts[index].sale,
                                        rate:
                                            controller.allProducts[index].rate,
                                        description: controller
                                            .allProducts[index].description,
                                        cat: controller.allProducts[index].cat,
                                      ),
                                    );
                                  },
                                  child: ProtraitProductCard(
                                    value: controller.allProducts[index].rate,
                                    image: controller.allProducts[index].image,
                                    title: controller.allProducts[index].title,
                                    description: controller
                                        .allProducts[index].description,
                                    price: controller
                                        .allProducts[index].realTimePrice,
                                    oldPrice:
                                        controller.allProducts[index].oldPrice,
                                    sale: controller.allProducts[index].sale,
                                  ),
                                ),
                              ),
                      ),
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



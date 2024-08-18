import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/Components/Search.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/DealOfTheDay.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/SpecialOffer.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Controller/HomePageController.dart';
import 'package:ecommerc_figma_app/Views/HomePage/Components/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Components/FilterButton.dart';
import 'Components/FlatAndHeel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _controller = Get.put(HomePageController());
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const AppbarCom(),
                SearchField(controller: _searchContorller,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Featured",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
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
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GetX<HomePageController>(
                        builder: (controller) => _controller
                                .categoriesData.isEmpty
                            ? Container()
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: _controller.categoriesData.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 8),
                                        child: ClipOval(
                                          child: Image.network(
                                            _controller.categoriesData[index]
                                                ["image"],
                                            height: 7.h,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        _controller.categoriesData[index]
                                            ["title"],
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                    ],
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ),
                GetX<HomePageController>(
                  builder: (controller) => controller.bannersData.isEmpty
                      ? Container()
                      : CarouselSlider.builder(
                          itemCount: controller.bannersData.length,
                          itemBuilder: (context, index, realIndex) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Image.network(
                                  "${controller.bannersData[index]["image"]}"),
                            );
                          },
                          options: CarouselOptions(
                            height: 28.h,
                            viewportFraction: 1,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              controller.changeIndex(index);
                            },
                          ),
                        ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: _controller.currentIndex.value,
                  count: _controller.bannersData.length,
                  effect: const SlideEffect(
                    activeDotColor: Color(0xffFFA3B3),
                    dotHeight: 9,
                    dotWidth: 9,
                  ),
                ),
                const DealOfTheDay(
                  title: "Deal of the day",
                  time: " 22h 55m 20s remaining ",
                  icon: Icons.alarm,
                  color: Color(0xff4392F9),
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
                        builder: (controller) =>
                            controller.allProducts.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GetX<HomePageController>(
                                          builder: (controller) =>
                                              ProtraitProductCard(
                                            value: controller.allProducts[index]
                                                ['rate'],
                                            image: controller.allProducts[index]
                                                ['image'],
                                            title: controller.allProducts[index]
                                                ['title'],
                                            description:
                                                controller.allProducts[index]
                                                    ['description'],
                                            price: controller.allProducts[index]
                                                ['realTimePrice'],
                                            oldPrice: controller
                                                .allProducts[index]['oldPrice'],
                                            sale: controller.allProducts[index]
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
                                      builder: (controller) =>
                                          ProtraitProductCard(
                                        value: controller.allProducts[index + 4]
                                            ['rate'],
                                        image: controller.allProducts[index + 4]
                                            ['image'],
                                        title: controller.allProducts[index + 4]
                                            ['title'],
                                        description:
                                            controller.allProducts[index + 4]
                                                ['description'],
                                        price: controller.allProducts[index + 4]
                                            ['realTimePrice'],
                                        oldPrice: controller
                                            .allProducts[index + 4]['oldPrice'],
                                        sale: controller.allProducts[index + 4]
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
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}



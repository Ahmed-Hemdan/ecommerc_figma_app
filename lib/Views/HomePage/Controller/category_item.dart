import 'package:ecommerc_figma_app/Views/HomePage/Controller/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class CatigoeryItem extends StatelessWidget {
  const CatigoeryItem({
    super.key,
    required HomePageController controller,
    this.onTap,
    required this.index,
  }) : _controller = controller;

  final HomePageController _controller;
  final void Function()? onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 19.w,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: ClipOval(
                child: Image.network(
                  _controller.categoriesData[index]["image"],
                  height: 7.h,
                ),
              ),
            ),
            Text(
              _controller.categoriesData[index]["title"],
              style: TextStyle(fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class GoToCart extends StatelessWidget {
  final List<Color> gradientColor;
  final Color iconColor;
  final IconData icon;
  final String text;
  const GoToCart({
    super.key,
    required this.gradientColor,
    required this.iconColor,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35.w,
      height: 7.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 25.w,
              height: 5.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: gradientColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1.2.w,
            bottom: 0.5.h,
            child: Container(
              width: 6.h,
              height: 6.h,
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(100000000000),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Color(0xff14459d)
//  Color(0xff3886f0)
  // Icons.shopping_cart_outlined
  // Color.fromARGB(255, 34, 87, 187)
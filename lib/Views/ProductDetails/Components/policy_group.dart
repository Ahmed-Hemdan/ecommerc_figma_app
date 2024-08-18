import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class PolicyGroub extends StatelessWidget {
  final String text;
  final IconData icon;
  const PolicyGroub({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff828282), width: 1.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 15.sp,
              color: const Color(0xff828282),
            ),
            Text(
              text,
              style: TextStyle(
                color: const Color(0xff828282),
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

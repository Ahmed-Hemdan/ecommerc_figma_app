import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ViewSimilar extends StatelessWidget {
  final IconData icon;
  final String text;

  const ViewSimilar({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffd9d9d9) , width: 1),
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 6.4.w,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerc_figma_app/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class MediaLogin extends StatelessWidget {
  final String mediaImagePath;
  const MediaLogin({super.key, required this.mediaImagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          decoration: BoxDecoration(
            color: const Color(0xffFCF3F4),
            shape: BoxShape.circle,
            border: Border.all(
              color: mainColor,
            ),
          ),
        ),
        Positioned(
          top: 4.5.w,
          left: 4.5.w,
          child: Image.asset(
            mediaImagePath,
            width: 7.w,
          ),
        ),
      ],
    );
  }
}

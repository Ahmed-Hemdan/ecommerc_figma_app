import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AppbarCom extends StatelessWidget {
  const AppbarCom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 50.w,
        ),
        Image.asset(
          'assets/images/Profile/profile.png',
          width: 11.w,
        ),
      ],
    );
  }
}

import 'package:ecommerc_figma_app/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class MainButton extends StatelessWidget {
  final String text ;
  final double width;
  final void Function() onPressed ;
  const MainButton({super.key, required this.text, required this.width, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  width: width,
                  height: 7.8.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ),
                );
              
  }
}
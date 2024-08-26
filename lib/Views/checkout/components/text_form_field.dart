import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class CheckoutFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const CheckoutFormField({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffc8c8c8), width: 2.5),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffc8c8c8), width: 2.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

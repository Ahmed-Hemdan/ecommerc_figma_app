import 'package:ecommerc_figma_app/Colors/colors.dart';
import 'package:flutter/material.dart';


class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final Icon prefixIcon;
  final Icon? sufixIcon;
  final bool isSecure;
  const AuthTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator,
      required this.prefixIcon,
      this.sufixIcon,
      required this.isSecure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isSecure,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:  BorderSide(
            color: mainColor,
          ), // Set focused border color
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}

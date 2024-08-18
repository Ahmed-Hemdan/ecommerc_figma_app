

import 'package:ecommerc_figma_app/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

import '../../../Views/Components/Mainbutton.dart';
import '../../Controller/AuthController.dart';
import '../Components/LoginWithMedia.dart';
import '../Components/TextFormField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an ",
                    style: TextStyle(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "account",
                    style: TextStyle(
                      height: 1,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0.h),
                    child: AuthTextFormField(
                      validator: (value) {
                        if (value!.isNotEmpty && emailReg.hasMatch(value)) {
                          return null;
                        } else {
                          return "Please enter a valid email";
                        }
                      },
                      isSecure: false,
                      hintText: "Email",
                      controller: _emailController,
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                  AuthTextFormField(
                    validator: (value) {
                      if (value!.isNotEmpty) {
                       return null;
                      } else {
                        return "password can't be empty";
                      }
                    },
                    isSecure: true,
                    sufixIcon: const Icon(Icons.visibility),
                    hintText: "Password",
                    controller: _passwordController,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0.h, bottom: 1.5.h),
                    child: AuthTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password can't be empty";
                        } else if (value != _passwordController.text) {
                          return "Password doesn't match";
                        } else {
                          return null;
                        }
                      },
                      isSecure: true,
                      hintText: "confirm Password",
                      controller: _confirmPasswordController,
                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ),
                  const Text.rich(
                    TextSpan(
                      text: "By clicking the ",
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            color: Color(0xffFF4B26),
                          ),
                        ),
                        TextSpan(text: " button, you agree to the public offer")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (controller) {
                     return Center(
                          child: MainButton(
                            text: 'Create account',
                            width: double.infinity,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.registerWithEmail(
                                    _emailController.text,
                                    _passwordController.text);
                              }
                            },
                          ),
                        );
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Center(
                    child: Text(
                      "- OR Continue with -",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MediaLogin(
                          mediaImagePath:
                              'assets/images/AuthLogos/google_logo.png',
                        ),
                        SizedBox(width: 15),
                        MediaLogin(
                          mediaImagePath:
                              'assets/images/AuthLogos/facebook_logo.png',
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I Already Have an Account",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: mainColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

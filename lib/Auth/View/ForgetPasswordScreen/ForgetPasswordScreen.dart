import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

import '../../../Views/Components/Mainbutton.dart';
import '../../Controller/AuthController.dart';
import '../Components/TextFormField.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Forgot",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "password?",
                style: TextStyle(
                  height: 1,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0.h),
                child: Form(
                  key: _formKey,
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
                    prefixIcon: const Icon(Icons.mail),
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "*",
                  style: TextStyle(
                      color: const Color(0xffFF4B26), fontSize: 16.sp),
                  children: const [
                    TextSpan(
                      text:
                          " We will send you a message to set or reset \n   your new password",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              GetBuilder<AuthController>(
                init: AuthController(),
                builder: (controller) => MainButton(
                    text: "Submit",
                    width: double.infinity,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.resetPassowrd(_emailController.text);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

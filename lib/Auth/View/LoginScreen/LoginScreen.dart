import 'package:ecommerc_figma_app/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

import '../../../UploadScreen.dart';
import '../../../Views/Components/Mainbutton.dart';
import '../../Controller/AuthController.dart';
import '../Components/LoginWithMedia.dart';
import '../Components/TextFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    authController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Back!",
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
                    if (value!.isEmpty) {
                      return "password can't be empty";
                    } else {
                      return null;
                    }
                  },
                  isSecure: true,
                  hintText: "Password",
                  controller: _passwordController,
                  prefixIcon: const Icon(Icons.lock),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/ForgetPasswordScreen');
                    },
                    child:  Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: const Color(0xffFF4B26),
                        decoration: TextDecoration.underline,
                        decorationColor: mainColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                GetBuilder<AuthController>(
                  
                  builder: (controller) {
                    if (controller.isLoading == false) {
                      return Center(
                        child: MainButton(
                          text: "Login",
                          width: double.infinity,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.loginWithEmail(_emailController.text,
                                  _passwordController.text);
                                  // Get.offAll(()=> const UploadScreen());
                            }
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Center(
                  child: Text(
                    "- OR Continue with -",
                  ),
                ),
                 Padding(
                  padding:const  EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          authController.signInWithGoogle();
                        },
                        child: const MediaLogin(
                          mediaImagePath:
                              'assets/images/AuthLogos/google_logo.png',
                        ),
                      ),
                      const SizedBox(width: 15),
                      const MediaLogin(
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
                      "Create An Account",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed("/RegisterScreen");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 15.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: mainColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

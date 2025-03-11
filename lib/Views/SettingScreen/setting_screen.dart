import 'package:ecommerc_figma_app/Auth/Controller/AuthController.dart';
import 'package:ecommerc_figma_app/Views/Components/Appbar.dart';
import 'package:ecommerc_figma_app/Views/Components/Mainbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final authController = Get.put(AuthController());

  @override
  void dispose() {
    authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const AppbarCom(),
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            "assets/images/Profile/profile.png",
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 225, 222, 222),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          IconsaxPlusBold.user_minus,
                          size: 22.sp,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          authController.auth.currentUser!.displayName!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          IconsaxPlusLinear.import_1,
                          size: 22.sp,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          authController.auth.currentUser!.email!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: MainButton(
                text: "Logout",
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  authController.logout();
                }),
          )
        ],
      ),
    ));
  }
}


// Center(
//         child: TextButton(
//           onPressed: () => authController.logout(),
//           child: const Text("Logout"),
//         ),
//       ),
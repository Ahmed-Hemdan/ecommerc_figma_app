import 'package:ecommerc_figma_app/Auth/Controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final authController = Get.put(AuthController());
  
  @override
  void dispose() {
    authController.dispose()  ;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: Center(child: TextButton(onPressed: () =>authController.logout() ,  child: const Text("Logout"),),),
    );
  }
}
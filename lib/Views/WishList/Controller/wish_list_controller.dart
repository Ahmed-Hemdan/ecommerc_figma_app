import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  RxList<Product> wishListProducts = <Product>[].obs;
  RxBool isLoading = true.obs;
  final TextEditingController searchContorller = TextEditingController();
  @override
  void dispose() {
    searchContorller.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    getWishList();
    super.onInit();
  }

  var fireIns = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  RxList<Product> searchList = <Product>[].obs;
  Future<void> search() async {
    searchList.clear();
    if (searchContorller.text.isNotEmpty) {
      searchList.addAll(wishListProducts.where((e) =>
          e.title.toLowerCase().contains(searchContorller.text.toLowerCase())));
    }
  }

  Future<void> getWishList() async {
    try {
      wishListProducts.clear();
      await fireIns
          .collection("Users")
          .doc(_auth.currentUser!.email)
          .collection("WhishList")
          .get()
          .then((value) => wishListProducts
              .addAll(value.docs.map((e) => Product.fromJson(e.data()))));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}

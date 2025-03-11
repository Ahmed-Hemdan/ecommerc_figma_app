import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController {
  @override
  void onInit() {
    getCartList();
    super.onInit();
  }

  var fireIns = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  RxList<Product> cartProducts = <Product>[].obs;

  RxBool isLoading = true.obs;

  Future<void> getCartList() async {
    Future.delayed(const Duration(seconds: 5));
    try {
      var res = await fireIns
          .collection("Users")
          .doc(_auth.currentUser!.email)
          .collection("Cart")
          .get();
      cartProducts.addAll(res.docs.map((e) => Product.fromJson(e.data())));
   
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      update();
    }
  }
}

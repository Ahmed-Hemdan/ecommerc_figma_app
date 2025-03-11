import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchControllerr extends GetxController {
  RxList<Product> searchProducts = <Product>[].obs;

  var fireIns = FirebaseFirestore.instance;

  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  // var _auth = FirebaseAuth.instance;

  List<Product> allProducts = [];

  Future<void> getAllProducts() async {
    try {
      
      allProducts.clear();
      var res = await fireIns.collection("AllProducts").get();
      allProducts.addAll(res.docs.map((e) => Product.fromJson(e.data())));
    } catch (e) {
      null;
    }
  }

  Future<void> getSearchProducts(String title) async {
    try {
      isLoading.value = true;
      searchProducts.clear();
      if (allProducts.isNotEmpty) {
        searchProducts.addAll(allProducts.where((element) =>
            element.title.toLowerCase().contains(title.toLowerCase())));
        isLoading.value = false;
      }
    } catch (e) {
      null;

    }
  }

//   void searchProductByPartialTitle(String partialTitle) async {
//   final collection = FirebaseFirestore.instance.collection('AllProducts');

//   // Fetch all documents from the collection (you may filter based on other conditions if needed)
//   final querySnapshot = await collection.get();

//   // Convert the search term to lowercase
//   String searchTerm = partialTitle.toLowerCase();

//   for (var doc in querySnapshot.docs) {
//     // Extract the title and convert it to lowercase
//     String title = (doc.data() as Map<String, dynamic>)['title'].toString().toLowerCase();

//     // Check if the title contains the search term
//     if (title.contains(searchTerm)) {
//       searchProducts
//               .addAll(querySnapshot.docs.map((e) => Product.fromJson(e.data())));
//       // print('Matching Product ID: ${doc.id}');
//       // print('Matching Product Data: ${doc.data()}');
//     }
//   }
// }
}

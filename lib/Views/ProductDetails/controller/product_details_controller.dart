import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductDetailsCotroller extends GetxController{
  final String cat;
  ProductDetailsCotroller(this.cat);

  @override
  void onInit() {
    getSimilarProducts(cat);
    super.onInit();
  }
   
    var fireIns = FirebaseFirestore.instance;
   RxList similarProducts = [].obs;

  void getSimilarProducts( String cat)async{
      final data = await fireIns.collection("AllProducts").where("cat" , isEqualTo: cat).get();
      similarProducts.addAll(data.docs.map((e) => e.data()));
  }

}
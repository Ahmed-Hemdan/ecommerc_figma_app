import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:get/get.dart';

class CatController extends GetxController {
  late String cat = Get.arguments;
  CatController(this.cat);
  @override
  void onInit() {
    getCatProducts(cat);
    super.onInit();
  }

  var fireIns = FirebaseFirestore.instance;
  RxList<Product> catProducts = <Product>[].obs;

  Future<void> getCatProducts(String catName) async {
    try {
      catProducts.clear();
      var res = await fireIns.collection("AllProducts").where("cat" , isEqualTo: catName).get();
      catProducts.addAll(res.docs.map((e) => Product.fromJson(e.data())));
      print("==================");
      print(catProducts[0]);
      print("==================");
    } catch (e) {
      print("??????????????????????????");
      print(e);
      print("??????????????????????????");
    }
  }
}

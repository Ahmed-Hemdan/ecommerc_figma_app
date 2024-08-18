
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    getCategories();
    getBanners();
    gatAllProducts();
    getSpecialOffer();
    getFlatAndHeel();
    super.onInit();
  }


  var fireIns = FirebaseFirestore.instance;
// fetch categories
  RxList categoriesData = [].obs;
  Future<void> getCategories() async {
    try {
      categoriesData.clear();
      var data =
          await fireIns.collection("Categories").get();
      categoriesData.addAll(data.docs.map((doc) => doc.data()));
    } catch (e) {
      print("======================================");
      print("eror with get categories $e =====================");
      print("====================================");
    }
  }

  //fetch Banners
  RxList bannersData = [].obs;
  Future<void> getBanners() async {
    try {
      bannersData.clear();
      final data = await fireIns.collection("Banners").get();
      bannersData.addAll(data.docs.map((e) => e.data()));
    } catch (e) {
      print("======================================");
      print("eror with get Banners $e =====================");
      print("====================================");
    }
  }

  RxInt currentIndex = 0.obs;
  void changeIndex(int index) {
    currentIndex.value = index ;
  }

  //fetch all products

  RxList allProducts = [].obs;
  Future<void> gatAllProducts() async {
    try {
      allProducts.clear();
      var res = await fireIns
          .collection("AllProducts").get();
      allProducts.addAll(res.docs.map((e) => e.data()));
      print('=====================================');
      print(allProducts.length);
      print(allProducts[5]["description"]);
      print("=========================================");
    } catch (e) {}
  }

  RxList womenProducts = [].obs;

  Future<void> getWomenProducts() async {
    try {
      womenProducts.clear();
      var data = await fireIns
          .collection("AllProducts")
          .doc("Wonmen's")
          .collection("Women'sProducts")
          .get();

      womenProducts.addAll(data.docs.map((e) => e.data()));
      womenProducts.shuffle();
      // print("+++++++++++++++++++++++++++++++++++++++++++");
      print(womenProducts[0]);
      // print("+++++++++++++++++++++++++++++++++++");
    } catch (e) {
      print("======================================");
      print("eror while get All Products $e =====================");
      print("====================================");
    }
  }

  // get Special offer 
  RxList specialOfferImage = [].obs;
  Future<void> getSpecialOffer()async{
    specialOfferImage.clear() ;
    var data = await fireIns.collection("SpecialOffer").get();
      specialOfferImage.addAll(data.docs.map((e)=> e.data()));
  }


  // get flat and heel image 
  RxList flatandheel =  [].obs  ;
  Future<void>  getFlatAndHeel()async{
  var data = await fireIns.collection("Heels").get() ;
  flatandheel.addAll(data.docs.map((e)=> e.data()));
  }
}

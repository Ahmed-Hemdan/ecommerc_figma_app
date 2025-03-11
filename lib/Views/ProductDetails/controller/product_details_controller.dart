import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerc_figma_app/Models/product_model.dart';
import 'package:ecommerc_figma_app/Views/CartScreen/controller/cartController.dart';
import 'package:ecommerc_figma_app/Views/WishList/Controller/wish_list_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProductDetailsCotroller extends GetxController {
  late Product product = Get.arguments;
  ProductDetailsCotroller(this.product);

  @override
  void onInit() {
    getSimilarProducts(product.cat);
    super.onInit();
  }

  var fireIns = FirebaseFirestore.instance;

  RxList similarProducts = [].obs;

  void getSimilarProducts(String cat) async {
    final data = await fireIns
        .collection("AllProducts")
        .where("cat", isEqualTo: product.cat)
        .get();
    similarProducts.addAll(data.docs.map((e) => e.data()));
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // RxBool isFavorite = false.obs;

  Cartcontroller cartController = Get.put(Cartcontroller());

  RxList<Product> cartList = <Product>[].obs;

  void addToCart(Product product) {
    try {
      titleExistsInObjectList() {
        for (var obj in cartController.cartProducts) {
          if (obj.title == product.title) {
            return true;
          }
        }
        return false;
      }

      if (titleExistsInObjectList() == false) {
        fireIns
            .collection("Users")
            .doc(_auth.currentUser!.email)
            .collection("Cart")
            .doc()
            .set(product.toJson());
        cartController.cartProducts.add(product);
      }
    } catch (e) {
      null;
    }
  }

  WishListController wishListController = Get.put(WishListController());

  void addAndRemveFavorite(Product product) {
    try {
      titleExistsInObjectList() {
        for (var obj in wishListController.wishListProducts) {
          if (obj.title == product.title) {
            return true;
          }
        }
        return false;
      }

      if (titleExistsInObjectList() == false) {
        fireIns
            .collection("Users")
            .doc(_auth.currentUser!.email)
            .collection("WhishList")
            .doc(product.title)
            .set(product.toJson());
        product.isFavorite = true;

        wishListController.wishListProducts.add(product);
      } else {
        fireIns
            .collection("Users")
            .doc(_auth.currentUser!.email)
            .collection("WhishList")
            .doc(product.title)
            .delete();

        product.isFavorite = false;

        wishListController.wishListProducts.remove(product);
      }
    } catch (e) {
      null;
    }
    update();
  }
}

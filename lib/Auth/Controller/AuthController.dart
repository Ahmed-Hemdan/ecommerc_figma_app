import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerc_figma_app/Auth/models/user_model.dart';
import 'package:ecommerc_figma_app/Views/GetStarted/GetStratedScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var auth = FirebaseAuth.instance;
  bool isLoading = false;
  Future<void> loginWithEmail(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isLoading = !isLoading;
      update();
      if (auth.currentUser!.emailVerified) {
        Get.offAllNamed("/GetStartedScreen");
      } else {
        await auth.currentUser!.sendEmailVerification();
        Fluttertoast.showToast(
            msg: "Check your email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.yellow,
            textColor: Colors.white,
            fontSize: 16.0);
        isLoading = !isLoading;
        update();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        isLoading = !isLoading;
        Fluttertoast.showToast(
            msg: "Invalid credential",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == "invalid-email") {
        isLoading = !isLoading;
        Fluttertoast.showToast(
            msg: "Invalid email",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        isLoading = !isLoading;
        Fluttertoast.showToast(
            msg: "Somting went wronge",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Future<void> registerWithEmail(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.currentUser!.sendEmailVerification();
      Fluttertoast.showToast(
          msg: "Check your email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.yellow,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.toNamed("/LoginScreen");
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        Fluttertoast.showToast(
            msg: "Your password is too weak",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.yellow,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "Email already in use",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Something went wronge",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Future<void> resetPassowrd(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
          msg: "Check your email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wronge",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    try {
          var value = await FirebaseAuth.instance
          .signInWithCredential(credential);
          if (value.additionalUserInfo!.isNewUser ) {
             await FirebaseFirestore.instance
              .collection('Users')
              .doc(value.user!.email)
              .set({
            "email": value.user!.email,
            "name": value.user!.displayName,
            "photoUrl": value.user!.photoURL,
            "id": value.user!.uid,
          });
          Get.toNamed("/GetStartedScreen");
          }
      //     .then((value) async {
      //   if (value.additionalUserInfo!.isNewUser) {
      //     // UserModel user = UserModel(
      //     //   email: value.user!.email,
      //     //   name: value.user!.displayName,
      //     //   photoUrl: value.user!.photoURL,
      //     //   id: value.user!.uid,
      //     // );
         
      //   }
      // });
    } catch (e) {
      print("================================================");
      print("Error in google sign in $e");
      print("================================================");
    }
  }

  void logout() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    if (await googleSignIn.isSignedIn()) {
      try {
        await googleSignIn.disconnect();
        Get.offAllNamed("/LoginScreen");
      } catch (e) {
        throw ('Error while logout from google !!!!!');
      }
    } else {
      try {
        await FirebaseAuth.instance.signOut();
        Get.offAllNamed("/LoginScreen");
      } catch (e) {
        throw ('Error while logout');
      }
    }
  }
}

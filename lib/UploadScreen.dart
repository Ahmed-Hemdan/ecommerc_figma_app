

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool isUploaded = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _describtionController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _saleController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  var storge = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  File? file;
  String? url;

   getImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        file = File(image.path);
        String imageName = basename(image.path);
        // var storageRef = FirebaseStorage.instance
        //     .ref("Images")
        //     .child("Allproducts")
        //     .child("Fashion").child(imageName);
        // var storageRef = FirebaseStorage.instance.ref("Images").child("FlatAndHeels").child("heel");
        var storageRef = FirebaseStorage.instance.ref("Images").child("Heels").child(imageName);
        await storageRef.putFile(file!);
        url = await storageRef.getDownloadURL();
        isUploaded = !isUploaded;
        setState((){});
        
      }
    } catch (e) {
      print("====================================");
      print(e);
      print("===================================");
      return null;
    }
  }
  Future<void> uploadProduct() async {
    await storge
        .collection("Heels")
        // .doc("Fashion")
        // .collection("FashionProducts")
        .add({
      // "title": _titleController.text,
      // "describtion": _describtionController.text,
      // "oldPrice": "₹${_oldPriceController.text}",
      // "realTimePrice": "₹${_priceController.text}",
      // "sale": "${_saleController.text} %",
      // 'rate' : _rateController.text,
      "image": url,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          getImage();
                        });
                      },
                      child: const Icon(Icons.add_photo_alternate_rounded)),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: isUploaded == false ? Colors.grey : Colors.green,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ],
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: "title"),
              ),
              TextFormField(
                controller: _describtionController,
                decoration: const InputDecoration(hintText: "describtion"),
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(hintText: "price"),
              ),
              TextFormField(
                controller: _oldPriceController,
                decoration: const InputDecoration(hintText: "old price"),
              ),
              TextFormField(
                controller: _saleController,
                decoration: const InputDecoration(hintText: "sale %"),
              ),
              TextFormField(
                controller: _rateController,
                decoration: const InputDecoration(hintText: "rete"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await uploadProduct();
                  },
                  child: const Text("Upload"))
            ],
          ),
        ),
      ),
    );
  }
}

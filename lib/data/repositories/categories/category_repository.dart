import 'package:alif_e_commerce/features/shop/models/category_model.dart';
import 'package:alif_e_commerce/utils/firebase/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///variable
  final _db = FirebaseFirestore.instance;

  ///get all category
  Future<List<CategoryModel>> getAllCategoryModel() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw ("Something went wrong, please try again");
    }
  }

  ///get sub category

  ///upload category to the cloude firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(BFirebaseStorageService());
      //loop category
      for (var category in categories) {
        //get image links from local assets
        final file = await storage.getImageDataFromAssets(category.image);

        //upload image and get url
        final url = await storage.uploadImageData('Categories', file, category.name);

        //assign url to category image attribut
        category.image = url;

        //store category to firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw ("Something went wrong, please try again");
    }
  }
}

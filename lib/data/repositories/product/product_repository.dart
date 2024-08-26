import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //forestore instance for database interaction
  final _db = FirebaseFirestore.instance;

  //get limited featured
  Future<List<ProductModel>> getFeaturedProduct() async {
    try {
      final snapshot = await _db.collection("Products").where("IsFeatured", isEqualTo: true).limit(5).get();
      print("Snapshot retrieved: ${snapshot.docs.length} documents found");
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code} - ${e.message}");
      throw BFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      print("PlatformException: ${e.code} - ${e.message}");
      throw BPlatformException(e.code).message;
    } catch (e) {
      print("General error: $e");
      throw ("Something went wrong, please try again");
    }
  }

  //upload dummy
}

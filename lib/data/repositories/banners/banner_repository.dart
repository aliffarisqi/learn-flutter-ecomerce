import 'package:alif_e_commerce/features/shop/models/banner_model.dart';
import 'package:alif_e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //get all orders related to current user
  Future<List<BannerModel>> fetchBanner() async {
    try {
      final result = await _db.collection("Banners").where('Active', isEqualTo: true).get();
      return result.docs.map((documenSnapshot) => BannerModel.fromSnapshot(documenSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw BFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const BFormatException();
    } on PlatformException catch (e) {
      throw BPlatformException(e.code).message;
    } catch (e) {
      throw ("Something went wrong, please try again");
    }
  }

  //pload banner to the cloud firestore
}

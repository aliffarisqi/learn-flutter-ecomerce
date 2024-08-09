import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../screens/profile/profile.dart';
import 'user_controller.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when homescreen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  //update name
  Future<void> updateUserName() async {
    try {
      //Start loading
      BFullScreenLoader.openLoadingDialog(
          "we are processiing your information ...", BImages.loaderAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        BFullScreenLoader.stopLoading();
        BLoaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      //input validate
      if (!updateUserNameFormKey.currentState!.validate()) {
        //remove loader
        BFullScreenLoader.stopLoading();
        return;
      }

      //update user first and last name on firebase firestore
      Map<String, dynamic> name = {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update the rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      BFullScreenLoader.stopLoading();

      //move to previous screen
      Navigator.of(Get.overlayContext!).pop();
      Get.off(const ProfileScreen());
      //Refresh user data
      userController.user.refresh();
      //show success message
      BLoaders.successSnackBar(
          title: "Congratulations", message: "Your Name has been updated");
    } catch (e) {
      //remove loader
      BFullScreenLoader.stopLoading();

      //show generic error to the user
      BLoaders.errorSnackBar(title: "Hmmm...", message: e.toString());
    }
  }
}

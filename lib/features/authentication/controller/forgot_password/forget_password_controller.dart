import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //Send reset password email
  sendPasswordResetEmail() async {
    try {
      //star loading
      BFullScreenLoader.openLoadingDialog(
          "Processing your request", BImages.loaderAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        BFullScreenLoader.stopLoading();
        BLoaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      //check form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        //remove loader
        BFullScreenLoader.stopLoading();
      }

      //Send email reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //remove loader
      BFullScreenLoader.stopLoading();

      //show success screen
      BLoaders.successSnackBar(
          title: "Email sent",
          message: "Email link sent to reset your password");

      //redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: "Sorry guys", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //star loading
      BFullScreenLoader.openLoadingDialog(
          "Processing your request", BImages.loaderAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        BFullScreenLoader.stopLoading();
        BLoaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      //Send email reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //remove loader
      BFullScreenLoader.stopLoading();

      //show success screen
      BLoaders.successSnackBar(
          title: "Email sent",
          message: "Email link sent to reset your password");
    } catch (e) {
      BFullScreenLoader.stopLoading();
      BLoaders.errorSnackBar(title: "Sorry guys", message: e.toString());
    }
  }
}

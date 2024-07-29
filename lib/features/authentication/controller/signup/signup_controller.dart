import 'package:alif_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:alif_e_commerce/data/repositories/user/user_repository.dart';
import 'package:alif_e_commerce/features/authentication/models/user_model.dart';
import 'package:alif_e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variable
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  ///--SIGNUP
  void signup() async {
    try {
      //start loading
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

      //form validation
      if (!signUpFormKey.currentState!.validate()) {
        //remove loader
        BFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        BLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create account please read the privacy policy and terms of use and accept this",
        );
        //remove loader
        BFullScreenLoader.stopLoading();
        return;
      }

      //register user in the firebase authentication and user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authentication data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loader
      BFullScreenLoader.stopLoading();

      //show success message
      BLoaders.successSnackBar(
          title: "Congratulation",
          message:
              "Your account has been created, please verify email to continue");

      //move to verify mail screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //remove loader
      BFullScreenLoader.stopLoading();

      //show some generic error to the user
      BLoaders.errorSnackBar(title: "Oh Guys", message: e.toString());
    }
  }
}

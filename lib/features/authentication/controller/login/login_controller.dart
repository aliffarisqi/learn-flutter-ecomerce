import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  //variable
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  final rememberMe = false.obs;
  final hidePassword = true.obs;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL");
    // password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    super.onInit();
  }

  ///--SIGN IN
  Future<void> signInwithEmailAndPassword() async {
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

      if (!loginFormKey.currentState!.validate()) {
        //remove loader
        BFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //login user to the firebase
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //remove loader
      BFullScreenLoader.stopLoading();

      //redirect to home screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //remove loader
      BFullScreenLoader.stopLoading();

      //show generic error to the user
      BLoaders.errorSnackBar(title: "Hmmm...", message: e.toString());
    }
  }
}

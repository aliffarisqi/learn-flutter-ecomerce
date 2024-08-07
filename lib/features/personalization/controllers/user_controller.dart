import 'package:alif_e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:alif_e_commerce/features/authentication/screens/login/login.dart';
import 'package:alif_e_commerce/features/personalization/screens/profile/widget/re_auth_user_form.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final currentUser = await userRepository.fetchUserDetails();
      user(currentUser);
    } catch (e) {
      print("masuk sini");
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //Convert name to first and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? "");
        final userName =
            UserModel.generateUsername(userCredentials.user!.displayName ?? "");

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          username: userName,
          email: userCredentials.user!.email ?? "",
          phoneNumber: userCredentials.user!.phoneNumber ?? "",
          profilePicture: userCredentials.user!.photoURL ?? "",
        );

        //Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      BLoaders.warningSnackBar(
          title: "Iam sorry",
          message: "Something went wrong, we cant save your information");
    }
  }

  //Delete account warning popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: BSizes.md, vertical: BSizes.lg),
      title: 'Delete Account',
      titlePadding: const EdgeInsets.only(top: BSizes.lg),
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: BSizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            side: const BorderSide(color: Colors.white)),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: BSizes.lg),
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  //Delete User Account
  void deleteUserAccount() async {
    try {
      //Start loading
      BFullScreenLoader.openLoadingDialog(
          "we are processiing your information ...", BImages.loaderAnimation);

      //first re auth-user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        //re verify auth email
        if (provider == "google.com") {
          await auth.loginWithGoogleAccoount();
          await auth.deleteAccount();
          BFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == "password") {
          BFullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthUserForm());
        }
      }
    } catch (e) {
      //remove loader
      BFullScreenLoader.stopLoading();

      //show generic error to the user
      BLoaders.errorSnackBar(title: "Hmmm...", message: e.toString());
    }
  }

  //Re authentication before deleting
  Future<void> reAuthenticaitonUserPassword() async {
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
      print("MAsukkkk siniii aja");
      if (!reAuthFormKey.currentState!.validate()) {
        print("MAsukkkk siniii");
        //remove loader
        BFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      BFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      //remove loader
      BFullScreenLoader.stopLoading();

      //show generic error to the user
      BLoaders.errorSnackBar(title: "Hmmm...", message: e.toString());
    }
  }
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widget/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/text_string.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  VerifyEmailController get instance => Get.find();

  // send email when verify email screen appears and set the timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      BLoaders.successSnackBar(
          title: "Email sent",
          message: "Please check your email and verify your email");
    } catch (e) {
      BLoaders.errorSnackBar(title: "Oh snap", message: e.toString());
    }
  }

  //timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              title: BTexts.yourAccountCreatedTitle,
              subTitle: BTexts.yourAccountCreatedSubTitle,
              image: BImages.successAnimation,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  //manually check email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          title: BTexts.yourAccountCreatedTitle,
          subTitle: BTexts.yourAccountCreatedSubTitle,
          image: BImages.successAnimation,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    } else {
      BLoaders.warningSnackBar(
          title: "Email not actived",
          message: "Please verify the email for activation");
    }
  }
}

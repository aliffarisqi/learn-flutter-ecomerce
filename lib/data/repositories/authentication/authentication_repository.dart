import 'package:alif_e_commerce/data/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../features/authentication/screens/signup/verify_email.dart';
import '../../../navigation_menu.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // get authentication user data
  User? get authUser => _auth.currentUser;

  ///called from main.dart an app lunch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(
          () => VerifyEmailScreen(
            email: _auth.currentUser?.email,
          ),
        );
      }
    } else {
      //local storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  /* -------------------- EMAIl & Password Sign IN ---------------------*/
  /// [Email authentication] - LOG IN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
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

  /// [Email authentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
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

  /// [Email authentication] - REGISTER
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
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

  /* -------------------- GOOGLE Sign IN ---------------------*/

  Future<UserCredential> loginWithGoogleAccoount() async {
    try {
      //trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //obtain the auth tails from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //create new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //once sign in, return the user credential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
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

  /* ---------------- FORGOT PASSWORD------------------*/
  /// [Email authentication] - REGISTER
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
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
  /* -------------------- LOG-OUT ---------------------*/

  /// [LOGOUT] valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
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

  /* -------------------- Re Auth---------------------*/

  Future<UserCredential> reAuthWithEmailAndPassword(
      String email, String password) async {
    try {
      //create credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      return await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
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
  /* -------------------- DELETE USER---------------------*/
  //REMOVE USER AUTH AND FIREBASE ACCOUNT

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw BFirebaseAuthException(e.code).message;
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
}

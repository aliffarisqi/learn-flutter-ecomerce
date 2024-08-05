import 'package:alif_e_commerce/data/repositories/user/user_repository.dart';
import 'package:alif_e_commerce/features/authentication/models/user_model.dart';
import 'package:alif_e_commerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController get instance => Get.find();
  final userRepositor = Get.put(UserRepository());

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
        await userRepositor.saveUserRecord(user);
      }
    } catch (e) {
      BLoaders.warningSnackBar(
          title: "Iam sorry",
          message: "Something went wrong, we cant save your information");
    }
  }
}

import 'package:alif_e_commerce/common/widget/loaders/shimmer.dart';
import 'package:alif_e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:alif_e_commerce/features/personalization/screens/profile/change_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/images/circular_image.dart';
import '../../../../common/widget/text/section_heading.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const BAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),

      /// BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              /// PROFILE PICTURE
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : BImages.user;
                      return controller.imageUploading.value
                          ? const BShimmerEffect(
                              width: 80, height: 80, radius: 100)
                          : CircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text("Change Profile Picture"),
                    )
                  ],
                ),
              ),

              /// DETAIL
              const SizedBox(height: BSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: BSizes.spaceBtwItems),

              /// HEADING PROFIL INFO
              const BSectionHeading(
                  title: "Profile Information", showActionButton: false),
              const SizedBox(height: BSizes.spaceBtwItems),

              Obx(
                () => ProfileMenu(
                    onPressed: () => Get.to(() => const ChangeName()),
                    title: "Name",
                    value: controller.user.value.fullName),
              ),
              ProfileMenu(
                  onPressed: () {},
                  title: "username",
                  value: controller.user.value.username),

              const SizedBox(height: BSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: BSizes.spaceBtwItems / 2),

              /// HEADING PROFIL INFO
              const BSectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: BSizes.spaceBtwItems),

              ProfileMenu(
                  onPressed: () {},
                  title: "User ID",
                  value: controller.user.value.id),
              ProfileMenu(
                  onPressed: () {},
                  title: "E-Mail",
                  value: controller.user.value.email),
              ProfileMenu(
                  onPressed: () {},
                  title: "No.HP",
                  value: controller.user.value.phoneNumber),
              ProfileMenu(onPressed: () {}, title: "Gender", value: "Male"),
              ProfileMenu(
                  onPressed: () {},
                  title: "Date Of Birth",
                  value: "18 Feb 20000"),
              const SizedBox(height: BSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: BSizes.spaceBtwItems / 2),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

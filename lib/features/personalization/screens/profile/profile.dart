import 'package:flutter/material.dart';

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
                    const CircularImage(
                      image: BImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
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

              ProfileMenu(
                  onPressed: () {}, title: "Name", value: "Bayu Alif F"),
              ProfileMenu(
                  onPressed: () {}, title: "username", value: "aliffarisqi"),

              const SizedBox(height: BSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: BSizes.spaceBtwItems / 2),

              /// HEADING PROFIL INFO
              const BSectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: BSizes.spaceBtwItems),

              ProfileMenu(onPressed: () {}, title: "User ID", value: "bsd762"),
              ProfileMenu(
                  onPressed: () {},
                  title: "E-Mail",
                  value: "bayualiev@gmail.com"),
              ProfileMenu(
                  onPressed: () {}, title: "No.HP", value: "+628982346675"),
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
                  onPressed: () {},
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

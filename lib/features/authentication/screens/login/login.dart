import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_style.dart';
import '../../../../common/widget/login_signup/form_divider.dart';
import '../../../../common/widget/login_signup/social_button.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import 'widget/login_form.dart';
import 'widget/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo, title and sub title
              const BLoginHeader(),

              ///Form
              const BLoginForm(),

              //Divider
              BFormDivider(dividerText: BTexts.orSignInWith.capitalize!),
              const SizedBox(height: BSizes.spaceBtwSections),

              // Footer
              const BFooterForm()
            ],
          ),
        ),
      ),
    );
  }
}

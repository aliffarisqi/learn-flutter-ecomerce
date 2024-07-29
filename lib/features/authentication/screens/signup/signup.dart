import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/login_signup/form_divider.dart';
import '../../../../common/widget/login_signup/social_button.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import 'widget/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                BTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: BSizes.spaceBtwSections),

              // Form
              const BSignUpForm(),

              //Divider
              const SizedBox(height: BSizes.spaceBtwSections),
              BFormDivider(dividerText: BTexts.orSignUpWith.capitalize!),

              // Footer
              const SizedBox(height: BSizes.spaceBtwSections),
              const BFooterForm()
            ],
          ),
        ),
      ),
    );
  }
}

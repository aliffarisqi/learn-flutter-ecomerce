import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../password_configuration/forgot_password.dart';
import '../../signup/signup.dart';

class BLoginForm extends StatelessWidget {
  const BLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: BSizes.spaceBtwSections),
        child: Column(
          children: [
            // email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: BTexts.email,
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwInputFields),

            //Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: BTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwInputFields / 2),

            //rememberme and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(BTexts.rememberMe),
                  ],
                ),

                /// Forgot password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  child: const Text(BTexts.forgetPassword),
                )
              ],
            ),
            const SizedBox(height: BSizes.spaceBtwSections),

            //Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(BTexts.signIn),
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwItems),

            //create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(BTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

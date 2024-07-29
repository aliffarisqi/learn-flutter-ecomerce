import 'package:flutter/material.dart';

import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/helper/helper_functions.dart';

class BLoginHeader extends StatelessWidget {
  const BLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(
            dark ? BImages.lightAppLogo : BImages.darkAppLogo,
          ),
          width: BHelperFunctions.screenWidth() * 0.4,
        ),
        Text(
          BTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: BSizes.sm),
        Text(
          BTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class BFormDivider extends StatelessWidget {
  const BFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? BColors.darkGrey : BColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
              color: dark ? BColors.darkGrey : BColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        )
      ],
    );
  }
}

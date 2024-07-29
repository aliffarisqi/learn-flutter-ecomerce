import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../custom_shapes/container/rounded_container.dart';

class BCouponCode extends StatelessWidget {
  const BCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = BHelperFunctions.isDarkMode(context);
    return BRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? BColors.dark : BColors.white,
      padding: const EdgeInsets.only(
        top: BSizes.sm,
        left: BSizes.md,
        right: BSizes.sm,
        bottom: BSizes.sm,
      ),
      child: Row(
        children: [
          //TEXT FIELD PROMO
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Have a promo ? Enter Here"),
            ),
          ),
          // BUTTON
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? BColors.white.withOpacity(0.5)
                      : BColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1))),
              child: const Text("Apply"),
            ),
          )
        ],
      ),
    );
  }
}

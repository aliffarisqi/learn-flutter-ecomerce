import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../images/circular_image.dart';

class BUserProfileTile extends StatelessWidget {
  const BUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(
        image: BImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        "Bayu Alif",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: BColors.white),
      ),
      subtitle: Text("jakartabanyu@gmail.com",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: BColors.white)),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: BColors.white,
        ),
      ),
    );
  }
}

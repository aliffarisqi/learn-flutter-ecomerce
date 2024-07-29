import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helper/helper_functions.dart';

class BTabBar extends StatelessWidget implements PreferredSizeWidget {
  const BTabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? BColors.black : BColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: BColors.primary,
        unselectedLabelColor: BColors.darkGrey,
        labelColor: dark ? BColors.white : BColors.primary,
        tabs: tabs,
        tabAlignment: TabAlignment.start,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(BDeviceUtils.getAppBarHeight());
}

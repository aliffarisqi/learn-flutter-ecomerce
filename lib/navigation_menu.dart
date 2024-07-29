import 'package:alif_e_commerce/features/personalization/screens/settings/settings.dart';
import 'package:alif_e_commerce/features/shop/screens/store/store.dart';
import 'package:alif_e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/home/home.dart';
import 'utils/constants/colors.dart';
import 'utils/helper/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationConstroller());
    final darkMode = BHelperFunctions.isDarkMode(context);
    print("Test Masuk");
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? BColors.black : BColors.white,
          indicatorColor: darkMode
              ? BColors.white.withOpacity(0.1)
              : BColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Favorite'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationConstroller extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const HomeScreen(),
    const ScreenStore(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];
}

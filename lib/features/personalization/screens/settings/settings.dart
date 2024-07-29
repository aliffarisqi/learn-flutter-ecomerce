import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widget/list_tile/settings_menu_tile.dart';
import '../../../../common/widget/list_tile/user_profile_tile.dart';
import '../../../../common/widget/text/section_heading.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/order/order.dart';
import '../address/address.dart';
import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- HEADER
            BPrimaryHeaderContainer(
              child: Column(
                children: [
                  BAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: BColors.white),
                    ),
                  ),
                  BUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: BSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- BODY
            Padding(
              padding: const EdgeInsets.all(BSizes.defaultSpace),
              child: Column(
                children: [
                  /// ACCOUNT SETTING
                  const BSectionHeading(
                      title: "Account Setting", showActionButton: false),
                  const SizedBox(height: BSizes.spaceBtwItems),

                  BSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subTitle: "Set shopping delivery",
                    onTap: () => Get.to(() => const AddressScreen()),
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.shop,
                    title: "My Cart",
                    subTitle: "See and manage cart shopping",
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Orders",
                    subTitle: "View and manage orders",
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Wishlist",
                    subTitle: "View and manage wishlist",
                    onTap: () {},
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.bank,
                    title: "Payment Methods",
                    subTitle: "Add or remove payment methods",
                    onTap: () {},
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "Coupons",
                    subTitle: "View available coupons",
                    onTap: () {},
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subTitle: "Manage notification settings",
                    onTap: () {},
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: "Security",
                    subTitle: "Manage security settings",
                    onTap: () {},
                  ),

                  /// APP SETTINGS
                  const SizedBox(height: BSizes.spaceBtwSections),
                  const BSectionHeading(
                      title: "App Setting", showActionButton: false),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  BSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subTitle: "Manage security settings",
                    onTap: () {},
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Geolocation",
                    subTitle: "Set recomendation based on location",
                    onTap: () {},
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  BSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subTitle: "Search with safe mode",
                    onTap: () {},
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  BSettingMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image",
                    subTitle: "Set image to HD Quality",
                    onTap: () {},
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// LOGOUT BUTTON
                  const SizedBox(height: BSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: const Text("Logout")),
                  ),
                  const SizedBox(height: BSizes.spaceBtwSections * 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

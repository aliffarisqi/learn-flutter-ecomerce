import 'package:alif_e_commerce/common/widget/success_screen/success_screen.dart';
import 'package:alif_e_commerce/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:alif_e_commerce/navigation_menu.dart';
import 'package:alif_e_commerce/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../common/widget/product/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../cart/widget/cart_items.dart';
import 'widget/billing_amount_section.dart';
import 'widget/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = BHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: BAppBar(
        showBackArrow: true,
        title: Text("Order Review",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              ///--- Item in Cart
              const CartItems(showAddRemoveButton: false),
              const SizedBox(height: BSizes.spaceBtwItems),

              // Card Coupon
              const BCouponCode(),
              const SizedBox(height: BSizes.spaceBtwSections),

              // Billing Section
              BRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? BColors.black : BColors.white,
                padding: const EdgeInsets.all(BSizes.md),
                child: const Column(
                  children: [
                    //Price
                    BillingAmountSection(),
                    SizedBox(height: BSizes.spaceBtwItems),

                    //Divider
                    Divider(),
                    SizedBox(height: BSizes.spaceBtwItems),

                    //Payment methode
                    BillingPaymentSection(),
                    //addres
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    title: "Payment Success",
                    subTitle: "Your item will be shipped soon!",
                    image: BImages.successfulPaymentIcon,
                    onPressed: () => Get.offAll(
                      () => const NavigationMenu(),
                    ),
                  ),
                ),
            child: const Text("Checkout \$1345.0")),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import 'add_new_address.dart';
import 'widget/single_address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => const AddNewAddressScreen(),
        ),
        backgroundColor: BColors.primary,
        child: const Icon(Iconsax.add, color: BColors.white),
      ),
      appBar: BAppBar(
        showBackArrow: true,
        title: Text(
          "My Address",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SingleAddress(selectedAddress: false),
            SingleAddress(selectedAddress: false),
            SingleAddress(selectedAddress: true),
            SingleAddress(selectedAddress: false),
            SingleAddress(selectedAddress: false),
          ],
        ),
      ),
    );
  }
}

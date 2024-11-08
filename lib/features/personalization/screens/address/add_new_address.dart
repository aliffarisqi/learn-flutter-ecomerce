import 'package:alif_e_commerce/common/widget/appbar/appbar.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(
        showBackArrow: true,
        title: Text("Add new address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: "Name",
                  ),
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: "Phone Number",
                  ),
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: "Street",
                        ),
                      ),
                    ),
                    const SizedBox(width: BSizes.spaceBtwInputFields / 1.5),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: "Postal kode",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: "City",
                        ),
                      ),
                    ),
                    const SizedBox(width: BSizes.spaceBtwInputFields / 1.5),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: "State",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: BSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: "Country",
                  ),
                ),
                const SizedBox(height: BSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

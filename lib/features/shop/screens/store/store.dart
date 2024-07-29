import 'package:alif_e_commerce/common/widget/appbar/tabbar.dart';
import 'package:alif_e_commerce/common/widget/layout/grid_layout.dart';
import 'package:alif_e_commerce/features/shop/screens/brands/all_brands.dart';
import 'package:alif_e_commerce/features/shop/screens/store/widget/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/custom_shapes/container/search_container.dart';
import '../../../../common/widget/product/cart/cart_menu_icon.dart';
import '../../../../common/widget/brands/brand_card.dart';
import '../../../../common/widget/text/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

class ScreenStore extends StatelessWidget {
  const ScreenStore({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: BAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            BCartCounterIcon(
                iconColor: dark ? BColors.white : BColors.black,
                onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerboxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: BHelperFunctions.isDarkMode(context)
                    ? BColors.black
                    : BColors.white,
                expandedHeight: 380,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(BSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //-- Search Bar
                      const BSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: BSizes.spaceBtwItems),

                      //-- Feature Brands
                      BSectionHeading(
                        title: "Feature Brands",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: BSizes.spaceBtwItems / 1.5),

                      //-- Card Brands
                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return BBrandCard(
                            showBorder: true,
                            onTap: () {},
                          );
                        },
                      )
                    ],
                  ),
                ),

                /// TABS BAR
                bottom: const BTabBar(
                  tabs: [
                    Tab(child: Text("Sport")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronic")),
                    Tab(child: Text("CLothes")),
                    Tab(child: Text("Cosmetic")),
                  ],
                ),
              ),
            ];
          },

          /// BODY
          body: const TabBarView(children: [
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
            CategoryTab(),
          ]),
        ),
      ),
    );
  }
}

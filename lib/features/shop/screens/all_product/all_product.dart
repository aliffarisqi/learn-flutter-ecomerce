import 'package:flutter/material.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/product/sortable/sortable_product.dart';
import '../../../../utils/constants/sizes.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BAppBar(
        title: Text("Pupular Product"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(BSizes.defaultSpace),
            child: SortAbleProduct()),
      ),
    );
  }
}

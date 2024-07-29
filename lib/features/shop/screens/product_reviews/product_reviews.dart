import 'package:alif_e_commerce/features/shop/screens/product_reviews/widget/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/product/ratings/ratings_indicator.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/overall_product_ratings.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: const BAppBar(
        title: Text("Reviews and ratings"),
        showBackArrow: true,
      ),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "reviews lorem dolar ipsu dolar dolar alert mipso jn asdf hb efkbc ukashbdv wekfhb habsdc khabsdhbdsf khasbdvjhb "),
              const SizedBox(height: BSizes.spaceBtwItems),

              // Overall product ratings
              const OverallProductRatings(),
              const BRatingsIndicator(
                rating: 3.5,
              ),
              Text("112.43", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: BSizes.spaceBtwItems),

              //User review List
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

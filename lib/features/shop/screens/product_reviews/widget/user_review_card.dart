import 'package:alif_e_commerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:alif_e_commerce/common/widget/product/ratings/ratings_indicator.dart';
import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/constants/images_strings.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // USER PROFILE
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(BImages.userProfileImage1)),
                const SizedBox(width: BSizes.spaceBtwItems),
                Text(
                  "Jhon doe",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems),

        //USER RATING
        Row(
          children: [
            const BRatingsIndicator(rating: 4),
            const SizedBox(width: BSizes.spaceBtwItems),
            Text("10, feb, 2022", style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems),
        const ReadMoreText(
          "This product is truly amazing! I am very satisfied with the quality and performance. The design is elegant, and the materials used feel premium. Additionally, the shipping was very fast, and customer service was highly responsive. This product exceeded my expectations and is highly recommended for anyone looking for high quality at an affordable price. I will definitely shop here again!",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: "show less",
          trimCollapsedText: "show more",
          moreStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: BColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: BColors.primary,
          ),
        ),
        const SizedBox(height: BSizes.spaceBtwItems),

        //Company Review
        BRoundedContainer(
          backgroundColor: dark ? BColors.darkerGrey : BColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(BSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("B-Sport",
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text("22 Aug, 2023",
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                const SizedBox(height: BSizes.spaceBtwItems),
                const ReadMoreText(
                  """Thank you so much for your fantastic review! We are thrilled to hear that you are satisfied with the quality and performance of our product. We take great pride in offering premium materials and elegant designs, and it's wonderful to know that they have met your expectations.

We are also pleased to hear that you experienced fast shipping and responsive customer service. Your satisfaction is our top priority, and your feedback motivates us to continue delivering the best service possible.

We look forward to serving you again in the future. If you have any further questions or need assistance, please do not hesitate to contact us.

Best regards""",
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "show less",
                  trimCollapsedText: "show more",
                  moreStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: BColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: BColors.primary,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: BSizes.spaceBtwItems),
      ],
    );
  }
}

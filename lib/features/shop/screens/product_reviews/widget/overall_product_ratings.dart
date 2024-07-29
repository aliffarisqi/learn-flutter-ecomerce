import 'package:flutter/material.dart';

import 'progres_indicator.dart';

class OverallProductRatings extends StatelessWidget {
  const OverallProductRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text("4,5", style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingsProgresIndicator(text: "5", value: 0.8),
              RatingsProgresIndicator(text: "4", value: 0.7),
              RatingsProgresIndicator(text: "3", value: 0.4),
              RatingsProgresIndicator(text: "2", value: 0.3),
              RatingsProgresIndicator(text: "1", value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}

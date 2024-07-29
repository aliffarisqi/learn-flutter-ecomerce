import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class RatingsProgresIndicator extends StatelessWidget {
  const RatingsProgresIndicator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 10,
          child: SizedBox(
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: BColors.grey,
              valueColor: const AlwaysStoppedAnimation(BColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}

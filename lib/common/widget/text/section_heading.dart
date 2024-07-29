import 'package:flutter/material.dart';

class BSectionHeading extends StatelessWidget {
  const BSectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.onPressed,
    this.textButton = "View All",
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, textButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(textButton),
          )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle(
      {super.key, required this.title, this.smalSize = false, this.maxLines = 2, this.textAlign = TextAlign.left});

  final String title;
  final bool smalSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smalSize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

import 'package:alif_e_commerce/common/widget/custom_shapes/container/circular_container.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class BChoiceChip extends StatelessWidget {
  const BChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = BHelperFunctions.getColor(text);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor != null ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        // ignore: dead_code
        labelStyle: TextStyle(color: selected ? BColors.white : null),
        avatar: isColor != null
            ? BCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: isColor,
              )
            : null,
        shape: isColor != null ? const CircleBorder() : null,
        labelPadding: isColor != null ? const EdgeInsets.all(0) : null,
        padding: isColor != null ? const EdgeInsets.all(0) : null,
        backgroundColor:
            isColor != null ? BHelperFunctions.getColor(text) : null,
        selectedColor: isColor != null ? BHelperFunctions.getColor(text) : null,
      ),
    );
  }
}

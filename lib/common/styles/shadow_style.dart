import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: BColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
  static final horizontalProductShadow = BoxShadow(
    color: BColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}

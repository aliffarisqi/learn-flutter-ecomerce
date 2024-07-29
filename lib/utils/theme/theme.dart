import 'package:alif_e_commerce/utils/theme/custom_theme/appbar_theme.dart';
import 'package:alif_e_commerce/utils/theme/custom_theme/button_sheet_theme.dart';
import 'package:alif_e_commerce/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:alif_e_commerce/utils/theme/custom_theme/chip_theme.dart';
import 'package:alif_e_commerce/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:alif_e_commerce/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:alif_e_commerce/utils/theme/custom_theme/text_field_theme.dart';
import 'package:alif_e_commerce/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class BAppTheme {
  BAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: BTextTheme.lightTextTheme,
    chipTheme: BChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: BAppbarTheme.lightAppBarTheme,
    checkboxTheme: BCheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme: BButtonSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: BElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: BOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: BTextTheme.darkTextTheme,
    chipTheme: BChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: BAppbarTheme.darkAppBarTheme,
    checkboxTheme: BCheckboxTheme.darkCheckBoxTheme,
    bottomSheetTheme: BButtonSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: BElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: BOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: BTextFieldTheme.darkInputDecorationTheme,
  );
}

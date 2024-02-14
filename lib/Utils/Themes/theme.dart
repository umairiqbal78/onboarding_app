import 'package:flutter/material.dart';
import 'package:onboarding/Utils/Contants/colors.dart';
import 'package:onboarding/Utils/Themes/appbar_theme.dart';
import 'package:onboarding/Utils/Themes/bottom_sheet_theme.dart';
import 'package:onboarding/Utils/Themes/checkbox_theme.dart';
import 'package:onboarding/Utils/Themes/chip_theme.dart';
import 'package:onboarding/Utils/Themes/elevated_button_themes.dart';
import 'package:onboarding/Utils/Themes/outlined_button_theme.dart';
import 'package:onboarding/Utils/Themes/text_theme.dart';
import 'package:onboarding/Utils/Themes/input_decoration_theme.dart';

class XTheme {
  XTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    primaryColor: XColors.primaryColor,
    scaffoldBackgroundColor: XColors.whiteColor,
    textTheme: XTextThemes.lightTextTheme,
    elevatedButtonTheme: XElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: XAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: XBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: XCheckboxTheme.lightCheckboxTheme,
    chipTheme: XChipTheme.lightChipTheme,
    outlinedButtonTheme: XOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: XInputDecorationTheme.lightInputDecorationTheme,
  );
}

import 'package:flutter/material.dart';
import 'package:trajekita/utils/theme/custom_themes/text_theme.dart';

import 'custom_themes/elevated_button_theme.dart/';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/outline_button_theme.dart';
import 'custom_themes/text_field_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.green,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecoration,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecoration,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
  );
}

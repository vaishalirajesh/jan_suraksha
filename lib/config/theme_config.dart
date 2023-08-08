import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jan_suraksha/config/style_config.dart';

import 'color_config.dart';

class JSThemes {
  static ThemeData jsThemeMobile = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConfig.jsWhiteColor,
      foregroundColor: ColorConfig.jsWhiteColor,
      elevation: 2,
      toolbarHeight: 60.h,
      titleSpacing: 0,
    ),
    primaryColor: ColorConfig.jsPrimaryColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorConfig.jsPrimaryColor,
      onPrimary: ColorConfig.jsPrimaryDisableColor,
      secondary: ColorConfig.jsSecondaryColor,
      onSecondary: ColorConfig.jsLightBlackColor,
      error: ColorConfig.jsRedColor,
      onError: ColorConfig.jsRedColor,
      background: ColorConfig.jsWhiteColor,
      onBackground: ColorConfig.jsCreamColor,
      surface: ColorConfig.jsTextFiledBgColor,
      onSurface: ColorConfig.jsCardBgColor,
      secondaryContainer: ColorConfig.jsLightGreyColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 45.h),
        textStyle: StyleConfig.mediumText16,
        backgroundColor: ColorConfig.jsPrimaryColor,
        foregroundColor: ColorConfig.jsWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    ),
  );
}

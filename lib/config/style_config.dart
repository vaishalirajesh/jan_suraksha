import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jan_suraksha/config/theme_config.dart';

import 'color_config.dart';
import 'font_config.dart';

class StyleConfig {
  static TextStyle regularExtraSmallText = TextStyle(
    fontSize: 12.sp,
    fontFamily: JSFonts.outfitRegular,
  );
  static TextStyle regularExtraSmallPinkText = TextStyle(
    fontSize: 12.sp,
    fontFamily: JSFonts.outfitRegular,
    color: ColorConfig.jsDarkPinkColor,
  );
  static TextStyle mediumSmallText = TextStyle(
    fontSize: 13.sp,
    fontFamily: JSFonts.outfitSemiBold,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle smallText = TextStyle(
    fontSize: 14.sp,
    fontFamily: JSFonts.outfitRegular,
    color: ColorConfig.jsBlackColor,
  );
  static TextStyle smallTextLight = TextStyle(
    fontSize: 14.sp,
    fontFamily: JSFonts.outfitRegular,
    color: ColorConfig.jsLightGreyColor,
  );
  static TextStyle semiBoldSmallText = TextStyle(
    fontSize: 14.sp,
    fontFamily: JSFonts.outfitSemiBold,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle regularText16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: JSFonts.outfitRegular,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle regularWhiteText16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: JSFonts.outfitRegular,
    color: ColorConfig.jsWhiteColor,
  );
  static TextStyle boldText16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: JSFonts.outfitBold,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle mediumText16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: JSFonts.outfitMedium,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle mediumText18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: JSFonts.outfitSemiBold,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle boldMediumText = TextStyle(
    fontSize: 18.sp,
    fontFamily: JSFonts.outfitBold,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle boldText20 = TextStyle(
    fontSize: 20.sp,
    fontFamily: JSFonts.outfitBold,
  );
  static TextStyle regularLargeText = TextStyle(
    fontSize: 24.sp,
    fontFamily: JSFonts.outfitRegular,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle mediumLargeText = TextStyle(
    fontSize: 30.sp,
    fontFamily: JSFonts.outfitSemiBold,
    color: ColorConfig.jsLightBlackColor,
  );
  static TextStyle semiBoldExtraLargeText = TextStyle(
    fontSize: 35.sp,
    fontFamily: JSFonts.outfitBold,
    color: ColorConfig.jsLightBlackColor,
  );

  static ButtonStyle setDisableButtonBig() {
    return JSThemes.jsThemeMobile.elevatedButtonTheme.style!.copyWith(
      foregroundColor: MaterialStateProperty.all(
        JSThemes.jsThemeMobile.colorScheme.primary,
      ),
      backgroundColor: MaterialStateProperty.all(
        JSThemes.jsThemeMobile.colorScheme.onBackground,
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(fontSize: 16.sp, fontFamily: JSFonts.outfitBold),
      ),
    );
  }
}

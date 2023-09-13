import 'package:flutter/material.dart';
import 'package:jan_suraksha/config/theme_config.dart';

import 'constant/string_constant.dart';

class ThemeHelper {
  static ThemeData? theme;

  static void setTheme(ThemeData themeData) {
    theme = themeData;
  }

  static ThemeData? getInstance() {
    if (theme != null) {
      return theme;
    } else {
      return JSThemes.jsThemeMobile;
    }
  }

  static initTheme(String bankName) {
    switch (bankName) {
      case AppString.jsBankName:
        theme = JSThemes.jsThemeMobile;
        break;
      default:
        return JSThemes.jsThemeMobile;
    }
  }
}

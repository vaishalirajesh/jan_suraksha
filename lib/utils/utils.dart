import 'package:jan_suraksha/utils/constant/string_constant.dart';

class AppUtils {
  static String path(str) {
    return getImageBasePath(AppString.jsBankName) + str;
  }

  static String getImageBasePath(String bankName) {
    switch (bankName) {
      case AppString.jsBankName:
        return "assets/images/";
      default:
        return "assets/images/";
    }
  }
}

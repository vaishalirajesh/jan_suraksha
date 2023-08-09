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

  // For hide account number digits. Show only last four digit visible.
  static String getMaskedMobileNumber({required String mobileNumber}) {
    if (mobileNumber.isEmpty || mobileNumber.length <= 4) {
      return "-";
    }
    String subString = mobileNumber.substring(mobileNumber.length - 4);
    String newString = "xxxxxx$subString";
    return newString;
  }
}

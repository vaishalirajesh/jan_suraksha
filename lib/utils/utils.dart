import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/services/common/keys.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';

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

  static void onBackPress() {
    Get.back();
  }

  static Future<bool> onWillPopScope() async {
    Get.back();
    return true;
  }

  static void onBackToDashboard() {
    Get.offAll(() => DashboardPage(), binding: DashboardBinding());
  }

  static Future<bool> onWillPopToDashboard() async {
    Get.offAll(() => DashboardPage(), binding: DashboardBinding());
    return true;
  }

  static void onBackPressAuth() {
    SystemNavigator.pop();
  }

  static Future<bool> onWillPopScopeAuth() async {
    SystemNavigator.pop();
    return true;
  }

  static void setAccessToken(String? value) {
    TGSharedPreferences.getInstance().set(PREF_ACCESS_TOKEN_SIDBI, value);
  }

  static Future<String?> getAccessToken() async {
    return await TGSharedPreferences.getInstance().get(PREF_ACCESS_TOKEN_SIDBI);
  }

  static Future<void> removeToken() async {
    await TGSharedPreferences.getInstance().remove(PREF_ACCESS_TOKEN_SIDBI);
  }
}

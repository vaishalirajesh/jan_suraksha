import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jan_suraksha/services/common/keys.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/flavor.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_binding.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_view.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';

import '../services/common/tg_log.dart';

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

  static Future<bool> onWillNoPop() async {
    return false;
  }

  static Future<bool> onWillPopLogin() async {
    Get.offAll(() => LoginPage(), binding: LoginBinding());
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
    TGSharedPreferences.getInstance().set(PREF_ACCESS_TOKEN, value);
  }

  static Future<String?> getAccessToken() async {
    return await TGSharedPreferences.getInstance().get(PREF_ACCESS_TOKEN);
  }

  static Future<void> removeToken() async {
    await TGSharedPreferences.getInstance().remove(PREF_ACCESS_TOKEN);
  }

  static String convertIndianCurrency(String? amount) {
    var moneyString;

    var _amount = double.parse(amount ?? "0.0");

    var formatter = NumberFormat.currency(
      symbol: '\u{20B9}',
      locale: "en_IN",
      decimalDigits: 3,
    );
    formatter.maximumFractionDigits = 0;

    if (_amount != null || _amount != 0.0) {
      moneyString = formatter.format(_amount);
    } else {
      moneyString = formatter.format(0.0);
    }

    return moneyString;
  }

  static String convertDateFormat(String? date, String inFormat, String outFormat) {
    if (date?.isNotEmpty == true || date != null) {
      final format = DateFormat(inFormat);
      DateTime gettingDate = format.parse(date!);
      final DateFormat formatter = DateFormat(outFormat);
      // Output Date Format
      final String formatted = formatter.format(gettingDate);
      return formatted;
    } else {
      return '-';
    }
  }

  static String getAmountFromSchemeId(int id) {
    if (id == 1) {
      return ' ₹20';
    } else {
      return ' ₹436';
    }
  }

  static String getSchemeName(int id) {
    if (id == 1) {
      return 'PMSBY';
    } else {
      return 'PMJJBY';
    }
  }

  static String getDecryptedString(String data) {
    TGLog.d('Decrypted data-from APp Utils---${AesGcmEncryptionUtils.decryptNew(data)}');
    return '';
  }

  static String getAppDomain() {
    if (AppFlavor.name() == 'js_uat') {
      return 'https://uat-jns.instantmseloans.in';
    } else if (AppFlavor.name() == 'js_qa') {
      return 'https://qa-jns.instantmseloans.in';
    } else {
      return 'https://uat-jns.instantmseloans.in';
    }
  }

  static Widget getImageFromType({required String imageUrl}) {
    if (imageUrl.isNotEmpty) {
      bool isImageSvg = imageUrl.substring(imageUrl.length - 4, imageUrl.length) == '.svg' ? true : false;
      return isImageSvg
          ? SvgPicture.network(
              imageUrl,
              height: 30.r,
              // width: 30.r,
            )
          : Image.network(
              imageUrl,
              height: 30.r,
              // width: 30.r,
            );
    } else {
      return const SizedBox();
    }
  }

  static String capitalize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }
}

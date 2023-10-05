import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/singleton/shared_preferences.dart';
import '../../../utils/constant/prefrenceconstants.dart';

class PersonalInfoLogic extends GetxController {
  RxString userName = ''.obs;
  RxString mobilenumber = ''.obs;

  RxString email = "".obs;

  var isLoadingEmailOTP = false.obs;

  var passwordController = TextEditingController();

  var repeatPasswordController = TextEditingController();

  var shouldChangeAppearInEmailSuffix = true.obs;

  @override
  Future<void> onInit() async {
    userName.value = await TGSharedPreferences.getInstance().get(PREF_USER_NAME) ?? '';
    mobilenumber.value = await TGSharedPreferences.getInstance().get(PREF_MOBILE) ?? '';
    email.value = await TGSharedPreferences.getInstance().get(PREF_USER_EMAIL) ?? '';
    super.onInit();
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}

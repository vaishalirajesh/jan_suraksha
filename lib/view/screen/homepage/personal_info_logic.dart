import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/singleton/shared_preferences.dart';
import '../../../utils/constant/prefrenceconstants.dart';

class PersonalInfoLogic extends GetxController {
  RxString userName = ''.obs;
  RxString mobilenumber = ''.obs;

  RxString email = "".obs;

  var isLoadingEmailOTP = false.obs;

  var shouldChangeAppearInEmailSuffix = true.obs;
  var showEditIcon = true.obs;

  var emailController = TextEditingController();

  var setPassError = "".obs;

  var resetPassError = "".obs;
  var subtitle = "A verification code has been sent to your Email \n".obs;
  RxBool isEmailChanging = false.obs;
  RxBool isPasswordChanging = false.obs;
  RxString otp = ''.obs;
  RxString passwordOtp = ''.obs;
  RxString otpEmailError = ''.obs;
  RxString otpPasswordError = ''.obs;
  var setPasswordController = TextEditingController(text: '');
  var repeatSetPasswordController = TextEditingController(text: '');
  RxBool isSetPasswordLoading = false.obs;
  final key = GlobalKey<State<Tooltip>>();
  RxBool isEnablePasswordOtpResend = false.obs;
  RxBool isEnableEmailOtpResend = false.obs;
  RxBool isShowPassword = true.obs;
  RxBool isShowConfirmPassword = true.obs;

  @override
  Future<void> onInit() async {
    userName.value = await TGSharedPreferences.getInstance().get(PREF_USERNAME) ?? '';
    mobilenumber.value = await TGSharedPreferences.getInstance().get(PREF_MOBILE) ?? '';
    emailController.text = await TGSharedPreferences.getInstance().get(PREF_USER_EMAIL) ?? '';
    email.value = emailController.text;
    shouldChangeAppearInEmailSuffix.value = false;
    // tooltipController.addListener(() {
    //   // Prints the enum value of [TooltipStatus.isShowing] or [TooltipStatus.isHiding]
    //   print('controller: ${tooltipController.value}');
    // });
    super.onInit();
  }

  void onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/auth/verify_otp/verify_otp_binding.dart';
import 'package:jan_suraksha/view/screen/auth/verify_otp/verify_otp_view.dart';

class LoginLogic extends GetxController {
  TextEditingController mobileController = TextEditingController(text: '');
  RxString mobile = ''.obs;

  void onChangeMobile(String? str) {
    mobile.value = mobileController.text;
  }

  void onPressSentOTP() {
    Get.offAll(() => const VerifyOtpPage(), binding: VerifyOtpBinding());
  }
}

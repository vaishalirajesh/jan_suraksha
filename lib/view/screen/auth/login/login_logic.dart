import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/view/screen/auth/verify_otp/verify_otp_binding.dart';
import 'package:jan_suraksha/view/screen/auth/verify_otp/verify_otp_view.dart';

class LoginLogic extends GetxController {
  TextEditingController mobileController = TextEditingController(text: '');
  RxString mobile = ''.obs;
  RxString errorMsg = ''.obs;

  void onChangeMobile(String? str) {
    errorMsg.value = '';
    mobile.value = mobileController.text;
  }

  void onPressSentOTP() {
    final validCharacters = RegExp(r'^[0-9]+$');
    if (mobileController.text.length == 10 && validCharacters.hasMatch(mobileController.text)) {
      errorMsg.value = '';
      Get.offAll(
        () => const VerifyOtpPage(),
        binding: VerifyOtpBinding(),
        arguments: {
          AppArguments.mobileNumber: mobile.value,
        },
      );
    } else {
      errorMsg?.value = 'Please enter valid mobile number';
    }
    print('Errormsg--------${errorMsg?.value}');
  }
}
// scrollPadding: EdgeInsets.only(
// bottom: MediaQuery.of(context).viewInsets.bottom + fontSize*4),

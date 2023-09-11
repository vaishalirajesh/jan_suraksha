import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/consent_success/consent_success_binding.dart';
import 'package:jan_suraksha/view/screen/journey/consent_success/consent_success_view.dart';
import 'package:jan_suraksha/view/widget/otp_bottom_sheet.dart';

class TermsAndConditionsLogic extends GetxController {
  RxString otp = ''.obs;

  void onPressButton(BuildContext context) {
    OTPBottomSheet.getBottomSheet(
      context: context,
      onChangeOTP: onChangeOTP,
      onSubmitOTP: onSubmitOTP,
      mobileNumber: '1234567890',
      isEnable: true.obs,
      isLoading: false.obs,
      onButtonPress: onPressContinue,
    );
  }

  void onChangeOTP(String str) {
    otp.value = str;
  }

  void onSubmitOTP(String str) {
    otp.value = str;
  }

  void onPressContinue() {
    Get.to(() => const ConsentSuccessPage(), binding: ConsentSuccessBinding());
  }
}

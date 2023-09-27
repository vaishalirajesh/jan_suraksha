import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/widget/email_bottom_sheet.dart';

class ServicesLogic extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    OTPBottomSheetEmail.getBottomSheet(
      context: Get.context!,
      onChangeOTP: (s) {},
      onSubmitOTP: (s) {},
      title: 'Update Email ID',
      isEnable: true.obs,
      isLoading: isLoading,
      onButtonPress: () {},
      notNow: () {},
    );
    super.onInit();
  }

  void onUpdate() {}
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_view.dart';

class GuradianDetailsLogic extends GetxController {
  RxBool isDataVerify = true.obs;
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController mobileController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController relationWithApplicantController = TextEditingController(text: '');
  void onPressContinue() {
    Get.to(() => PreviewApplicationPage(), binding: PreviewApplicationBinding());
  }
}

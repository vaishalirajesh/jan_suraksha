import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_view.dart';

class GuradianDetailsLogic extends GetxController {
  RxBool isLoading = false.obs;
  GetApplicationFormDetailsResponseMain getAppData = GetApplicationFormDetailsResponseMain();
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController mobileController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController relationWithApplicantController = TextEditingController(text: '');

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      String data = await TGSharedPreferences.getInstance().get(PREF_USER_FORM_DATA);
      getAppData = getApplicationFormDetailsResponseMainFromJson(data);
      firstNameController.text = getAppData.data?.nominee?.first.nameOfGuardian ?? '';
      mobileController.text = getAppData.data?.nominee?.first.mobileNumberOfGuardian ?? '';
      emailController.text = getAppData.data?.nominee?.first.emailIdOfGuardian ?? '';
      addressController.text = getAppData.data?.nominee?.first.addressOfGuardian ?? '';
      relationWithApplicantController.text = getAppData.data?.nominee?.first.relationShipOfGuardianStr ?? '';
      isLoading.value = true;
    });
  }

  void onPressContinue() {
    Get.to(() => PreviewApplicationPage(), binding: PreviewApplicationBinding());
  }
}

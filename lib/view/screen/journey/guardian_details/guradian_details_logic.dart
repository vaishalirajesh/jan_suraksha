import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
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
  RxString fNameErrorMsg = ''.obs;
  RxString relationErrorMsg = ''.obs;
  RxString addressErrorMsg = ''.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      String data = await TGSession.getInstance().get(PREF_USER_FORM_DATA);
      getAppData = getApplicationFormDetailsResponseMainFromJson(data);
      firstNameController.text = getAppData.data?.nominee?.first.nameOfGuardian ?? '';
      mobileController.text = getAppData.data?.nominee?.first.mobileNumberOfGuardian ?? '';
      emailController.text = getAppData.data?.nominee?.first.emailIdOfGuardian ?? '';
      addressController.text = getAppData.data?.nominee?.first.addressOfGuardian ?? '';
      relationWithApplicantController.text = getAppData.data?.nominee?.first.relationShipOfGuardianStr ?? '';
      isLoading.value = true;
    });
  }

  Future<void> setData() async {
    getAppData.data?.nominee?.first.nameOfGuardian = firstNameController.text;
    getAppData.data?.nominee?.first.addressOfGuardian = addressController.text;
    getAppData.data?.nominee?.first.relationShipOfGuardian = 2;
    getAppData.data?.nominee?.first.mobileNumberOfGuardian = mobileController.text;
    getAppData.data?.nominee?.first.emailIdOfGuardian = emailController.text;
    TGSession.getInstance().set(PREF_USER_FORM_DATA, getApplicationFormDetailsResponseMainToJson(getAppData));
    TGLog.d("First Name--${getAppData.data?.nominee!.first.firstName}");
  }

  void onPressContinue() {
    if (isLoading.value) {
      if (firstNameController.text.isEmpty) {
        fNameErrorMsg.value = 'Please enter name';
        relationErrorMsg.value = '';
        addressErrorMsg.value = '';
      } else if (addressController.text.isEmpty) {
        fNameErrorMsg.value = '';
        relationErrorMsg.value = '';
        addressErrorMsg.value = 'Please enter address';
      } else if (relationWithApplicantController.text.isEmpty) {
        fNameErrorMsg.value = '';
        relationErrorMsg.value = 'Please select relation with nominee';
        addressErrorMsg.value = '';
      } else {
        fNameErrorMsg.value = '';
        relationErrorMsg.value = '';
        addressErrorMsg.value = '';
        setData();
        Get.to(() => PreviewApplicationPage(), binding: PreviewApplicationBinding());
      }
    }
  }
}

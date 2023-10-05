import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_view.dart';

import '../nominee_details/nominee_details_logic.dart';

class GuradianDetailsLogic extends GetxController {
  final nomineeDetailsLogic = Get.find<NomineeDetailsLogic>();

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
  RxString emailErrorMsg = ''.obs;
  RxString mobileErrorMsg = ''.obs;
  var guardianRelationShip = "".obs;
  Rx<num> relationshipGuardianId = num.parse('0').obs;
  RegExp specialCharExpStartChar = RegExp(r'^[!@#$%^&*()]+$');
  RegExp onlyCharRegExp = RegExp(r'^[a-zA-Z ]+$');
  RegExp mobileRegExp = RegExp(r'^[0-9]+$');
  RegExp mobileRegExpStartChar = RegExp(r'^[6-9]+$');
  RegExp emailRegExp = RegExp("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+");

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
      guardianRelationShip.value = getAppData.data?.nominee?.first.relationShipOfGuardianStr ?? '';
      relationshipGuardianId.value = getAppData.data?.nominee?.first.relationShipOfGuardian ?? num.parse('0');
      isLoading.value = true;
    });
  }

  Future<void> setData() async {
    getAppData.data?.nominee?.first.nameOfGuardian = firstNameController.text;
    getAppData.data?.nominee?.first.addressOfGuardian = addressController.text;
    getAppData.data?.nominee?.first.relationShipOfGuardian = relationshipGuardianId.value;
    getAppData.data?.nominee?.first.mobileNumberOfGuardian = mobileController.text;
    getAppData.data?.nominee?.first.emailIdOfGuardian = emailController.text;
    getAppData.data?.nominee?.first.relationShipOfGuardianStr = guardianRelationShip.value;
    TGSession.getInstance().set(PREF_USER_FORM_DATA, getApplicationFormDetailsResponseMainToJson(getAppData));
    TGLog.d("First Name--${getAppData.data?.nominee!.first.firstName}");
  }

  void onPressContinue() {
    print("onPressContinue");
    if (firstNameController.text.isEmpty ||
        !onlyCharRegExp.hasMatch(firstNameController.text) ||
        firstNameController.text == ' ') {
      fNameErrorMsg.value = 'Please enter valid name';
      relationErrorMsg.value = '';
      addressErrorMsg.value = '';
      emailErrorMsg.value = '';
      mobileErrorMsg.value = '';
    } else if (addressController.text.isEmpty ||
        addressController.text.length < 2 ||
        specialCharExpStartChar.hasMatch(addressController.text.substring(0))) {
      fNameErrorMsg.value = '';
      relationErrorMsg.value = '';
      addressErrorMsg.value = 'Please enter valid address';
      emailErrorMsg.value = '';
      mobileErrorMsg.value = '';
      // !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0)) &&
      //     ((!mobileRegExp.hasMatch(mobileController.text) || mobileController.text.length != 10))
    } else if (emailController.text.isNotEmpty &&
        ((emailController.text.length < 5) || !emailRegExp.hasMatch(emailController.text))) {
      fNameErrorMsg.value = '';
      relationErrorMsg.value = '';
      addressErrorMsg.value = '';
      emailErrorMsg.value = 'Please enter valid email Id';
      mobileErrorMsg.value = '';
    } else if (((mobileController.text.isNotEmpty && !mobileRegExp.hasMatch(mobileController.text)) ||
            mobileController.text == ' ' ||
            (mobileController.text.isNotEmpty &&
                !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0, 1)))) ||
        (mobileController.text.isNotEmpty && mobileController.text.length != 10)) {
      mobileErrorMsg.value = 'Please enter valid mobile number';
      fNameErrorMsg.value = '';
      relationErrorMsg.value = '';
      addressErrorMsg.value = '';
      emailErrorMsg.value = '';
    } else {
      fNameErrorMsg.value = '';
      relationErrorMsg.value = '';
      addressErrorMsg.value = '';
      emailErrorMsg.value = '';
      mobileErrorMsg.value = '';
      setData();
      Get.to(() => PreviewApplicationPage(), binding: PreviewApplicationBinding());
    }
  }
}

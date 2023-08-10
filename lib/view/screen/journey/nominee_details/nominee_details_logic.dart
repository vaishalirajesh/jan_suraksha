import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_view.dart';

class NomineeDetailsLogic extends GetxController {
  RxBool isDataVerify = true.obs;
  RxBool isChecked = true.obs;
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController middleNameController = TextEditingController(text: '');
  TextEditingController latsNameController = TextEditingController(text: '');
  TextEditingController mobileController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController pinCodeController = TextEditingController(text: '');
  TextEditingController stateController = TextEditingController(text: '');
  TextEditingController cityController = TextEditingController(text: '');
  TextEditingController districtController = TextEditingController(text: '');
  TextEditingController addressOneController = TextEditingController(text: '');
  TextEditingController addressTwoController = TextEditingController(text: '');
  TextEditingController dobController = TextEditingController(text: '');
  TextEditingController relationWithApplicantController = TextEditingController(text: '');

  void onPressContinue() {
    Get.to(() => GuradianDetailsPage(), binding: GuradianDetailsBinding());
  }
}

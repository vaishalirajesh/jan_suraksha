import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jan_suraksha/model/request_model/SaveFormDeatilRequest.dart' as request;
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/model/response_model/GetApplicationFormDetailsResponse.dart';
import 'package:jan_suraksha/model/response_model/GetMasterListResponse.dart';
import 'package:jan_suraksha/model/response_model/SaveFormDetailResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_view.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_view.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

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
  RxString screenName = ''.obs;

  @override
  void onInit() {
    screenName.value = Get.arguments[AppArguments.screenName] ?? '';
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
    if (firstNameController.text.trim().isEmpty ||
        !onlyCharRegExp.hasMatch(firstNameController.text) ||
        firstNameController.text == ' ') {
      fNameErrorMsg.value = 'Please enter valid name';
      relationErrorMsg.value = '';
      addressErrorMsg.value = '';
      emailErrorMsg.value = '';
      mobileErrorMsg.value = '';
    } else if (addressController.text.trim().isEmpty ||
        addressController.text.length < 2 ||
        specialCharExpStartChar.hasMatch(addressController.text.substring(0))) {
      fNameErrorMsg.value = '';
      relationErrorMsg.value = '';
      addressErrorMsg.value = 'Please enter valid address';
      emailErrorMsg.value = '';
      mobileErrorMsg.value = '';
      // !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0)) &&
      //     ((!mobileRegExp.hasMatch(mobileController.text) || mobileController.text.length != 10))
    } else if (relationshipGuardianId.value == 0) {
      fNameErrorMsg.value = '';
      relationErrorMsg.value = 'Please select relationship with the nominee';
      addressErrorMsg.value = '';
      emailErrorMsg.value = '';
      mobileErrorMsg.value = '';
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
      if (screenName.value == 'Service') {
        onSaveData();
      } else {
        Get.to(() => PreviewApplicationPage(), binding: PreviewApplicationBinding());
      }
    }
  }

  Future<void> onSaveData() async {
    if (await NetUtils.isInternetAvailable()) {
      saveData();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, saveData);
      }
    }
  }

  Future<void> saveData() async {
    isLoading.value = false;
    request.SaveFormDetailsRequest saveFormDetailRequest = request.SaveFormDetailsRequest(
      dob: getAppData.data?.dob,
      applicationId: getAppData.data?.id,
      address: request.RequestAddress(
        id: getAppData.data?.address?.id,
        addressLine1: getAppData.data?.address?.addressLine1,
        addressLine2: getAppData.data?.address?.addressLine2,
        city: getAppData.data?.address?.city,
        district: getAppData.data?.address?.district,
        isActive: getAppData.data?.address?.isActive,
        pincode: getAppData.data?.address?.pincode,
        state: getAppData.data?.address?.state,
      ),
      dedupErrorMsg: null,
      emailAddress: getAppData.data?.emailAddress,
      fatherHusbandName: getAppData.data?.fatherHusbandName,
      firstName: getAppData.data?.firstName,
      insuranceName: getAppData.data?.insuranceName,
      isNomineeDeatilsSameEnroll: getAppData.data?.isNomineeDeatilsSameEnroll,
      isNomineeUpdate: true,
      isSameApplicantAddress: getAppData.data?.isSameApplicantAddress,
      kycId1: getAppData.data?.kycId1,
      kycId1number: getAppData.data?.kycId1number,
      kycId2: getAppData.data?.kycId2,
      kycId2number: getAppData.data?.kycId2number,
      lastName: getAppData.data?.lastName,
      middleName: getAppData.data?.middleName,
      mobileNo: getAppData.data?.mobileNo,
      nominee: [
        request.RequestNominee(
          middleName: getAppData.data?.nominee?.first.middleName,
          lastName: getAppData.data?.nominee?.first.lastName,
          firstName: getAppData.data?.nominee?.first.firstName,
          isActive: getAppData.data?.nominee?.first.isActive,
          id: getAppData.data?.nominee?.first.id,
          addressOfGuardian: getAppData.data?.nominee?.first.addressOfGuardian,
          emailIdOfGuardian: getAppData.data?.nominee?.first.emailIdOfGuardian,
          mobileNumberOfGuardian: getAppData.data?.nominee?.first.mobileNumberOfGuardian,
          nameOfGuardian: getAppData.data?.nominee?.first.nameOfGuardian,
          relationShipOfGuardian: getAppData.data?.nominee?.first.relationShipOfGuardian,
          address: request.RequestAddress(
            id: getAppData.data?.nominee?.first.address?.id,
            addressLine1: getAppData.data?.nominee?.first.address?.addressLine1,
            addressLine2: getAppData.data?.nominee?.first.address?.addressLine2,
            city: getAppData.data?.nominee?.first.address?.city,
            district: getAppData.data?.nominee?.first.address?.district,
            isActive: getAppData.data?.nominee?.first.address?.isActive,
            pincode: getAppData.data?.nominee?.first.address?.pincode,
            state: getAppData.data?.nominee?.first.address?.state,
          ),
          mobileNumber: getAppData.data?.nominee?.first.mobileNumber,
          dateOfBirth: getAppData.data?.nominee?.first.dateOfBirth,
          emailIdOfNominee: getAppData.data?.nominee?.first.emailIdOfNominee,
          relationOfNomineeApplicant: getAppData.data?.nominee?.first.relationOfNomineeApplicant,
        ),
      ],
    );
    var jsonRequest = jsonEncode(saveFormDetailRequest.toJson());
    TGLog.d("SaveFormDetailRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SAVE_FORM_DETAIL);
    TGLog.d("SaveFormDetailRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().saveFormDetail(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessSaveData(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessSaveData(SaveFormDetailResponse response) async {
    TGLog.d("SaveFormDetailRequest : onSuccess()---$response");
    if (response.saveFormDetail().status == RES_SUCCESS) {
      isLoading.value = true;
      Get.back();
      Get.back();
    } else {
      TGLog.d("Error in SaveFormDetailResponse");
      isLoading.value = true;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.saveFormDetail().status ?? 0, response?.saveFormDetail()?.message ?? "", null);
    }
  }

  _onErrorSaveData(TGResponse errorResponse) {
    TGLog.d("SaveFormDetailRequest : onError()--${errorResponse.error}");
    isLoading.value = true;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

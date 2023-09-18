import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/Navigation_config.dart';
import 'package:jan_suraksha/model/request_model/CreateApplicationRequest.dart';
import 'package:jan_suraksha/model/request_model/UpdateEnrollmentVerificationTypeRequest.dart';
import 'package:jan_suraksha/model/request_model/VerifyOTPRequest.dart';
import 'package:jan_suraksha/model/response_main_model/CreateApplicationResponseMain.dart';
import 'package:jan_suraksha/model/response_model/CreateApplicationResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateEnrollmentVerificationTypeResponse.dart';
import 'package:jan_suraksha/model/response_model/VerifyOtpResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/view/widget/otp_bottom_sheet.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class CustomerVerificationLogic extends GetxController {
  TextEditingController accountTextController = TextEditingController();
  TextEditingController reAccountTextController = TextEditingController();
  TextEditingController dobTextController = TextEditingController();
  CreateApplicationResponseMain createApplicationResponseMain = CreateApplicationResponseMain();
  RxString accountErrorMsg = ''.obs;
  RxString reAccountErrorMsg = ''.obs;
  RxString dobErrorMsg = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isButtonEnabled = true.obs;

  final validCharacters = RegExp(r'^[0-9]+$');

  DateTime date = DateTime.now();
  String dob = '';
  RxString otp = ''.obs;

  Future selectDate() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    DateTime currentDate = DateTime.now();
    int firstDateYear = currentDate.year - 18;
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null) {
      date = picked;
      String month = getMonth(date.month);
      if (month.isNotEmpty && month.length > 4) {
        month = month.substring(0, 3);
      }
      accountErrorMsg.value = '';
      dobErrorMsg.value = '';
      reAccountErrorMsg.value = '';
      dobTextController.text = '${date.day}/${date.month}/${date.year}';
      dob = '$date';
    }
  }

  String getMonth(int month) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  void onChangeAccountNo(String? str) {
    accountErrorMsg.value = '';
    reAccountErrorMsg.value = '';
  }

  void onPressContinue() {
    onCustomerVerification();
    // var data = AesGcmEncryptionUtils.decryptNew(
    //     "WkZnZmJsdit0U1QvN1RJKzdBQ0lUcmtjcCtHYWhkTUd5azIxVVlMVk9FNklrTDc3RUdtT2VqUXErV1VBWGN6WC94VGpwV3RjdDYzRU13RlMrQW4yQ1JCdHl4d1N3MmlOeUhRUlAzWTFaZTBzcUtTOVJ4Mm9ZemVsL2dEYXYzemdWN0U9Ojo5NmQ2OGUxYWMyNDgxOGJl");
    //
    // TGLog.d('decryprt data--$data');
    return;

    if (!isLoading.value) {
      final validCharacters = RegExp(r'^[0-9]+$');
      if (accountTextController.text.isEmpty) {
        dobErrorMsg.value = '';
        reAccountErrorMsg.value = '';
        accountErrorMsg.value = 'Please enter account number';
      } else if (!validCharacters.hasMatch(accountTextController.text) || accountTextController.text.length < 9) {
        dobErrorMsg.value = '';
        reAccountErrorMsg.value = '';
        accountErrorMsg.value = 'Please enter valid account number';
      } else if (reAccountTextController.text.isEmpty || accountTextController.text != reAccountTextController.text) {
        reAccountErrorMsg.value = 'Confirm number not match with account number';
        dobErrorMsg.value = '';
        accountErrorMsg.value = '';
      } else if (dobTextController.text.isEmpty) {
        accountErrorMsg.value = '';
        reAccountErrorMsg.value = '';
        dobErrorMsg.value = 'Please select date of birth';
      } else {
        accountErrorMsg.value = '';
        dobErrorMsg.value = '';
        reAccountErrorMsg.value = '';
        onCustomerVerification();
        TGLog.d('API Call------');
      }
    }
  }

  Future<void> onCustomerVerification() async {
    if (await NetUtils.isInternetAvailable()) {
      createApplication();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, createApplication);
      }
    }
  }

  Future<void> createApplication() async {
    isLoading.value = true;
    CreateApplicationRequest createApplicationRequest = CreateApplicationRequest(
      dob: '2001-06-12T18:30:00.000Z',
      accountNo: '451421101',
      applicationId: null,
      orgId: '13',
      schemeId: '2',
      userId: '22',
    );
    var jsonRequest = jsonEncode(createApplicationRequest.toJson());
    TGLog.d("CreateApplicationRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_CREATE_APPLICATION);
    TGLog.d("CreateApplicationRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().createApplication(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessCreateApplication(response),
      onError: (error) => _onErrorCreateApplication(error),
    );
  }

  _onSuccessCreateApplication(CreateApplicationResponse response) async {
    TGLog.d("CreateApplicationRequest : onSuccess()---$response");
    createApplicationResponseMain = response.createApplicationResponse();
    if (response.createApplicationResponse().status == RES_SUCCESS) {
      TGSharedPreferences.getInstance().set(PREF_APP_ID, response.createApplicationResponse().data?.id);
      TGSharedPreferences.getInstance().set(PREF_ORG_ID, response.createApplicationResponse().data?.orgId);
      onUpdateVerification();
    } else {
      TGLog.d("Error in updateVerificationType");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response?.createApplicationResponse().status ?? 0,
          response?.createApplicationResponse()?.message ?? "", null);
    }
  }

  _onErrorCreateApplication(TGResponse errorResponse) {
    TGLog.d("CreateApplicationRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> onUpdateVerification() async {
    if (await NetUtils.isInternetAvailable()) {
      updateVerificationTypeRequest();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, updateVerificationTypeRequest);
      }
    }
  }

  Future<void> updateVerificationTypeRequest() async {
    var encryptId = AesGcmEncryptionUtils.encryptNew(createApplicationResponseMain.data?.id.toString() ?? '');
    var encryptType = AesGcmEncryptionUtils.encryptNew('1');
    UpdateEnrollmentVerificationTypeRequest updateEnrollmentVerificationTypeRequest =
        UpdateEnrollmentVerificationTypeRequest(id: encryptId, type: encryptType);
    ServiceManager.getInstance().updateEnrollmentVerificationType(
        request: updateEnrollmentVerificationTypeRequest,
        onSuccess: (response) => _onSuccessVerificationType(response),
        onError: (error) => _onErrorVerificationType(error));
  }

  _onSuccessVerificationType(UpdateEnrollmentVerificationTypeResponse response) async {
    TGLog.d("UpdateEnrollmentVerificationTypeRequest : onSuccess()---$response");
    if (response.updateEnrollmentVerificationType().status == RES_SUCCESS) {
      isLoading.value = false;
      OTPBottomSheet.getBottomSheet(
        context: Get.context!,
        onChangeOTP: (s) {
          otp.value = s;
          TGLog.d("Otp---------${otp.value}");
        },
        onSubmitOTP: (s) {
          otp.value = s;
        },
        mobileNumber: createApplicationResponseMain.data?.mobileNo ?? '',
        isEnable: true.obs,
        isLoading: isLoading,
        onButtonPress: onVerifyOTP,
      );
    } else {
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response?.updateEnrollmentVerificationType().status ?? 0,
          response?.updateEnrollmentVerificationType()?.message ?? "", null);
    }
  }

  _onErrorVerificationType(TGResponse errorResponse) {
    TGLog.d("UpdateEnrollmentVerificationTypeRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> onVerifyOTP() async {
    if (await NetUtils.isInternetAvailable()) {
      verifyOTP();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, verifyOTP);
      }
    }
  }

  Future<void> verifyOTP() async {
    isLoading.value = true;
    VerifyOtpRequest verifyOtpRequest = VerifyOtpRequest(
      applicationId: createApplicationResponseMain.data?.id,
      orgId: createApplicationResponseMain.data?.orgId,
      verifyOTP: otp.value,
    );
    var jsonRequest = jsonEncode(verifyOtpRequest.toJson());
    TGLog.d("VerifyOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_VERIFY_OTP);
    TGLog.d("VerifyOtpRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().verifyOTP(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessVerifyOTP(response),
      onError: (error) => _onErrorVerifyOTP(error),
    );
  }

  _onSuccessVerifyOTP(VerifyOTPResponse response) async {
    TGLog.d("VerifyOtpRequest : onSuccess()---$response");
    if (response.verifyOTP().status == RES_SUCCESS) {
      isLoading.value = false;
      TGSession.getInstance().set(PREF_ACCOUNT_HOLDER_DATA, json.encode(response.verifyOTP()));
      Get.toNamed(AccountSelectionPageRoute);
    } else {
      TGLog.d("Error in updateVerificationType");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.verifyOTP().status ?? 0, response?.verifyOTP()?.message ?? "", null);
    }
  }

  _onErrorVerifyOTP(TGResponse errorResponse) {
    TGLog.d("VerifyOtpRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

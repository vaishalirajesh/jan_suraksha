import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/UpdateStageRequest.dart';
import 'package:jan_suraksha/model/request_model/VerifyOTPRequest.dart';
import 'package:jan_suraksha/model/response_main_model/CreateApplicationResponseMain.dart';
import 'package:jan_suraksha/model/response_model/CreateApplicationResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateEnrollmentVerificationTypeResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateStageResponse.dart';
import 'package:jan_suraksha/model/response_model/VerifyOtpResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/mock/mock_service.dart';
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
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/otp_bottom_sheet.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

import '../../../../config/Navigation_config.dart';
import '../../../../model/request_model/CreateApplicationRequest.dart';
import '../../../../model/request_model/UpdateEnrollmentVerificationTypeRequest.dart';

class CustomerVerificationLogic extends GetxController {
  TextEditingController accountTextController = TextEditingController(text: '');
  TextEditingController reAccountTextController = TextEditingController(text: '');
  TextEditingController dobTextController = TextEditingController();
  CreateApplicationResponseMain createApplicationResponseMain = CreateApplicationResponseMain();
  RxString accountErrorMsg = ''.obs;
  RxString reAccountErrorMsg = ''.obs;
  RxString dobErrorMsg = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isOtpVerifying = false.obs;
  RxBool isButtonEnabled = true.obs;
  RxBool isEnableMobileOtpResend = false.obs;
  final validCharacters = RegExp(r'^[0-9]+$');

  DateTime date = DateTime.now();
  String dob = '';
  RxString otp = ''.obs;
  RxString otpError = ''.obs;

  var appId;
  var schemeId;

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
      var dateTime = AppUtils.convertDateFormat('$date', 'yyyy-MM-dd hh:mm:ss.SSSSSS', 'yyyy-MM-ddThh:mm:ss.000Z');
      TGLog.d("Date----$dateTime");
      dob = AppUtils.convertDateFormat('$date', 'yyyy-MM-dd hh:mm:ss.SSSSSS', 'yyyy-MM-ddThh:mm:ss.000Z');
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

  @override
  Future<void> onInit() async {
    appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID);
    schemeId = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID);
    super.onInit();
  }

  void onChangeAccountNo(String? str) {
    if (accountTextController.text.isEmpty) {
      accountErrorMsg.value = 'Please enter account number';
    } else if (accountTextController.text.length < 3 || !validCharacters.hasMatch(accountTextController.text)) {
      accountErrorMsg.value = 'Please enter valid account number';
    } else if (accountTextController.text.length > 17) {
      accountErrorMsg.value = 'Please enter valid account number';
    } else {
      accountErrorMsg.value = '';
    }
  }

  void onChangeReAccountNo(String? str) {
    if (reAccountTextController.text.isEmpty) {
      reAccountErrorMsg.value = 'Please enter confirm account number';
    } else if (reAccountTextController.text.length < 3 || !validCharacters.hasMatch(reAccountTextController.text)) {
      reAccountErrorMsg.value = 'Please enter valid confirm account number';
    } else if (reAccountTextController.text.length > 17) {
      reAccountErrorMsg.value = 'Please enter valid confirm account number';
    } else {
      reAccountErrorMsg.value = '';
    }
  }

  void onPressContinue() {
    if (!isLoading.value) {
      // final validCharacters = RegExp(r'^[0-3]+$');
      if (accountTextController.text.isEmpty) {
        accountErrorMsg.value = 'Please enter account number';
      } else if (accountTextController.text.length < 3 || !validCharacters.hasMatch(accountTextController.text)) {
        accountErrorMsg.value = 'Please enter valid account number';
      } else if (accountTextController.text.length > 17) {
        accountErrorMsg.value = 'Please enter valid account number';
      } else if (reAccountTextController.text.isEmpty || accountTextController.text != reAccountTextController.text) {
        reAccountErrorMsg.value = 'Re-enter account number does not match';
      } else if (dobTextController.text.isEmpty) {
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
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (await NetUtils.isInternetAvailable()) {
      createApplication();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, createApplication);
      }
    }
  }

  Future<void> createApplication() async {
    var orgId = await TGSharedPreferences.getInstance().get(PREF_ORG_ID);
    var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
    isLoading.value = true;
    CreateApplicationRequest createApplicationRequest = CreateApplicationRequest(
      dob: dob,
      accountNo: accountTextController.text,
      applicationId: null,
      orgId: orgId.toString(),
      schemeId: schemeId.toString(),
      userId: userId.toString(),
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
      appId = response.createApplicationResponse().data?.id;
      TGSharedPreferences.getInstance().set(PREF_APP_ID, response.createApplicationResponse().data?.id);
      updateStage();
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

  Future<void> updateStage() async {
    if (await NetUtils.isInternetAvailable()) {
      updateStageDeatil();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, updateStageDeatil);
      }
    }
  }

  Future<void> updateStageDeatil() async {
    isLoading.value = true;
    UpdateStageRequest updateStageRequest = UpdateStageRequest(applicationId: appId, stageId: 2);
    var jsonRequest = jsonEncode(updateStageRequest.toJson());
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_UPDATE_STAGE);
    TGLog.d("UpdateStageRequest Decrypt:--------$tgPostRequest");
    ServiceManager.getInstance().updateApplicationStage(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessUpdateStage(response),
      onError: (error) => _onErrorUpdateStage(error),
    );
  }

  _onSuccessUpdateStage(UpdateStageResponse response) async {
    TGLog.d("UpdateStageRequest : onSuccess()---$response");
    if (response.updateApplicationStage().status == RES_SUCCESS) {
      onUpdateVerification();
    } else {
      TGLog.d("Error in UpdateStageRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response.updateApplicationStage().status ?? 0,
          response.updateApplicationStage().message ?? "", null);
    }
  }

  _onErrorUpdateStage(TGResponse errorResponse) {
    TGLog.d("UpdateStageRequest : onError()--${errorResponse.error}");
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
    if (TGMockService.applyMock) {
      var encryptId = "1";
      var encryptType = "1";
      UpdateEnrollmentVerificationTypeRequest updateEnrollmentVerificationTypeRequest =
          UpdateEnrollmentVerificationTypeRequest(id: encryptId, type: encryptType);
      ServiceManager.getInstance().updateEnrollmentVerificationType(
          request: updateEnrollmentVerificationTypeRequest,
          onSuccess: (response) => _onSuccessVerificationType(response),
          onError: (error) => _onErrorVerificationType(error));
    } else {
      var encryptId = AesGcmEncryptionUtils.encryptNew(createApplicationResponseMain.data?.id.toString() ?? '');
      var encryptType = AesGcmEncryptionUtils.encryptNew('1');
      UpdateEnrollmentVerificationTypeRequest updateEnrollmentVerificationTypeRequest =
          UpdateEnrollmentVerificationTypeRequest(id: encryptId, type: encryptType);
      ServiceManager.getInstance().updateEnrollmentVerificationType(
          request: updateEnrollmentVerificationTypeRequest,
          onSuccess: (response) => _onSuccessVerificationType(response),
          onError: (error) => _onErrorVerificationType(error));
    }
  }

  _onSuccessVerificationType(UpdateEnrollmentVerificationTypeResponse response) async {
    TGLog.d("UpdateEnrollmentVerificationTypeRequest : onSuccess()---$response");
    if (response.updateEnrollmentVerificationType().status == RES_SUCCESS) {
      isLoading.value = false;
      isEnableMobileOtpResend.value = false;
      OTPBottomSheet.getBottomSheet1(
        context: Get.context!,
        onChangeOTP: (s) {
          if (s.isEmpty) {
            otp.value = otp.value.substring(0, otp.value.length - 1);
          } else {
            otp.value = otp.value + s;
          }
          otpError.value = '';
        },
        onSubmitOTP: (s) {
          otp.value = otp.value + s;
          otpError.value = '';
        },
        isForBank: true,
        title: '',
        subTitle: '',
        mobileNumber: response.updateEnrollmentVerificationType().data?.mobileNumber ?? '',
        isEnable: isEnableMobileOtpResend,
        isLoading: isOtpVerifying,
        onButtonPress: onVerifyOTP,
        errorText: otpError,
        onFinish: onFinishEmailOtpTimer,
        onResend: onResendEmailOtpTimer,
      );
    } else {
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response?.updateEnrollmentVerificationType().status ?? 0,
          response?.updateEnrollmentVerificationType()?.message ?? "", null);
    }
  }

  Future<void> onFinishEmailOtpTimer() async {
    isEnableMobileOtpResend.value = true;
  }

  Future<void> onResendEmailOtpTimer() async {
    Get.back();
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    isEnableMobileOtpResend.value = false;
    onCustomerVerification();
  }

  _onErrorVerificationType(TGResponse errorResponse) {
    TGLog.d("UpdateEnrollmentVerificationTypeRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> onVerifyOTP() async {
    if (otp.value.length != 6 || !validCharacters.hasMatch(otp.value)) {
      otpError.value = 'Please enter valid verification code';
      return;
    } else {
      otpError.value = '';
      if (await NetUtils.isInternetAvailable()) {
        verifyOTP();
      } else {
        if (Get.context!.mounted) {
          showSnackBarForintenetConnection(Get.context!, verifyOTP);
        }
      }
    }
  }

  Future<void> verifyOTP() async {
    isOtpVerifying.value = true;
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
      TGSession.getInstance().set(PREF_ACCOUNT_HOLDER_DATA, json.encode(response.verifyOTP()));
      updateStageDeatilAfterOTPVerify();
    } else if (response.verifyOTP().status == RES_UNAUTHORISED) {
      otpError.value = "Please enter valid verification code";
      isOtpVerifying.value = false;
    } else {
      TGLog.d("Error in updateVerificationType");
      isOtpVerifying.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.verifyOTP().status ?? 0, response?.verifyOTP()?.message ?? "", null);
    }
  }

  _onErrorVerifyOTP(TGResponse errorResponse) {
    TGLog.d("VerifyOtpRequest : onError()--${errorResponse.error}");
    isOtpVerifying.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> updateStageDeatilAfterOTPVerify() async {
    UpdateStageRequest updateStageRequest = UpdateStageRequest(applicationId: appId, stageId: 3);
    var jsonRequest = jsonEncode(updateStageRequest.toJson());
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_UPDATE_STAGE);
    TGLog.d("UpdateStageRequest Decrypt:--------$tgPostRequest");
    ServiceManager.getInstance().updateApplicationStage(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessUpdateStageAfterOTPVerify(response),
      onError: (error) => _onErrorUpdateStage(error),
    );
  }

  _onSuccessUpdateStageAfterOTPVerify(UpdateStageResponse response) async {
    TGLog.d("UpdateStageRequest : onSuccess()---$response");
    if (response.updateApplicationStage().status == RES_SUCCESS) {
      Get.toNamed(AccountSelectionPageRoute);
    } else {
      TGLog.d("Error in UpdateStageRequest");
      isLoading.value = false;
      isOtpVerifying.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response.updateApplicationStage().status ?? 0,
          response.updateApplicationStage().message ?? "", null);
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/OptOUtConsent.dart';
import 'package:jan_suraksha/model/request_model/PreminumDeductionRequest.dart';
import 'package:jan_suraksha/model/request_model/TermConitionRequest.dart';
import 'package:jan_suraksha/model/request_model/UpdateStageRequest.dart';
import 'package:jan_suraksha/model/request_model/VerifySignupOtpRequest.dart';
import 'package:jan_suraksha/model/response_main_model/LoginResponseMainModel.dart';
import 'package:jan_suraksha/model/response_model/GetTermConditionResponse.dart';
import 'package:jan_suraksha/model/response_model/OTPResponse.dart';
import 'package:jan_suraksha/model/response_model/PreminumDeductionResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateStageResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/utils/showcustomesnackbar.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/journey/consent_success/consent_success_binding.dart';
import 'package:jan_suraksha/view/screen/journey/consent_success/consent_success_view.dart';
import 'package:jan_suraksha/view/widget/otp_bottom_sheet.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';
import 'package:webviewx/webviewx.dart';

class TermsAndConditionsLogic extends GetxController {
  RxString otp = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isDataLoaded = false.obs;
  RxBool isErrorInLoadData = false.obs;
  RxBool isOTPVerifying = false.obs;
  var appId;
  LoginResponseMainModel userData = LoginResponseMainModel();
  String content = '';
  RxString otpError = ''.obs;
  var mobile;
  late WebViewXController webViewXController;
  RxBool isEnableMobileOtpResend = false.obs;
  String email = '';

  @override
  Future<void> onInit() async {
    // userData = await TGSharedPreferences.getInstance().get(PREF_LOGIN_RES);
    mobile = await TGSharedPreferences.getInstance().get(PREF_MOBILE);
    appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID);
    getConsentData();

    super.onInit();
  }

  Future<void> getConsentData() async {
    if (await NetUtils.isInternetAvailable()) {
      getData();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getData);
      }
    }
  }

  Future<void> loadData() async {}

  Future<void> getData() async {
    isDataLoaded.value = false;
    var appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID) ?? 0;
    TGLog.d("ApplicationId-------$appId");
    var encUserId = AesGcmEncryptionUtils.encryptNew(appId.toString());
    TermConditionRequest termConditionRequest = TermConditionRequest(id: encUserId);
    ServiceManager.getInstance().getTermConition(
      request: termConditionRequest,
      onSuccess: (response) => _onSuccessTermCondition(response),
      onError: (error) => _onErrorTermCondition(error),
    );
  }

  _onSuccessTermCondition(TermConitionResponse response) async {
    TGLog.d("TermConditionRequest : onSuccess()---$response");
    if (response.getTermConition().status == RES_SUCCESS) {
      content = response.getTermConition().data ?? '';
      TGLog.d(content);
      Future.delayed(const Duration(seconds: 1), () {
        isDataLoaded.value = true;
      });
    } else {
      TGLog.d("Error in TermConditionRequest");
      isDataLoaded.value = true;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getTermConition().status ?? 0, response.getTermConition().message ?? "", null);
    }
  }

  _onErrorTermCondition(TGResponse errorResponse) {
    TGLog.d("TermConditionRequest : onError()--${errorResponse.error}");
    isDataLoaded.value = true;
    isErrorInLoadData.value = true;
    showSnackBar(Get.context!, "Error in fetch terms and condition");
    // handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> onPressButton(BuildContext context) async {
    otp.value = '';
    otpError.value = '';
    String subTitle = email.isNotEmpty
        ? "An verification code has been sent to your registered mobile number ${AppUtils.getMaskedMobileNumber(mobileNumber: mobile)} and email address ${AppUtils.getMaskedMobileNumber(mobileNumber: email)}"
        : "An verification code has been sent to your registered mobile number ${AppUtils.getMaskedMobileNumber(mobileNumber: mobile)}";
    isEnableMobileOtpResend.value = false;
    OTPBottomSheet.getBottomSheet(
      context: context,
      title: '',
      subTitle: subTitle,
      onChangeOTP: onChangeOTP,
      onSubmitOTP: onSubmitOTP,
      mobileNumber: mobile,
      isEnable: isEnableMobileOtpResend,
      isLoading: isOTPVerifying,
      onButtonPress: verifyOTP,
      errorText: otpError,
      onFinish: onFinishEmailOtpTimer,
      onResend: onResendEmailOtpTimer,
    );
  }

  Future<void> onFinishEmailOtpTimer() async {
    isEnableMobileOtpResend.value = true;
  }

  Future<void> onResendEmailOtpTimer() async {
    Get.back();
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    isEnableMobileOtpResend.value = false;
    sendOTP();
  }

  void onChangeOTP(String s) {
    if (s.isEmpty) {
      otp.value = otp.value.substring(0, otp.value.length - 1);
    } else {
      otp.value = otp.value + s;
    }
    otpError.value = '';
  }

  void onSubmitOTP(String str) {
    otp.value = otp.value + str;
    otpError.value = '';
  }

  void onPressContinue() {
    if (!isErrorInLoadData.value) {
      sendOTP();
    } else {
      showSnackBar(Get.context!, "Something went wrong");
    }
  }

  Future<void> onSubmit() async {
    if (await NetUtils.isInternetAvailable()) {
      iAgree();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, iAgree);
      }
    }
  }

  Future<void> sendOTP() async {
    isLoading.value = true;
    var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
    email = await TGSharedPreferences.getInstance().get(PREF_USER_EMAIL) ?? '';
    var schemeId = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID) ?? num.parse('0');
    OptOUtConsentRequest consentOtpSendRequest = OptOUtConsentRequest(
      mobile: mobile,
      userId: userId,
      email: email == '' ? null : email,
      schemeId: num.parse(schemeId.toString()),
      otpType: 3,
      emailNotiMasterId: 15,
      smsNotiMasterId: 20,
    );
    var jsonRequest = jsonEncode(consentOtpSendRequest.toJson());
    TGLog.d("ConsentOtpSendRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_CONSENT_GET_OTP);
    TGLog.d("ConsentOtpSendRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().otpRequest(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessSendOTP(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessSendOTP(OTPResponse response) async {
    TGLog.d("ConsentOtpSendRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      isLoading.value = false;
      onPressButton(Get.context!);
    } else {
      TGLog.d("Error in ConsentOtpSendRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  Future<void> verifyOTP() async {
    isOTPVerifying.value = true;
    var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
    var mobile = await TGSharedPreferences.getInstance().get(PREF_MOBILE);
    VerifySignupOtpRequest verifySignupOtpRequest =
        VerifySignupOtpRequest(mobile: mobile, otpType: 3, userId: userId, otp: otp.value);
    var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
    TGLog.d("ConsentOtpVerifyRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_CONSENT_VERIFY_OTP);
    TGLog.d("ConsentOtpVerifyRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().otpRequest(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessVerifyOTP(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessVerifyOTP(OTPResponse response) async {
    TGLog.d("ConsentOtpVerifyRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      onSubmit();
    } else {
      TGLog.d("Error in ConsentOtpVerifyRequest");
      isOTPVerifying.value = false;
      otpError.value = response.getOtpResponse().message ?? "";
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  Future<void> iAgree() async {
    isOTPVerifying.value = true;
    var appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID) ?? 0;
    var schemeId = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID) ?? 0;
    PremiumDeductionRequest premiumDeductionRequest =
        PremiumDeductionRequest(applicationId: appId.toString(), schemeId: schemeId.toString());
    var jsonRequest = jsonEncode(premiumDeductionRequest.toJson());
    TGLog.d("PremiumDeductionRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_PREMIUM_DEDUCTION);
    TGLog.d("PremiumDeductionRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().premiumDeduction(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessSaveData(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessSaveData(PremiumDeductionResponse response) async {
    TGLog.d("PremiumDeductionRequest : onSuccess()---$response");
    if (response.PremiumDeduction().status == RES_SUCCESS) {
      updateStage();
    } else {
      TGLog.d("Error in PremiumDeductionResponse");
      isOTPVerifying.value = false;
      Get.back();
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.PremiumDeduction().status ?? 0, response?.PremiumDeduction()?.message ?? "", null);
    }
  }

  _onErrorSaveData(TGResponse errorResponse) {
    Get.back();
    TGLog.d("PremiumDeductionRequest : onError()--${errorResponse.error}");
    isOTPVerifying.value = false;
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
    UpdateStageRequest updateStageRequest = UpdateStageRequest(applicationId: appId, stageId: 5);
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
      updateStageDeatilAfterOTPVerify();
    } else {
      TGLog.d("Error in UpdateStageRequest");
      Get.back();
      isOTPVerifying.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response.updateApplicationStage().status ?? 0,
          response.updateApplicationStage().message ?? "", null);
    }
  }

  _onErrorUpdateStage(TGResponse errorResponse) {
    TGLog.d("UpdateStageRequest : onError()--${errorResponse.error}");
    Get.back();
    isOTPVerifying.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> updateStageDeatilAfterOTPVerify() async {
    UpdateStageRequest updateStageRequest = UpdateStageRequest(applicationId: appId, stageId: 6);
    var jsonRequest = jsonEncode(updateStageRequest.toJson());
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_UPDATE_STAGE);
    TGLog.d("updateStageDeatilAfterOTPVerify Decrypt:--------$tgPostRequest");
    ServiceManager.getInstance().updateApplicationStage(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessUpdateStageAfterOTPVerify(response),
      onError: (error) => _onErrorUpdateStage(error),
    );
  }

  _onSuccessUpdateStageAfterOTPVerify(UpdateStageResponse response) async {
    TGLog.d("updateStageDeatilAfterOTPVerify : onSuccess()---$response");
    if (response.updateApplicationStage().status == RES_SUCCESS) {
      isOTPVerifying.value = false;
      Get.to(() => const ConsentSuccessPage(), binding: ConsentSuccessBinding());
    } else {
      TGLog.d("Error in updateStageDeatilAfterOTPVerify");
      isOTPVerifying.value = false;
      Get.back();
      LoaderUtils.handleErrorResponse(Get.context!, response.updateApplicationStage().status ?? 0,
          response.updateApplicationStage().message ?? "", null);
    }
  }
}

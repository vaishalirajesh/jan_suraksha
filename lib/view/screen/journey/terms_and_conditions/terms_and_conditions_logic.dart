import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/ConsentOTPSendRequest.dart';
import 'package:jan_suraksha/model/request_model/ConsentOTPVerifyRequest.dart';
import 'package:jan_suraksha/model/request_model/PreminumDeductionRequest.dart';
import 'package:jan_suraksha/model/request_model/UpdateStageRequest.dart';
import 'package:jan_suraksha/model/response_main_model/LoginResponseMainModel.dart';
import 'package:jan_suraksha/model/response_model/OTPResponse.dart';
import 'package:jan_suraksha/model/response_model/PreminumDeductionResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateStageResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
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
import 'package:jan_suraksha/view/screen/journey/consent_success/consent_success_binding.dart';
import 'package:jan_suraksha/view/screen/journey/consent_success/consent_success_view.dart';
import 'package:jan_suraksha/view/widget/otp_bottom_sheet.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class TermsAndConditionsLogic extends GetxController {
  RxString otp = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isOTPVerifying = false.obs;
  var appId;
  LoginResponseMainModel userData = LoginResponseMainModel();

  @override
  Future<void> onInit() async {
    // userData = await TGSharedPreferences.getInstance().get(PREF_LOGIN_RES);
    appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID);
    super.onInit();
  }

  void onPressButton(BuildContext context) {
    OTPBottomSheet.getBottomSheet(
      context: context,
      onChangeOTP: onChangeOTP,
      onSubmitOTP: onSubmitOTP,
      mobileNumber: '1234567890',
      isEnable: true.obs,
      isLoading: isOTPVerifying,
      onButtonPress: verifyOTP,
    );
  }

  void onChangeOTP(String str) {
    otp.value = str;
  }

  void onSubmitOTP(String str) {
    otp.value = str;
  }

  void onPressContinue() {
    sendOTP();
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
    ConsentOtpSendRequest consentOtpSendRequest = ConsentOtpSendRequest(
      firstName: 'Vaishali',
      lastName: 'Patel',
      middleName: 'Rajesh',
      userType: '1',
      email: 'paresh.ibo@opl.com',
      isTermsAccepted: true,
      otpRequestType: 5,
    );
    var jsonRequest = jsonEncode(consentOtpSendRequest.toJson());
    TGLog.d("ConsentOtpSendRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_OTP);
    TGLog.d("ConsentOtpSendRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().consentOtpSend(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessSendOTP(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessSendOTP(OTPResponse response) async {
    TGLog.d("ConsentOtpSendRequest : onSuccess()---$response");
    if (response.consentOtpSend().status == RES_SUCCESS) {
      isLoading.value = false;
      onPressButton(Get.context!);
    } else {
      TGLog.d("Error in ConsentOtpSendRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.consentOtpSend().status ?? 0, response.consentOtpSend().message ?? "", null);
    }
  }

  Future<void> verifyOTP() async {
    isOTPVerifying.value = true;
    ConsentOtpVerifyRequest consentOtpSendRequest = ConsentOtpVerifyRequest(
      userType: 2,
      email: 'paresh.ibo@opl.com',
      otp: '123456',
      otpRequestType: 5,
    );
    var jsonRequest = jsonEncode(consentOtpSendRequest.toJson());
    TGLog.d("ConsentOtpVerifyRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_OTP);
    TGLog.d("ConsentOtpVerifyRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().consentOtpSend(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessVerifyOTP(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessVerifyOTP(OTPResponse response) async {
    TGLog.d("ConsentOtpVerifyRequest : onSuccess()---$response");
    if (response.consentOtpSend().status == RES_SUCCESS) {
      onSubmit();
    } else {
      TGLog.d("Error in ConsentOtpVerifyRequest");
      isOTPVerifying.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.consentOtpSend().status ?? 0, response.consentOtpSend().message ?? "", null);
    }
  }

  Future<void> iAgree() async {
    isOTPVerifying.value = true;
    var appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID) ?? '';
    var schemeId = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID) ?? '1';
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
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.PremiumDeduction().status ?? 0, response?.PremiumDeduction()?.message ?? "", null);
    }
  }

  _onErrorSaveData(TGResponse errorResponse) {
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
      isOTPVerifying.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response.updateApplicationStage().status ?? 0,
          response.updateApplicationStage().message ?? "", null);
    }
  }

  _onErrorUpdateStage(TGResponse errorResponse) {
    TGLog.d("UpdateStageRequest : onError()--${errorResponse.error}");
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
      LoaderUtils.handleErrorResponse(Get.context!, response.updateApplicationStage().status ?? 0,
          response.updateApplicationStage().message ?? "", null);
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/PreminumDeductionRequest.dart';
import 'package:jan_suraksha/model/response_model/PreminumDeductionResponse.dart';
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
  // termsAndConditionsLogic.onPressButton(context);

  void onPressButton(BuildContext context) {
    OTPBottomSheet.getBottomSheet(
      context: context,
      onChangeOTP: onChangeOTP,
      onSubmitOTP: onSubmitOTP,
      mobileNumber: '1234567890',
      isEnable: true.obs,
      isLoading: false.obs,
      onButtonPress: onPressContinue,
    );
  }

  void onChangeOTP(String str) {
    otp.value = str;
  }

  void onSubmitOTP(String str) {
    otp.value = str;
  }

  void onPressContinue() {
    onSubmit();
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

  Future<void> iAgree() async {
    isLoading.value = true;
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
      isLoading.value = false;
      Get.to(() => const ConsentSuccessPage(), binding: ConsentSuccessBinding());
    } else {
      TGLog.d("Error in PremiumDeductionResponse");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.PremiumDeduction().status ?? 0, response?.PremiumDeduction()?.message ?? "", null);
    }
  }

  _onErrorSaveData(TGResponse errorResponse) {
    TGLog.d("PremiumDeductionRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/LoginRequest.dart';
import 'package:jan_suraksha/model/response_model/LoginResponse.dart';
import 'package:jan_suraksha/services/common/app_functions.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/session_constant.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/auth/verify_otp/verify_otp_binding.dart';
import 'package:jan_suraksha/view/screen/auth/verify_otp/verify_otp_view.dart';

class LoginLogic extends GetxController {
  TextEditingController mobileController = TextEditingController(text: '');
  RxString mobile = ''.obs;
  RxString errorMsg = ''.obs;
  RxBool isLoading = false.obs;

  void onChangeMobile(String? str) {
    errorMsg.value = '';
    mobile.value = mobileController.text;
  }

  Future<void> onPressSentOTP() async {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    if (!isLoading.value) {
      final validCharacters = RegExp(r'^[0-9]+$');
      if (mobileController.text.length == 10 && validCharacters.hasMatch(mobileController.text)) {
        errorMsg.value = '';
        if (await NetUtils.isInternetAvailable()) {
          loginRequest();
        } else {
          if (Get.context!.mounted) {
            showSnackBarForintenetConnection(Get.context!, loginRequest);
          }
        }
      } else {
        errorMsg.value = 'Please enter valid mobile number';
      }
      TGLog.d('Errormsg--------${errorMsg.value}');
    }
  }

  Future<void> loginRequest() async {
    isLoading.value = true;
    TGSession.getInstance().set(SESSION_MOBILENUMBER, mobileController.text);
    LoginRequest loginRequest = LoginRequest(
      email: 'paresh.bo@opl.com',
      password: 'Admin@123',
      browserName: 'chorme',
      browserVersion: '123.00',
      device: "smasung",
      deviceOs: 'windows',
      deviceOsVersion: 'windows-10',
      deviceType: 'desktop',
      userAgent:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
      userType: '2',
    );
    var jsonRequest = jsonEncode(loginRequest.toJson());
    TGLog.d("Auto Login Request $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_LOGIN);
    ServiceManager.getInstance().loginRequest(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessAutoLogin(response),
        onError: (error) => _onErrorAutoLogin(error));
  }

  _onSuccessAutoLogin(LoginResponse response) async {
    TGLog.d("LoginRequest : onSuccess()---$response");
    if (response.getLoginResponseData().status == RES_SUCCESS) {
      AppUtils.setAccessToken(response.getLoginResponseData().accessToken);
      TGSharedPreferences.getInstance().set(PREF_MOBILE, mobileController.text);
      setAccessTokenInRequestHeader();
      isLoading.value = false;
      Get.offAll(
        () => const VerifyOtpPage(),
        binding: VerifyOtpBinding(),
        arguments: {
          AppArguments.mobileNumber: mobile.value,
        },
      );
    } else {
      TGLog.d("Error in login");
      isLoading.value = false;

      // LoaderUtils.handleErrorResponse(Get.context!, response?.getLoginResponseData().status ?? 0,
      //     response?.getLoginResponseData()?.message ?? "", null);
    }
  }

  _onErrorAutoLogin(TGResponse errorResponse) {
    TGLog.d("LoginRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

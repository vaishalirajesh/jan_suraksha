import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/LoginRequest.dart';
import 'package:jan_suraksha/model/response_model/LoginResponse.dart';
import 'package:jan_suraksha/services/common/app_functions.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
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
import 'package:jan_suraksha/view/screen/journey/customer_verification/customer_verification_binding.dart';
import 'package:jan_suraksha/view/screen/journey/customer_verification/customer_verification_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

import '../../../../model/response_main_model/GenerateCaptchaResponse.dart';
import '../../../../services/request/EmptyGetRequest.dart';
import '../../../../services/request/tg_post_request.dart';

class LoginLogic extends GetxController {
  TextEditingController mobileController = TextEditingController(text: '');
  RxString mobile = ''.obs;
  RxString errorMsg = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isMobilenumber = false.obs;
  RxString captchaString = "".obs;

  var passwordController = TextEditingController(text: "");

  var isButtonEnabled = false.obs;

  var captchaController = TextEditingController(text: "");

  String? captchaTrueValue = "";

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 10)).then((value) {
      getcaptcha();
    });

    super.onInit();
  }

  void onChangeMobile(String? str) {
    if (_isNumeric(str!)) {
      isMobilenumber.value = true;
      print(true);
    } else {
      print(false);
      isMobilenumber.value = false;
    }
    errorMsg.value = '';
    mobile.value = mobileController.text;
    update();
  }

  Future<void> onPressSentOTP() async {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    if (!isLoading.value) {
      final validCharacters = RegExp(r'^[0-9]+$');
      errorMsg.value = '';

      if (await NetUtils.isInternetAvailable()) {
        loginRequest();
      } else {
        if (Get.context!.mounted) {
          showSnackBarForintenetConnection(Get.context!, loginRequest);
        }
      }

      // Get.to(
      //   () => const VerifyOtpPage(),
      //   binding: VerifyOtpBinding(),
      //   arguments: {
      //     AppArguments.mobileNumber: mobile.value,
      //   },
      // );
    } else {
      errorMsg.value = 'Please enter valid mobile number';
    }
    TGLog.d('Errormsg--------${errorMsg.value}');
  }

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  getcaptcha() {
    ServiceManager.getInstance().getCaptcha(request: EmptyTgGetRequest(), onSuccess: (response) => _onsuccsessCaptchGet(response), onError: (response) => _onErrorResponse(response));
  }

  Future<void> loginRequest() async {
    isLoading.value = true;
    LoginRequest loginRequest = LoginRequest(
      email: 'paresh.ibo@opl.com',
      password: 'Admin@123',
      browserName: 'chorme',
      browserVersion: '123.00',
      device: "smasung",
      deviceOs: 'windows',
      deviceOsVersion: 'windows-10',
      deviceType: 'desktop',
      userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
      userType: '2',
    );
    var jsonRequest = jsonEncode(loginRequest.toJson());
    TGLog.d("Auto Login Request $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_LOGIN);
    ServiceManager.getInstance().loginRequest(request: tgPostRequest, onSuccess: (response) => _onSuccessAutoLogin(response), onError: (error) => _onErrorAutoLogin(error));
  }

  _onSuccessAutoLogin(LoginResponse response) async {
    TGLog.d("LoginRequest : onSuccess()---$response");
    if (response.getLoginResponseData().status == RES_SUCCESS) {
      AppUtils.setAccessToken(response.getLoginResponseData().accessToken);
      TGSharedPreferences.getInstance().set(PREF_MOBILE, response.getLoginResponseData().mobile);
      TGSharedPreferences.getInstance().set(PREF_REFRESHTOKEN, response.getLoginResponseData().refreshToken);
      TGSharedPreferences.getInstance().set(PREF_LOGIN_TOKEN, response.getLoginResponseData().loginToken.toString());
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded = stringToBase64.encode(response.getLoginResponseData().userName ?? '');
      TGSharedPreferences.getInstance().set(PREF_LOGIN_USERNAME, encoded);
      TGSharedPreferences.getInstance().set(PREF_MOBILE, response.getLoginResponseData().mobile);
      TGSharedPreferences.getInstance().set(PREF_LOGIN_RES, json.encode(response.getLoginResponseData()));
      TGSession.getInstance().set(SESSION_MOBILENUMBER, response.getLoginResponseData().mobile);
      setAccessTokenInRequestHeader();
      isLoading.value = false;
      // Get.offAll(
      //   () => const VerifyOtpPage(),
      //   binding: VerifyOtpBinding(),
      //   arguments: {
      //     AppArguments.mobileNumber: mobile.value,
      //   },
      // );
      Get.to(
        () => CustomerVerificationPage(),
        binding: CustomerVerificationBinding(),
        arguments: {
          AppArguments.mobileNumber: mobile.value,
        },
      );
    } else {
      TGLog.d("Error in login");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response?.getLoginResponseData().status ?? 0, response?.getLoginResponseData()?.message ?? "", null);
    }
  }

  _onErrorAutoLogin(TGResponse errorResponse) {
    TGLog.d("LoginRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  _onsuccsessCaptchGet(GenerateCaptchaResponse response) {
    print(response);
    captchaString.value = response.verifyOTP().data?.bytes ?? "";
    captchaTrueValue = response.verifyOTP().data?.captchaString;
  }

  _onErrorResponse(response) {}

  void onChangeCaptcha(String p1) {
    if (p1 == captchaTrueValue) {
      isButtonEnabled.value = true;
    }
  }
}

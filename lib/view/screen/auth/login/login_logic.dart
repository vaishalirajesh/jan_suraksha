import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/LoginRequest.dart';
import 'package:jan_suraksha/model/request_model/LoginWithMobileRequest.dart';
import 'package:jan_suraksha/model/response_model/LoginResponse.dart';
import 'package:jan_suraksha/model/response_model/LoginWithMobilResponse.dart';
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
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

import '../../../../model/response_main_model/GenerateCaptchaResponse.dart';
import '../../../../services/request/EmptyGetRequest.dart';
import '../../../../services/request/tg_post_request.dart';
import '../../../widget/otp_bottom_sheet_auth.dart';

class LoginLogic extends GetxController {
  TextEditingController mobileController = TextEditingController(text: '');
  RxString mobile = ''.obs;
  RxString errorMsg = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isVerifyingOTP = false.obs;
  RxBool isMobilenumber = false.obs;
  RxString captchaString = "".obs;
  RxString otp = ''.obs;
  RxString passwordError = ''.obs;
  RxString mobileError = ''.obs;
  RxString captchError = ''.obs;
  RxString otpError = ''.obs;

  var passwordController = TextEditingController(text: "");

  var isButtonEnabled = false.obs;

  var captchaController = TextEditingController(text: "");

  String? captchaTrueValue = "";
  final validCharacters = RegExp(r'^[0-9]+$');

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      getcaptcha();
    });

    super.onInit();
  }

  void onChangeMobile(String? str) {
    errorMsg.value = '';
    mobileError.value = '';
    mobile.value = mobileController.text;
  }

  Future<void> onPressSentOTP() async {
    if (!validCharacters.hasMatch(mobileController.text) || mobileController.text.length != 10) {
      passwordError.value = '';
      mobileError.value = 'Please enter valid mobile number or email address';
      captchError.value = '';
      // } else if (passwordController.text.isEmpty) {
      //   passwordError.value = 'Please enter valid password';
      //   mobileError.value = '';
      //   captchError.value = '';
    } else if (captchaController.text.isEmpty) {
      passwordError.value = '';
      mobileError.value = '';
      captchError.value = 'Please enter captcha';
    } else if (captchaController.text != captchaTrueValue) {
      passwordError.value = '';
      mobileError.value = '';
      captchError.value = 'Captcha not match';
    } else {
      passwordError.value = '';
      mobileError.value = '';
      captchError.value = '';
      loginWithMobile();
    }
  }

  Future<void> loginWithMobile() async {
    if (await NetUtils.isInternetAvailable()) {
      login();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, login);
      }
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    LoginWithMobileRequest signUpOtpRequest = LoginWithMobileRequest(
      userType: 1,
      mobile: mobileController.text,
      captchaEnter: captchaController.text,
      captchaOriginal: captchaTrueValue,
      email: mobileController.text,
      domain: 'https://uat-jns.instantmseloans.in',
      platform: 'Mobile',
      termsAccepted: "true",
    );
    var jsonRequest = jsonEncode(signUpOtpRequest.toJson());
    TGLog.d("LoginWithMobileRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_LOGIN_WITH_MOBILE);
    ServiceManager.getInstance().loginWithMobile(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessLoginWithMobile(response),
        onError: (error) => _onErrorLoginWithMobile(error));
  }

  _onSuccessLoginWithMobile(LoginWithMobilResponse response) async {
    TGLog.d("LoginWithMobileRequest : onSuccess()---$response");
    if (response.getLoginResponse().status == RES_SUCCESS) {
      OTPBottomSheetAuth.getBottomSheet(
        context: Get.context!,
        onChangeOTP: (s) {
          otp.value = s;
          otpError.value = '';
          TGLog.d("Otp---------${otp.value}");
        },
        onSubmitOTP: (s) {
          otp.value = s;
          otpError.value = '';
        },
        title: 'User Verification',
        mobileNumber: mobileController.text ?? '',
        isEnable: (otp.value.length == 6 ? true : false).obs,
        isLoading: isVerifyingOTP,
        onButtonPress: onPressVerifyOtp,
        isEdit: false.obs,
        errorText: otpError,
        subTitle: 'A Verification code is sent on Registered mobile number '.obs,
      );
      isLoading.value = false;
    } else {
      TGLog.d("Error in LoginWithMobileRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getLoginResponse().status ?? 0, response.getLoginResponse().message ?? "", null);
    }
  }

  _onErrorLoginWithMobile(TGResponse errorResponse) {
    TGLog.d("LoginWithMobileRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> onPressVerifyOtp() async {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    if (otp.value.length != 6 || !validCharacters.hasMatch(otp.value)) {
      otpError.value = 'Please enter valid Otp';
      return;
    } else {
      otpError.value = '';
      if (await NetUtils.isInternetAvailable()) {
        loginRequest();
      } else {
        if (Get.context!.mounted) {
          showSnackBarForintenetConnection(Get.context!, loginRequest);
        }
      }
    }
  }

  getcaptcha() {
    ServiceManager.getInstance().getCaptcha(
      request: EmptyTgGetRequest(),
      onSuccess: (response) => _onsuccsessCaptchGet(response),
      onError: (response) => _onErrorResponse(response),
    );
  }

  Future<void> loginRequest() async {
    isVerifyingOTP.value = true;
    LoginRequest loginRequest = LoginRequest(
      email: null,
      password: null,
      browserName: 'chorme',
      browserVersion: '123.00',
      device: "smasung",
      deviceOs: 'windows',
      deviceOsVersion: 'windows-10',
      deviceType: 'Mobile',
      userAgent:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
      userType: 1,
      mobile: mobileController.text,
      otp: otp.value,
    );
    var jsonRequest = jsonEncode(loginRequest.toJson());
    TGLog.d("LoginRequest $jsonRequest");
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
      TGSharedPreferences.getInstance().set(PREF_MOBILE, response.getLoginResponseData().mobile);
      TGSharedPreferences.getInstance().set(PREF_REFRESHTOKEN, response.getLoginResponseData().refreshToken);
      TGSharedPreferences.getInstance().set(PREF_LOGIN_TOKEN, response.getLoginResponseData().loginToken.toString());
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded = stringToBase64.encode(response.getLoginResponseData().userName ?? '');
      TGSharedPreferences.getInstance().set(PREF_LOGIN_USERNAME, encoded);
      TGSharedPreferences.getInstance().set(PREF_MOBILE, response.getLoginResponseData().mobile);
      TGSharedPreferences.getInstance().set(PREF_LOGIN_RES, json.encode(response.getLoginResponseData()));
      TGSession.getInstance().set(SESSION_MOBILENUMBER, response.getLoginResponseData().mobile);
      TGSharedPreferences.getInstance().set(PREF_ORG_ID, response.getLoginResponseData().userOrgId);
      TGSharedPreferences.getInstance().set(PREF_USER_ID, response.getLoginResponseData().userId);
      setAccessTokenInRequestHeader();
      isVerifyingOTP.value = false;
      Get.to(
        () => DashboardPage(),
        binding: DashboardBinding(),
        arguments: {
          AppArguments.mobileNumber: mobile.value,
        },
      );
    } else {
      TGLog.d("Error in Login");
      isVerifyingOTP.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response?.getLoginResponseData().status ?? 0,
          response?.getLoginResponseData()?.message ?? "", null);
    }
  }

  _onErrorAutoLogin(TGResponse errorResponse) {
    TGLog.d("LoginRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    isVerifyingOTP.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  _onsuccsessCaptchGet(GenerateCaptchaResponse response) {
    print(response);
    captchaString.value = response.verifyOTP().data?.bytes ?? "";
    captchaTrueValue = latin1.decode(base64.decode(response.verifyOTP().data?.captchaString ?? ''));
  }

  _onErrorResponse(response) {}

  void onChangeCaptcha(String p1) {
    if (p1 == captchaTrueValue) {
      isButtonEnabled.value = true;
    }
  }
}

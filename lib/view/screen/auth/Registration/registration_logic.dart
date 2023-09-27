import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/LoginRequest.dart';
import 'package:jan_suraksha/model/request_model/SignUpOtpRequest.dart';
import 'package:jan_suraksha/model/request_model/VerifySignupOtpRequest.dart';
import 'package:jan_suraksha/model/response_model/LoginResponse.dart';
import 'package:jan_suraksha/model/response_model/OTPResponse.dart';
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
import 'package:jan_suraksha/view/widget/otp_bottom_sheet_auth.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

import '../../../../model/response_main_model/GenerateCaptchaResponse.dart';
import '../../../../services/request/EmptyGetRequest.dart';
import '../../../../services/request/tg_post_request.dart';

class RegistrationLogic extends GetxController {
  TextEditingController mobileController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');

  RxString mobile = ''.obs;
  RxString errorMsg = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isOTPVerifing = false.obs;
  RxBool isMobilenumber = false.obs;
  RxString captchaString = "".obs;
  var isButtonEnabled = false.obs;
  var captchaController = TextEditingController(text: "");
  String? captchaTrueValue = "";
  var namecontroller = TextEditingController(text: "");
  RxString otp = ''.obs;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2)).then((value) {
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
      errorMsg.value = '';
      signUp();
      TGSharedPreferences.getInstance().set(PREF_USER_NAME, nameController.text);
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
    ServiceManager.getInstance().getCaptcha(
        request: EmptyTgGetRequest(),
        onSuccess: (response) => _onsuccsessCaptchGet(response),
        onError: (response) => _onErrorResponse(response));
  }

  Future<void> signUp() async {
    if (await NetUtils.isInternetAvailable()) {
      signUpRequest();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, signUpRequest);
      }
    }
  }

  Future<void> signUpRequest() async {
    isLoading.value = true;
    SignUpOtpRequest signUpOtpRequest = SignUpOtpRequest(
      isTermsAccepted: true,
      userType: 1,
      mobile: '9081994518',
      captchaEnter: '123456',
      captchaOriginal: '123456',
      name: 'Vaishali',
      otpType: 1,
    );
    var jsonRequest = jsonEncode(signUpOtpRequest.toJson());
    TGLog.d("SignUpOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP);
    ServiceManager.getInstance().otpRequest(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessSignUp(response),
        onError: (error) => _onErrorSignUp(error));
  }

  _onSuccessSignUp(OTPResponse response) async {
    TGLog.d("SignUpOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      OTPBottomSheetAuth.getBottomSheet(
        context: Get.context!,
        isEdit: false.obs,
        onChangeOTP: (s) {
          otp.value = s;
          TGLog.d("Otp---------${otp.value}");
        },
        onSubmitOTP: (s) {
          otp.value = s;
        },
        title: 'User Verification',
        mobileNumber: mobileController.text ?? '',
        isEnable: true.obs,
        isLoading: isOTPVerifing,
        onButtonPress: verifyOtp,
        subTitle: 'A Verification code is sent on Registered mobile number '.obs,
      );
      isLoading.value = false;
    } else {
      TGLog.d("Error in SignUpOtpRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  _onErrorSignUp(TGResponse errorResponse) {
    TGLog.d("SignUpOtpRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    isOTPVerifing.value = false;

    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> verifyOtp() async {
    if (await NetUtils.isInternetAvailable()) {
      onVerifyOTP();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, onVerifyOTP);
      }
    }
  }

  Future<void> onVerifyOTP() async {
    isOTPVerifing.value = true;
    VerifySignupOtpRequest verifySignupOtpRequest =
        VerifySignupOtpRequest(mobile: '1234567890', otpType: 1, userId: 9492, otp: '123456');
    var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
    TGLog.d("SignUpOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP);
    ServiceManager.getInstance().otpRequest(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessVerifyOTP(response),
        onError: (error) => _onErrorSignUp(error));
  }

  _onSuccessVerifyOTP(OTPResponse response) async {
    TGLog.d("VerifySignupOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      TGSharedPreferences.getInstance().set(PREF_IS_FROM_REG, true);
      loginRequest();
    } else {
      TGLog.d("Error in VerifySignupOtpRequest");
      isOTPVerifing.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
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
      isLoading.value = false;
      // Get.offAll(
      //   () => const VerifyOtpPage(),
      //   binding: VerifyOtpBinding(),
      //   arguments: {
      //     AppArguments.mobileNumber: mobile.value,
      //   },
      // );
      Get.to(
        () => DashboardPage(),
        binding: DashboardBinding(),
        arguments: {
          AppArguments.mobileNumber: mobile.value,
        },
      );
    } else {
      TGLog.d("Error in login");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response?.getLoginResponseData().status ?? 0,
          response?.getLoginResponseData()?.message ?? "", null);
    }
  }

  _onErrorAutoLogin(TGResponse errorResponse) {
    TGLog.d("LoginRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

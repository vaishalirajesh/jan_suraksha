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
  RxString nameError = ''.obs;
  RxString mobileError = ''.obs;
  RxString captchError = ''.obs;
  RxString otpError = ''.obs;
  RxBool isCheckedFirst = false.obs;
  RegExp onlyCharRegExp = RegExp(r'^[a-zA-Z ]+$');
  RegExp mobileRegExp = RegExp(r'^[0-9]+$');
  RegExp mobileRegExpStartChar = RegExp(r'^[6-9]+$');
  RegExp nameRegExpStartChar = RegExp(r'^[@]+$');
  RegExp specialCharExpStartChar = RegExp(r'^[!@#$%^&*()]+$');
  RegExp emailRegExp = RegExp("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+");

  final validCharacters = RegExp(r'^[0-9]+$');
  num userId = 0;
  RxBool isEnableEmailOtpResend = false.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      getcaptcha();
    });

    super.onInit();
  }

  void onChangeName(String? str) {
    if (nameController.text.isEmpty ||
        !onlyCharRegExp.hasMatch(nameController.text) ||
        nameController.text == ' ' ||
        nameController.text.trim().length < 2 ||
        nameController.text.substring(0, 1) == ' ') {
      nameError.value = 'Please enter valid name';
    } else {
      nameError.value = '';
    }
  }

  void onChangeMobile(String? str) {
    mobile.value = mobileController.text;
    if (((mobileController.text.isEmpty || !mobileRegExp.hasMatch(mobileController.text)) ||
            mobileController.text == ' ' ||
            (mobileController.text.isNotEmpty &&
                !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0, 1)))) ||
        (mobileController.text.isNotEmpty && mobileController.text.length != 10)) {
      mobileError.value = 'Please enter valid mobile number';
    } else {
      mobileError.value = '';
    }
  }

  Future<void> onPressSentOTP() async {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    if (nameController.text.isEmpty ||
        !onlyCharRegExp.hasMatch(nameController.text) ||
        nameController.text == ' ' ||
        nameController.text.trim().length < 2 ||
        nameController.text.substring(0, 1) == ' ') {
      nameError.value = 'Please enter valid name';
    } else if (((mobileController.text.isEmpty || !mobileRegExp.hasMatch(mobileController.text)) ||
            mobileController.text == ' ' ||
            (mobileController.text.isNotEmpty &&
                !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0, 1)))) ||
        (mobileController.text.isNotEmpty && mobileController.text.length != 10)) {
      mobileError.value = 'Please enter valid mobile number';
    } else if (captchaController.text.isEmpty) {
      captchError.value = 'Please enter captcha';
    } else if (captchaController.text != captchaTrueValue) {
      captchError.value = 'Captcha not match';
    } else if (isCheckedFirst == false) {
      LoaderUtils.handleErrorResponse(
          Get.context!, 0, "Please Accept the Privacy Policy Terms & Conditions and Disclaimers", null);
    } else {
      nameError.value = '';
      mobileError.value = '';
      captchError.value = '';
      otp.value = '';
      signUp();
      TGSharedPreferences.getInstance().set(PREF_USER_NAME, nameController.text);
    }
    TGLog.d('Errormsg--------${errorMsg.value}');
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
      mobile: mobileController.text,
      captchaEnter: captchaController.text,
      captchaOriginal: captchaTrueValue,
      name: nameController.text,
      otpType: 1,
      notificationMasterId: 18,
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
      userId = response.getOtpResponse().data ?? '';
      await TGSharedPreferences.getInstance().set(PREF_USER_ID, response.getOtpResponse().data ?? 0);
      otp.value = '';
      otpError.value = '';
      isEnableEmailOtpResend.value = false;

      OTPBottomSheetAuth.getBottomSheet(
        context: Get.context!,
        isEdit: false.obs,
        onChangeOTP: (s) {
          if (s.isEmpty) {
            otp.value = otp.value.substring(0, otp.value.length - 1);
          } else {
            otp.value = otp.value + s;
          }
          otpError.value = '';
          TGLog.d("Otp---------${otp.value}");
        },
        timerText: ''.obs,
        onSubmitOTP: (s) {
          otp.value = otp.value + s;
          otpError.value = '';
        },
        title: 'User Verification',
        errorText: otpError,
        mobileNumber: mobileController.text ?? '',
        isEnable: isEnableEmailOtpResend,
        isLoading: isOTPVerifing,
        onButtonPress: verifyOtp,
        subTitle: 'A Verification code is sent on Registered mobile number '.obs,
        onResend: onResendEmailOtpTimer,
        onFinish: onFinishEmailOtpTimer,
      );
      isLoading.value = false;
    } else {
      TGLog.d("Error in SignUpOtpRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  Future<void> onFinishEmailOtpTimer() async {
    isEnableEmailOtpResend.value = true;
  }

  Future<void> onResendEmailOtpTimer() async {
    Get.back();
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    isEnableEmailOtpResend.value = false;
    onPressSentOTP();
  }

  _onErrorSignUp(TGResponse errorResponse) {
    TGLog.d("SignUpOtpRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    isOTPVerifing.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> verifyOtp() async {
    // var data =
    //     'ajI5cGdLaHRNOHFvd2orSlk3dm0wN2RnbzZEK0lTMmlqRndhUUJGcExaS1g0cWlkN3Z3WXN0c0VHQ1Zsd2plSndXZ3VkbEZ3Z2dDWkV3STBudFBUYWc5akRNbnUvZnk5cjlXY2FDS1dYeUN5VlYvMmlzbzloL2ZiY2JoWHQ1OW1PajExZXVUVEozdmI0aFZtUlFqbE9KM2RDSnhkblo0Tm9HTGx4Ui9ZOjphZDg1OGE4MDhiZDQyMzA3';
    // TGLog.d("Decrypet data----${AesGcmEncryptionUtils.decryptNew(data)}");
    // return;
    // if (otp.value.length != 6 || !validCharacters.hasMatch(otp.value)) {
    //   otpError.value = 'Please enter valid verification code';
    //   return;
    // } else {
    //   otpError.value = '';
    //   if (await NetUtils.isInternetAvailable()) {
    //     onVerifyOTP();
    //   } else {
    //     if (Get.context!.mounted) {
    //       showSnackBarForintenetConnection(Get.context!, onVerifyOTP);
    //     }
    //   }
    // }
    otpError.value = '';
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
        VerifySignupOtpRequest(mobile: mobileController.text, otpType: 1, userId: userId, otp: otp.value);
    var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
    TGLog.d("SignUpOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_VERIFY_OTP);
    ServiceManager.getInstance().otpRequest(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessVerifyOTP(response),
        onError: (error) => _onErrorSignUp(error));
  }

  _onSuccessVerifyOTP(OTPResponse response) async {
    TGLog.d("VerifySignupOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      await TGSharedPreferences.getInstance().set(PREF_IS_FROM_REG, true);
      await TGSharedPreferences.getInstance().set(PREF_MOBILE, mobileController.text);
      Get.offAll(() => DashboardPage(), binding: DashboardBinding());
    } else {
      TGLog.d("Error in VerifySignupOtpRequest");
      isOTPVerifing.value = false;
      otpError.value = response.getOtpResponse().message ?? '';
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  _onsuccsessCaptchGet(GenerateCaptchaResponse response) {
    captchaString.value = response.verifyOTP().data?.bytes ?? "";
    captchaTrueValue = latin1.decode(base64.decode(response.verifyOTP().data?.captchaString ?? ''));
  }

  _onErrorResponse(response) {}

  void onChangeCaptcha(String p1) {
    if (p1 == captchaTrueValue) {
      isButtonEnabled.value = true;
    }
    if (captchaController.text.isEmpty) {
      captchError.value = 'Please enter captcha';
    } else {
      captchError.value = '';
    }
  }

  void showCaptchaImage(BuildContext context, String imageString) {
    // Decode the Base64-encoded image string
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
      userType: 1,
      otp: '',
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
      TGSession.getInstance()
          .set(SESSION_MOBILENUMBER, response.getLoginResponseData().mobile ?? mobileController.text);
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
      Get.offAll(
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

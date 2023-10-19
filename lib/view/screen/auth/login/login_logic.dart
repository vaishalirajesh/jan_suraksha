import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/model/request_model/ForgotPasswordRequest.dart';
import 'package:jan_suraksha/model/request_model/LoginRequest.dart';
import 'package:jan_suraksha/model/request_model/LoginWithMobileRequest.dart';
import 'package:jan_suraksha/model/response_model/ForgotPasswordResponse.dart';
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
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/session_constant.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_binding.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_view.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

import '../../../../config/style_config.dart';
import '../../../../model/request_model/EmailOtpRequest.dart';
import '../../../../model/request_model/SetPasswordRequest.dart';
import '../../../../model/request_model/VerifySignupOtpRequest.dart';
import '../../../../model/response_main_model/GenerateCaptchaResponse.dart';
import '../../../../model/response_main_model/SetPasswordResponseMain.dart';
import '../../../../model/response_model/OTPResponse.dart';
import '../../../../services/request/EmptyGetRequest.dart';
import '../../../../services/request/tg_post_request.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../../utils/showcustomesnackbar.dart';
import '../../../widget/app_button.dart';
import '../../../widget/app_textfield.dart';
import '../../../widget/otp_bottom_sheet_auth.dart';
import '../../homepage/dashboard/dashboard_view.dart';

class LoginLogic extends GetxController {
  TextEditingController mobileController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');

  RxString mobile = ''.obs;
  RxString errorMsg = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isVerifyingOTP = false.obs;
  RxBool isPasswordAPICall = false.obs;
  RxBool isEmailOTPVerifing = false.obs;
  RxBool isSetPasswordLoading = false.obs;
  RxBool isMobilenumber = false.obs;
  RxString captchaString = "".obs;
  RxString otp = ''.obs;
  RxString emailOtp = ''.obs;
  RxString passwordError = ''.obs;
  RxString mobileError = ''.obs;
  RxString captchError = ''.obs;
  RxString otpError = ''.obs;
  RxString emailOtpError = ''.obs;
  RxString email = ''.obs;
  RxString setPassError = ''.obs;
  RxString resetPassError = ''.obs;
  RxString timerText = ''.obs;
  num masterId = 0;

  var passwordController = TextEditingController(text: "");
  RxBool isHidePassword = true.obs;
  RxBool isEnableLoginOtpResend = false.obs;
  RxBool isEnableEmailOtpResend = false.obs;

  var isButtonEnabled = false.obs;

  var captchaController = TextEditingController(text: "");

  String? captchaTrueValue = "";
  final validCharacters = RegExp(r'^[0-9]+$');

  var repeatpasswordController = TextEditingController();
  var forgotEmailController = TextEditingController(text: '');
  var setPasswordController = TextEditingController(text: '');
  var repeatSetPasswordController = TextEditingController(text: '');
  RxString forgotEmailError = ''.obs;
  RegExp emailRegExp = RegExp("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+");
  RxBool isShowPassword = true.obs;
  RxBool isShowForgotPassword = true.obs;
  RxBool isShowConfirmPassword = true.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      getcaptcha();
    });
    super.onInit();
  }

  void onChangeMobile(String? str) {
    mobile.value = mobileController.text;
    if (mobileController.text.isEmpty) {
      mobileError.value = 'Please enter valid mobile number or email address';
    } else {
      if (isNumeric(mobileController.text)) {
        if (!validCharacters.hasMatch(mobileController.text) ||
            mobileController.text.length != 10 ||
            !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0, 1))) {
          mobileError.value = 'Please enter valid mobile number or email address';
        } else {
          mobileError.value = '';
        }
      } else {
        if (!isNumeric(mobileController.text)) {
          if (mobileController.text.isNotEmpty && (mobileController.text.length < 5) ||
              !emailRegExp.hasMatch(mobileController.text)) {
            mobileError.value = 'Please enter valid email';
          } else {
            mobileError.value = '';
          }
        }
      }
    }
  }

  void onChangePassword(String? str) {
    if (passwordController.text.isEmpty || passwordController.text.length < 8) {
      passwordError.value = 'Please enter password';
    } else {
      passwordError.value = '';
    }
    isShowPassword.value = isShowPassword.value;
  }

  RegExp mobileRegExpStartChar = RegExp(r'^[6-9]+$');

  void onFocusOutEmail() {
    if (mobileController.text.isEmpty) {
      mobileError.value = 'Please enter valid mobile number or email address';
    } else {
      if (isNumeric(mobileController.text)) {
        if (!validCharacters.hasMatch(mobileController.text) ||
            mobileController.text.length != 10 ||
            !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0, 1))) {
          mobileError.value = 'Please enter valid mobile number or email address';
        } else {
          mobileError.value = '';
        }
      } else {
        if (!isNumeric(mobileController.text)) {
          if (mobileController.text.isNotEmpty && (mobileController.text.length < 5) ||
              !emailRegExp.hasMatch(mobileController.text)) {
            mobileError.value = 'Please enter valid email';
          } else {
            mobileError.value = '';
          }
        }
      }
    }
  }

  Future<void> onPressSentOTP() async {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    otp.value = '';
    otpError.value = '';
    if (mobileController.text.isEmpty) {
      mobileError.value = 'Please enter valid mobile number or email address';
    } else {
      if (isNumeric(mobileController.text)) {
        if (!validCharacters.hasMatch(mobileController.text) ||
            mobileController.text.length != 10 ||
            !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0, 1))) {
          mobileError.value = 'Please enter valid mobile number or email address';
        } else if (captchaController.text.isEmpty) {
          captchError.value = 'Please enter captcha';
        } else if (captchaController.text != captchaTrueValue) {
          captchError.value = 'Captcha not match';
        } else {
          passwordError.value = '';
          mobileError.value = '';
          captchError.value = '';
          loginWithMobile();
        }
      } else {
        if (!isNumeric(mobileController.text)) {
          if (mobileController.text.isNotEmpty && (mobileController.text.length < 5) ||
              !emailRegExp.hasMatch(mobileController.text)) {
            mobileError.value = 'Please enter valid email';
          } else if (passwordController.text.isEmpty) {
            passwordError.value = 'Please enter password';
          } else if (!validateStructure(passwordController.text)) {
            passwordError.value = 'Invalid password pattern';
          } else if (captchaController.text.isEmpty) {
            captchError.value = 'Please enter captcha';
          } else if (captchaController.text != captchaTrueValue) {
            captchError.value = 'Captcha not match';
          } else {
            passwordError.value = '';
            mobileError.value = '';
            captchError.value = '';
            isLoading.value = true;
            LoginRequest loginRequest = LoginRequest(
              email: mobileController.text,
              password: passwordController.text,
              browserName: 'chorme',
              browserVersion: '123.00',
              device: "smasung",
              deviceOs: 'windows',
              deviceOsVersion: 'windows-10',
              deviceType: 'Mobile',
              userAgent:
                  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
              userType: 1,
            );
            var jsonRequest = jsonEncode(loginRequest.toJson());
            TGLog.d("LoginRequest $jsonRequest");
            TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_LOGIN);
            ServiceManager.getInstance().loginRequest(
                request: tgPostRequest,
                onSuccess: (response) async {
                  LoginResponse loginResponse = response;
                  if (loginResponse.getLoginResponseData().status == RES_SUCCESS) {
                    AppUtils.setAccessToken(loginResponse.getLoginResponseData().accessToken);
                    TGSharedPreferences.getInstance().set(PREF_MOBILE, loginResponse.getLoginResponseData().mobile);
                    TGSharedPreferences.getInstance().set(PREF_USER_EMAIL, mobileController.text);
                    TGSharedPreferences.getInstance()
                        .set(PREF_REFRESHTOKEN, loginResponse.getLoginResponseData().refreshToken);
                    TGSharedPreferences.getInstance()
                        .set(PREF_LOGIN_TOKEN, loginResponse.getLoginResponseData().loginToken.toString());
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    String encoded = stringToBase64.encode(loginResponse.getLoginResponseData().userName ?? '');
                    TGSharedPreferences.getInstance().set(PREF_LOGIN_USERNAME, encoded);
                    TGSharedPreferences.getInstance().set(PREF_MOBILE, loginResponse.getLoginResponseData().mobile);
                    TGSharedPreferences.getInstance()
                        .set(PREF_LOGIN_RES, json.encode(loginResponse.getLoginResponseData()));
                    TGSession.getInstance()
                        .set(SESSION_MOBILENUMBER, loginResponse.getLoginResponseData().mobile ?? '');
                    TGSharedPreferences.getInstance().set(PREF_ORG_ID, loginResponse.getLoginResponseData().userOrgId);
                    TGSharedPreferences.getInstance().set(PREF_USER_ID, loginResponse.getLoginResponseData().userId);
                    TGSharedPreferences.getInstance().set(PREF_USERNAME, loginResponse.getLoginResponseData().userName);
                    setAccessTokenInRequestHeader();
                    EmailOtpRequest emailOtpRequest = EmailOtpRequest(
                        userId: loginResponse.getLoginResponseData().userId,
                        email: mobileController.text,
                        otpType: 2,
                        notificationMasterId: 13);
                    var jsonRequest = jsonEncode(emailOtpRequest.toJson());
                    TGLog.d("EmailOtpRequest $jsonRequest");
                    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_EMAIL_OTP);
                    TGLog.d("EmailOtpRequest Decrypt:--------${tgPostRequest.body()}");
                    ServiceManager.getInstance().otpRequest(
                      request: tgPostRequest,
                      onSuccess: (response) async {
                        OTPResponse otpResponse = response;
                        if (otpResponse.getOtpResponse().status == RES_SUCCESS) {
                          Get.offAll(() => DashboardPage(), binding: DashboardBinding());
                        } else {
                          showSnackBar(Get.context!, otpResponse.getOtpResponse().message ?? "");
                        }
                        isLoading.value = false;
                      },
                      //   OTPResponse otpResponse = response;
                      //
                      //   OTPBottomSheetAuth.getBottomSheet(
                      //     context: Get.context!,
                      //     onChangeOTP: (s) {
                      //       otp.value = s;
                      //       otpError.value = '';
                      //       TGLog.d("Otp---------${otp.value}");
                      //     },
                      //     onSubmitOTP: (s) async {
                      //       var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
                      //       var mobile = await TGSharedPreferences.getInstance().get(PREF_MOBILE);
                      //       VerifySignupOtpRequest verifySignupOtpRequest =
                      //           VerifySignupOtpRequest(email: mobileController.text, otpType: 2, userId: userId, otp: s);
                      //       var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
                      //       TGLog.d("ConsentOtpVerifyRequest $jsonRequest");
                      //       TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_CONSENT_VERIFY_OTP);
                      //       TGLog.d("ConsentOtpVerifyRequest Decrypt:--------${tgPostRequest.body()}");
                      //       ServiceManager.getInstance().otpRequest(
                      //         request: tgPostRequest,
                      //         onSuccess: (response) {
                      //           Get.offAll(() => DashboardPage(), binding: DashboardBinding());
                      //         },
                      //         onError: (error) {},
                      //       );
                      //     },
                      //     title: 'User Verification',
                      //     mobileNumber: mobileController.text ?? '',
                      //     isEnable: (otp.value.length == 6 ? true : false).obs,
                      //     isLoading: isVerifyingOTP,
                      //     onButtonPress: () {},
                      //     isEdit: false.obs,
                      //     errorText: otpError,
                      //     subTitle: 'A Verification code is sent on Registered mobile number '.obs,
                      //   );
                      // },
                      onError: (error) {
                        showSnackBar(Get.context!, error ?? "");
                        isLoading.value = false;
                      },
                    );
                  } else if (loginResponse.getLoginResponseData().status == RES_UNAUTHORISED) {
                    isLoading.value = false;
                    showSnackBar(Get.context!, loginResponse.getLoginResponseData().message ?? "Error in Login");
                  } else {
                    isLoading.value = false;
                    LoaderUtils.handleErrorResponse(Get.context!, loginResponse.getLoginResponseData().status ?? 0,
                        loginResponse.getLoginResponseData().message ?? "", null);
                  }
                },
                onError: (error) => _onErrorAutoLogin(error));
          }
        }
      }
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
      domain: AppUtils.getAppDomain(),
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
      otp.value = '';
      isEnableLoginOtpResend.value = false;
      OTPBottomSheetAuth.getBottomSheet(
        context: Get.context!,
        onChangeOTP: (s) {
          if (s.isEmpty) {
            otp.value = otp.value.substring(0, otp.value.length - 1);
          } else {
            otp.value = otp.value + s;
          }
          otpError.value = '';
          TGLog.d("Otp---------${otp.value}");
        },
        timerText: timerText,
        onSubmitOTP: (s) {
          otp.value = otp.value + s;
          otpError.value = '';
        },
        title: 'User Verification',
        mobileNumber: mobileController.text ?? '',
        isEnable: isEnableLoginOtpResend,
        onResend: onResendLoginOtpTimer,
        onFinish: onFinishLoginOtpTimer,
        isLoading: isVerifyingOTP,
        onButtonPress: onPressVerifyOtp,
        isEdit: false.obs,
        errorText: otpError,
        subTitle: 'A Verification code is sent on your register mobile number '.obs,
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
    handleServiceFailError(Get.context!, errorResponse);
  }

  Future<void> onPressVerifyOtp() async {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    otpError.value = '';
    if (await NetUtils.isInternetAvailable()) {
      loginRequest();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, loginRequest);
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
      TGSharedPreferences.getInstance().set(PREF_USERNAME, response.getLoginResponseData().userName);
      setAccessTokenInRequestHeader();
      isVerifyingOTP.value = false;
      Get.back();
      Get.offAll(
        () => DashboardPage(),
        binding: DashboardBinding(),
      );
    } else if (response.getLoginResponseData().status == RES_UNAUTHORISED) {
      if (response.getLoginResponseData().message == 'You have reached maximum login attempts, please try next day.') {
        otpError.value = "You have reached maximum login attempts, please try next day.";
      } else {
        otpError.value = "Please enter valid verification code";
      }
      isVerifyingOTP.value = false;
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
    handleServiceFailError(Get.context!, errorResponse);
  }

  _onsuccsessCaptchGet(GenerateCaptchaResponse response) {
    captchaString.value = response.verifyOTP().data?.bytes ?? "";
    captchaTrueValue = latin1.decode(base64.decode(response.verifyOTP().data?.captchaString ?? ''));
    // captchaController.text = captchaTrueValue ?? '';
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

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void getForgotEmail() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (forgotEmailController.text.isNotEmpty && (forgotEmailController.text.length < 5) ||
        !emailRegExp.hasMatch(forgotEmailController.text)) {
      forgotEmailError.value = 'Please enter valid email';
    } else {
      forgotEmailError.value = '';
      onForgotPassword();
    }
  }

  Future<void> onForgotPassword() async {
    if (await NetUtils.isInternetAvailable()) {
      forgotPassword();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, forgotPassword);
      }
    }
  }

  Future<void> forgotPassword() async {
    isPasswordAPICall.value = true;
    setPasswordController.text = '';
    repeatSetPasswordController.text = '';
    emailOtp.value = '';
    setPassError.value = '';
    resetPassError.value = '';
    emailOtpError.value = '';
    ForgotPasswordRequest forgotPasswordRequest = ForgotPasswordRequest(
      userType: '1',
      domain: AppUtils.getAppDomain(),
      email: forgotEmailController.text,
      notificationMasterId: 14,
    );
    var jsonRequest = jsonEncode(forgotPasswordRequest.toJson());
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_FORGOT_PASSWORD);
    TGLog.d("ForgotPasswordRequest Decrypt:--------$jsonRequest");

    ServiceManager.getInstance().forgotPassword(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessForgotPassword(response),
      onError: (error) => _onErrorForgotPassword(error),
    );
  }

  _onSuccessForgotPassword(ForgotPasswordResponse response) async {
    TGLog.d("ForgotPasswordRequest : onSuccess()---$response");
    if (response.forgotPassword().status == RES_SUCCESS) {
      isPasswordAPICall.value = false;
      masterId = response.forgotPassword().data?.masterId ?? 0;
      emailOtp.value = '';
      isEnableEmailOtpResend.value = false;
      OTPBottomSheetAuth.getBottomSheet(
        context: Get.context!,
        timerText: ''.obs,
        onChangeOTP: (s) {
          if (s.isEmpty) {
            emailOtp.value = emailOtp.value.substring(0, emailOtp.value.length - 1);
          } else {
            emailOtp.value = emailOtp.value + s;
          }
          emailOtpError.value = '';
          TGLog.d("Otp---------${emailOtp.value}");
        },
        onSubmitOTP: (s) {
          emailOtp.value = emailOtp.value + s;
          emailOtpError.value = '';
        },
        title: 'User Verification',
        mobileNumber: forgotEmailController.text ?? '',
        isLoading: isEmailOTPVerifing,
        onButtonPress: emailVerifyOtp,
        isEdit: false.obs,
        errorText: emailOtpError,
        subTitle: 'A Verification code is sent on \n your email id '.obs,
        isEnable: isEnableEmailOtpResend,
        onResend: onResendEmailOtpTimer,
        onFinish: onFinishEmailOtpTimer,
      );
    } else {
      TGLog.d("Error in ForgotPasswordRequest");
      isPasswordAPICall.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.forgotPassword().status ?? 0, response.forgotPassword().message ?? "", null);
    }
  }

  _onErrorForgotPassword(TGResponse errorResponse) {
    TGLog.d("ForgotPasswordRequest : onError()--${errorResponse.error}");
    isPasswordAPICall.value = false;
    handleServiceFailError(Get.context!, errorResponse);
  }

  Future<void> emailVerifyOtp() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (emailOtp.value.length != 6 || !validCharacters.hasMatch(emailOtp.value)) {
      emailOtpError.value = 'Please enter valid verification code';

      return;
    } else {
      emailOtpError.value = '';
      if (await NetUtils.isInternetAvailable()) {
        onVerifyOTP();
      } else {
        if (Get.context!.mounted) {
          showSnackBarForintenetConnection(Get.context!, onVerifyOTP);
        }
      }
    }
  }

  Future<void> onVerifyOTP() async {
    isEmailOTPVerifing.value = true;
    VerifySignupOtpRequest verifySignupOtpRequest =
        VerifySignupOtpRequest(email: forgotEmailController.text, otpType: 2, userId: masterId, otp: emailOtp.value);
    var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
    TGLog.d("SignUpOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_VERIFY_OTP);
    ServiceManager.getInstance().otpRequest(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessEmailVerifyOTP(response),
      onError: (error) => _onErrorEmailOtpVerify(error),
    );
  }

  _onErrorEmailOtpVerify(TGResponse errorResponse) {
    TGLog.d("SignUpOtpRequest : onError()--${errorResponse.error}");
    isEmailOTPVerifing.value = false;

    handleServiceFailError(Get.context!, errorResponse);
  }

  _onSuccessEmailVerifyOTP(OTPResponse response) async {
    TGLog.d("VerifySignupOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      Get.back();
      getUpdatePasswordBottomSheet(
        onSubmitOTP: (String) {},
        onButtonPress: onPressSetPassword,
        title: 'Set Password',
        isEnable: true.obs,
        isLoading: isSetPasswordLoading,
      );
      isEmailOTPVerifing.value = false;
    } else {
      TGLog.d("Error in VerifySignupOtpRequest");
      emailOtpError.value = response.getOtpResponse().message ?? '';

      isEmailOTPVerifing.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  Future<void> onPressSetPassword() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (setPasswordController.text.isEmpty) {
      setPassError.value = "Please enter password";
      resetPassError.value = '';
    } else if (setPasswordController.text.length < 8) {
      resetPassError.value = "";
      setPassError.value = 'Invalid password pattern';
    } else if (!validateStructure(setPasswordController.text)) {
      resetPassError.value = "";
      setPassError.value = 'Invalid password pattern';
    } else if (repeatSetPasswordController.text.isEmpty ||
        setPasswordController.text != repeatSetPasswordController.text) {
      resetPassError.value = "Password not match with confirm password";
      setPassError.value = '';
    } else if (repeatSetPasswordController.text.length < 8) {
      resetPassError.value = "Invalid password pattern";
      setPassError.value = '';
    } else if (!validateStructure(repeatSetPasswordController.text)) {
      resetPassError.value = "Invalid password pattern";
      setPassError.value = '';
    } else {
      setPassError.value = '';
      resetPassError.value = '';
      isSetPasswordLoading.value = true;
      var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
      SetPasswordRequest verifySignupOtpRequest = SetPasswordRequest(
          password: setPasswordController.text,
          confirmPassword: repeatSetPasswordController.text,
          userId: int.parse('$masterId'));
      var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
      TGLog.d("SignUpOtpRequest $jsonRequest");
      TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SET_PASSWORD);
      ServiceManager.getInstance().setPassword(
          request: tgPostRequest,
          onSuccess: (respose) => _onsuccsessSetPassword(respose),
          onError: (response) => _onErrorSetPassword(response));
    }
  }

  void onChangeForgotPassword(String? str) {
    if (forgotEmailController.text.isNotEmpty && (forgotEmailController.text.length < 5) ||
        !emailRegExp.hasMatch(forgotEmailController.text)) {
      forgotEmailError.value = 'Please enter valid email';
    } else {
      forgotEmailError.value = '';
    }
  }

  _onsuccsessSetPassword(SetPasswordResponseMain response) {
    if (response.skippedresponse().status == RES_SUCCESS) {
      Get.offAll(() => LoginPage(), binding: LoginBinding());
      isSetPasswordLoading.value = false;
      showSnackBar(Get.context!, "Password Updated Successfully");
    } else {
      TGLog.d("Error in VerifySignupOtpRequest");
      resetPassError.value = response.skippedresponse().message ?? '';
      isSetPasswordLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.skippedresponse().status ?? 0, response.skippedresponse().message ?? "", null);
    }
  }

  _onErrorSetPassword(response) {
    isSetPasswordLoading.value = false;
    Get.back();
    showSnackBar(Get.context!, "Error in reset Password");
  }

  void onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }

  getUpdatePasswordBottomSheet({
    required Function(String) onSubmitOTP,
    required Function() onButtonPress,
    required String title,
    RxString? errorText,
    required RxBool isEnable,
    required RxBool isLoading,
  }) {
    Get.bottomSheet(LayoutBuilder(builder: (context, _) {
      final key = GlobalKey<State<Tooltip>>();
      return Obx(() {
        return isEnable.value
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
                  color: ColorConfig.jsCardBgColor,
                ),
                padding: EdgeInsets.all(20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Text(
                              title.isNotEmpty ? title : AppString.enterOTP,
                              style: StyleConfig.semiBoldText16.copyWith(color: ColorConfig.jsLightBlackColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Tooltip(
                          key: key,
                          showDuration: const Duration(seconds: 1),
                          waitDuration: const Duration(seconds: 2),
                          message:
                              "Password must contain at least one number, one uppercase, lowercase and special character, and at least 8 or more characters",
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.all(10.r),
                          margin: EdgeInsets.all(10.r),
                          decoration: ShapeDecoration(
                            color: ColorConfig.jsDarkCreamColor,
                            shape: const ToolTipCustomShape(),
                          ),
                          textStyle: StyleConfig.regularExtraSmallText,
                          child: GestureDetector(
                            onTap: () {
                              onTap(key);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.h, right: 5.h, top: 2.h),
                              child: Icon(
                                Icons.info_outline_rounded,
                                size: 20.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(() {
                      return AppTextField(
                        isMandatory: true,
                        title: AppString.password,
                        controller: setPasswordController,
                        hintText: AppString.password,
                        inputType: TextInputType.text,
                        errorText: setPassError.value,
                        onChanged: (str) {
                          if (setPasswordController.text.isEmpty) {
                            setPassError.value = "Please enter password";
                          } else if (setPasswordController.text.length < 8) {
                            setPassError.value = 'Invalid password pattern';
                          } else if (!validateStructure(setPasswordController.text)) {
                            setPassError.value = 'Invalid password pattern';
                          } else {
                            setPassError.value = '';
                          }
                        },
                        isObscureText: isShowForgotPassword.value,
                        suffix: IconButton(
                          icon: isShowForgotPassword.value
                              ? Icon(
                                  Icons.visibility_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                )
                              : Icon(
                                  Icons.visibility_off_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                ),
                          onPressed: () {
                            isShowForgotPassword.value = !isShowForgotPassword.value;
                          },
                        ),
                        maxLength: 20,
                      );
                    }),
                    SizedBox(height: 20),
                    Obx(() {
                      return AppTextField(
                        isMandatory: true,
                        title: AppString.reenterPassword,
                        controller: repeatSetPasswordController,
                        hintText: AppString.reenterPassword,
                        inputType: TextInputType.text,
                        errorText: resetPassError.value,
                        isObscureText: isShowConfirmPassword.value,
                        onChanged: (str) {
                          if (repeatSetPasswordController.text.isEmpty) {
                            resetPassError.value = "Please enter confirm password";
                          } else if (repeatSetPasswordController.text.length < 8) {
                            resetPassError.value = "Invalid password pattern";
                          } else if (!validateStructure(repeatSetPasswordController.text)) {
                            resetPassError.value = "Invalid password pattern";
                          } else {
                            resetPassError.value = '';
                          }
                        },
                        suffix: IconButton(
                          icon: isShowConfirmPassword.value
                              ? Icon(
                                  Icons.visibility_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                )
                              : Icon(
                                  Icons.visibility_off_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                ),
                          onPressed: () {
                            isShowConfirmPassword.value = !isShowConfirmPassword.value;
                          },
                        ),
                        maxLength: 20,
                      );
                    }),
                    if (errorText != null && errorText.value.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              errorText.value ?? '',
                              style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsRedColor),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppButton(
                      onPress: onButtonPress,
                      title: AppString.continueText,
                      isButtonEnable: true.obs,
                      isDataLoading: isSetPasswordLoading,
                    )
                  ],
                ),
              )
            : Container();
      });
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Future<void> onFinishLoginOtpTimer() async {
    isEnableLoginOtpResend.value = true;
  }

  Future<void> onResendLoginOtpTimer() async {
    Get.back();
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    isEnableLoginOtpResend.value = false;
    loginWithMobile();
  }

  Future<void> onFinishEmailOtpTimer() async {
    isEnableEmailOtpResend.value = true;
  }

  Future<void> onResendEmailOtpTimer() async {
    Get.back();
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    isEnableEmailOtpResend.value = false;
    onForgotPassword();
  }
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;

  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(5.r)))
      ..moveTo(rect.topCenter.dx + 140, rect.topCenter.dy)
      ..relativeLineTo(10, -10)
      ..relativeLineTo(10, 10)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ToolTipCustomShape scale(double t) => this;
}

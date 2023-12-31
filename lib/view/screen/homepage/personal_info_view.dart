import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';

import '../../../config/color_config.dart';
import '../../../config/font_config.dart';
import '../../../config/style_config.dart';
import '../../../model/request_model/EmailOtpRequest.dart';
import '../../../model/request_model/SetPasswordRequest.dart';
import '../../../model/request_model/VerifySignupOtpRequest.dart';
import '../../../model/response_main_model/SetPasswordResponseMain.dart';
import '../../../model/response_model/OTPResponse.dart';
import '../../../services/common/tg_log.dart';
import '../../../services/request/tg_post_request.dart';
import '../../../services/requtilization.dart';
import '../../../services/response/tg_response.dart';
import '../../../services/services.dart';
import '../../../services/singleton/shared_preferences.dart';
import '../../../services/uris.dart';
import '../../../utils/constant/prefrenceconstants.dart';
import '../../../utils/constant/statusconstants.dart';
import '../../../utils/constant/string_constant.dart';
import '../../../utils/showcustomesnackbar.dart';
import '../../../utils/theme_helper.dart';
import '../../../utils/utils.dart';
import '../../widget/app_button.dart';
import '../../widget/custom_otp_field/custom_otp_field.dart';
import '../../widget/otp_bottom_sheet_auth.dart';
import '../../widget/progressloader.dart';
import 'personal_info_logic.dart';

class PersonalInfoPage extends StatelessWidget {
  PersonalInfoPage({Key? key}) : super(key: key);

  final personallogic = Get.find<PersonalInfoLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          AddHeaderFooter(
            appbarName: AppString.appBarWithTitle,
            title: "Personal Info",
            buttonTitle: "Go Back",
            onButtonClick: () {
              AppUtils.onBackPress();
            },
            onBackButtonCLick: AppUtils.onBackPress,
            isDataLoading: false,
            isButtonEnable: true,
            isShowButton: true,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedFlexView(
                0.9.sh,
                axis: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => AppTextField(
                          hintText: "",
                          isReadOnly: true,
                          isMandatory: true,
                          isAutoFocus: true,
                          title: "Name",
                          inputType: TextInputType.emailAddress,
                          maxLength: 30,
                          controller: TextEditingController(text: personallogic.userName.value),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Mobile Number",
                      style: StyleConfig.boldText16.copyWith(
                        color: ColorConfig.jsBlackColor,
                        fontFamily: JSFonts.outfitRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => AppTextField(
                          hintText: "",
                          isReadOnly: true,
                          isMandatory: true,
                          isAutoFocus: true,
                          inputType: TextInputType.emailAddress,
                          maxLength: 30,
                          controller: TextEditingController(
                            text: personallogic.mobilenumber.value,
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email ID",
                      style: StyleConfig.boldText16.copyWith(
                        color: ColorConfig.jsBlackColor,
                        fontFamily: JSFonts.outfitRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return AppTextField(
                        hintText: "",
                        isReadOnly: personallogic.showEditIcon.value,
                        isMandatory: true,
                        isAutoFocus: false,
                        onChanged: (s) {
                          final bool emailValid =
                              RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(s);

                          if (s != personallogic.email.value && emailValid) {
                            TGLog.d("debug");
                            personallogic.email.value = s;
                            personallogic.shouldChangeAppearInEmailSuffix.value = true;
                          } else {
                            personallogic.shouldChangeAppearInEmailSuffix.value = false;
                          }
                        },
                        inputType: TextInputType.emailAddress,
                        maxLength: 255,
                        controller: personallogic.emailController,
                        suffix: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            !personallogic.showEditIcon.value
                                ? personallogic.shouldChangeAppearInEmailSuffix.value
                                    ? InkWell(
                                        onTap: () {
                                          FocusScope.of(Get.context!).requestFocus(FocusNode());
                                          updateEmail(context);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: 10.w,
                                          ),
                                          child: Text(
                                            'Change',
                                            style: StyleConfig.boldText16.copyWith(color: ColorConfig.jsPrimaryColor),
                                          ),
                                        ),
                                      )
                                    : const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      personallogic.showEditIcon.value = false;
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: ColorConfig.jsBlackColor,
                                    )),
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: StyleConfig.boldText16.copyWith(
                        color: ColorConfig.jsBlackColor,
                        fontFamily: JSFonts.outfitRegular,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppTextField(
                      isReadOnly: true,
                      isMandatory: true,
                      isAutoFocus: true,
                      inputType: TextInputType.emailAddress,
                      maxLength: 30,
                      controller: TextEditingController(text: "***********"),
                      suffix: InkWell(
                        onTap: onChangePassword,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.w, top: 10.h),
                          child: Text(
                            'Change',
                            style: StyleConfig.boldText16.copyWith(color: ColorConfig.jsPrimaryColor),
                          ),
                        ),
                      ),
                      hintText: '',
                    )
                  ],
                ),
              ),
            ),
          ),
          if (personallogic.isEmailChanging.value || personallogic.isPasswordChanging.value) const AppLoader()
        ],
      );
    });
  }

  Future<void> onChangePassword() async {
    if (!personallogic.isPasswordChanging.value) {
      personallogic.isPasswordChanging.value = true;
      var userID = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
      await TGSharedPreferences.getInstance().get(PREF_REFRESHTOKEN);
      await TGSharedPreferences.getInstance().remove(PREF_ACCESS_TOKEN);
      await TGSharedPreferences.getInstance().remove(PREF_LOGIN_TOKEN);
      EmailOtpRequest emailOtpRequest =
          EmailOtpRequest(userId: userID, email: personallogic.email.value, otpType: 2, notificationMasterId: 17);
      var jsonRequest = jsonEncode(emailOtpRequest.toJson());
      TGLog.d("EmailOtpRequest $jsonRequest");
      TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_EMAIL_OTP);
      TGLog.d("EmailOtpRequest Decrypt:--------${tgPostRequest.body()}");
      ServiceManager.getInstance().otpRequest(
        request: tgPostRequest,
        onSuccess: (response) {
          TGLog.d("EmailOtpRequest : onSuccess()---$response");
          if (response.getOtpResponse().status == RES_SUCCESS) {
            personallogic.isPasswordChanging.value = false;
            getOtpBottomSheetForPassWord();
          } else {
            TGLog.d("Error in EmailOtpRequest");
            personallogic.isPasswordChanging.value = false;
            LoaderUtils.handleErrorResponse(
                Get.context!, response?.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
          }
        },
        onError: (response) => (TGResponse error) {
          personallogic.isPasswordChanging.value = false;
          showSnackBar(Get.context!, "Error in password update");
        },
      );
    }
  }

  Future<void> onFinishPasswordOtpTimer() async {
    personallogic.isEnablePasswordOtpResend.value = true;
  }

  Future<void> onResendPasswordOtpTimer() async {
    Get.back();
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    personallogic.isEnablePasswordOtpResend.value = false;
    onChangePassword();
  }

  Future<void> onFinishEmailOtpTimer() async {
    personallogic.isEnableEmailOtpResend.value = true;
  }

  Future<void> onResendEmailOtpTimer() async {
    Get.back();
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    personallogic.isEnableEmailOtpResend.value = false;
    updateEmail(Get.context!);
  }

  Future<void> updateEmail(BuildContext context) async {
    if (!personallogic.isEmailChanging.value) {
      personallogic.isEmailChanging.value = true;
      var userID = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
      await TGSharedPreferences.getInstance().get(PREF_REFRESHTOKEN);
      await TGSharedPreferences.getInstance().remove(PREF_ACCESS_TOKEN);
      await TGSharedPreferences.getInstance().remove(PREF_LOGIN_TOKEN);
      EmailOtpRequest emailOtpRequest =
          EmailOtpRequest(userId: userID, email: personallogic.email.value, otpType: 2, notificationMasterId: 16);
      var jsonRequest = jsonEncode(emailOtpRequest.toJson());
      TGLog.d("EmailOtpRequest $jsonRequest");
      TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_EMAIL_OTP);
      TGLog.d("EmailOtpRequest Decrypt:--------${tgPostRequest.body()}");
      ServiceManager.getInstance().otpRequest(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessEmailOtp(response, context),
        onError: (response) => (TGResponse error) {
          personallogic.isEmailChanging.value = false;
          showSnackBar(Get.context!, "Error in email update");
        },
      );
    }
  }

  _onSuccessEmailOtp(OTPResponse response, BuildContext context) async {
    TGLog.d("EmailOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      getOtpBottomSheetForEmail(context);
      personallogic.isEmailChanging.value = false;
    } else {
      TGLog.d("Error in EmailOtpRequest");
      personallogic.isEmailChanging.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  dynamic getOtpBottomSheetForEmail(BuildContext context) {
    personallogic.otp.value = '';
    personallogic.otpEmailError.value = '';
    personallogic.isEnableEmailOtpResend.value = false;
    OTPBottomSheetAuth.getBottomSheet(
      context: Get.context!,
      timerText: ''.obs,
      isEnable: personallogic.isEnableEmailOtpResend,
      onResend: onResendEmailOtpTimer,
      onFinish: onFinishEmailOtpTimer,
      onChangeOTP: (s) {
        if (s.isEmpty) {
          personallogic.otp.value = personallogic.otp.value.substring(0, personallogic.otp.value.length - 1);
        } else {
          personallogic.otp.value = personallogic.otp.value + s;
        }
        personallogic.otpEmailError.value = '';
      },
      onSubmitOTP: (s) {
        personallogic.otp.value = personallogic.otp.value + s;
        personallogic.otpEmailError.value = '';
      },
      title: 'Email Verification',
      mobileNumber: personallogic.email.value,
      isLoading: personallogic.isLoadingEmailOTP,
      onButtonPress: () async {
        personallogic.isLoadingEmailOTP.value = true;
        var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
        VerifySignupOtpRequest verifySignupOtpRequest = VerifySignupOtpRequest(
            email: personallogic.email.value, otpType: 2, userId: userId, otp: personallogic.otp.value);
        var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
        TGLog.d("ConsentOtpVerifyRequest $jsonRequest");
        TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_VERIFY_OTP);
        TGLog.d("ConsentOtpVerifyRequest Decrypt:--------${tgPostRequest.body()}");
        ServiceManager.getInstance().otpRequest(
          request: tgPostRequest,
          onSuccess: (response) {
            OTPResponse otpResponse = response;
            if (otpResponse.getOtpResponse().status == RES_SUCCESS) {
              TGSharedPreferences.getInstance().set(PREF_USER_EMAIL, personallogic.email.value);
              showSnackBar(context, "Email Updated Succsessfully");
              TGSharedPreferences.getInstance().set(PREF_USER_EMAIL, personallogic.email.value);
              personallogic.shouldChangeAppearInEmailSuffix.value = false;
              personallogic.showEditIcon.value = true;
              Get.back();
              personallogic.isLoadingEmailOTP.value = false;
            } else {
              personallogic.otpEmailError.value = otpResponse.getOtpResponse().message ?? '';
              showSnackBar(Get.context!, otpResponse.getOtpResponse().message!);
              personallogic.isLoadingEmailOTP.value = false;
            }
          },
          onError: (response) => (TGResponse error) {
            Get.back();
            showSnackBar(Get.context!, "Email Updated Succsessfully");
            TGLog.d("Error Occured" + error.httpStatus.toString());
            personallogic.isLoadingEmailOTP.value = false;
          },
        );
      },
      isEdit: true.obs,
      onEdit: () {
        Get.back();
      },
      subTitle: personallogic.subtitle,
      errorText: personallogic.otpEmailError,
    );
  }

  dynamic getOtpBottomSheetForPassWord() {
    personallogic.otpPasswordError.value = '';
    personallogic.passwordOtp.value = '';
    personallogic.isEnablePasswordOtpResend.value = false;
    OTPBottomSheetAuth.getBottomSheet(
      context: Get.context!,
      timerText: ''.obs,
      title: 'Email Verification',
      isEnable: personallogic.isEnablePasswordOtpResend,
      onResend: onResendPasswordOtpTimer,
      onFinish: onFinishPasswordOtpTimer,
      mobileNumber: personallogic.email.value,
      isLoading: personallogic.isLoadingEmailOTP,
      errorText: personallogic.otpPasswordError,
      onButtonPress: () async {
        personallogic.isLoadingEmailOTP.value = true;
        var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
        VerifySignupOtpRequest verifySignupOtpRequest = VerifySignupOtpRequest(
            email: personallogic.email.value, otpType: 2, userId: userId, otp: personallogic.passwordOtp.value);
        var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
        TGLog.d("ConsentOtpVerifyRequest $jsonRequest");
        TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_VERIFY_OTP);
        TGLog.d("ConsentOtpVerifyRequest Decrypt:--------${tgPostRequest.body()}");
        ServiceManager.getInstance().otpRequest(
          request: tgPostRequest,
          onSuccess: (response) {
            OTPResponse otpResponse = response;
            if (otpResponse.getOtpResponse().status == RES_SUCCESS) {
              Get.back();
              personallogic.setPassError.value = '';
              personallogic.resetPassError.value = '';
              personallogic.setPasswordController.text = '';
              personallogic.repeatSetPasswordController.text = '';
              getUpdatePasswordBottomSheet(
                onSubmitOTP: (String) {},
                onButtonPress: onPressSetPassword,
                title: 'Set Password',
                isEnable: true.obs,
                isLoading: personallogic.isSetPasswordLoading,
              );
              personallogic.isLoadingEmailOTP.value = false;
            } else {
              personallogic.otpPasswordError.value = otpResponse.getOtpResponse().message ?? '';
              personallogic.isLoadingEmailOTP.value = false;
            }
          },
          onError: (response) => (TGResponse error) {
            personallogic.otpPasswordError.value = "Error in update password";
            personallogic.isLoadingEmailOTP.value = false;
            TGLog.d("Error Occured" + error.httpStatus.toString());
          },
        );
      },
      onChangeOTP: (s) {
        if (s.isEmpty) {
          personallogic.passwordOtp.value =
              personallogic.passwordOtp.value.substring(0, personallogic.passwordOtp.value.length - 1);
        } else {
          personallogic.passwordOtp.value = personallogic.passwordOtp.value + s;
        }
        personallogic.otpPasswordError.value = '';
      },
      onSubmitOTP: (s) {
        personallogic.passwordOtp.value = personallogic.passwordOtp.value + s;
        personallogic.otpPasswordError.value = '';
      },
      isEdit: false.obs,
      subTitle: personallogic.subtitle,
    );
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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h, top: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                              personallogic.onTap(key);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.h, right: 5.h, top: 2.h),
                              child: Icon(
                                Icons.info_outline_rounded,
                                color: ThemeHelper.getInstance()?.unselectedWidgetColor,
                                size: 20.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(() {
                      return AppTextField(
                        isMandatory: true,
                        isObscureText: personallogic.isShowPassword.value,
                        title: AppString.password,
                        controller: personallogic.setPasswordController,
                        hintText: AppString.password,
                        inputType: TextInputType.text,
                        errorText: personallogic.setPassError.value,
                        onChanged: (str) {
                          personallogic.setPassError.value = '';
                        },
                        maxLength: 20,
                        suffix: IconButton(
                          icon: personallogic.isShowPassword.value
                              ? Icon(
                                  Icons.visibility_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                )
                              : Icon(
                                  Icons.visibility_off_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                ),
                          onPressed: () {
                            personallogic.isShowPassword.value = !personallogic.isShowPassword.value;
                          },
                        ),
                      );
                    }),
                    SizedBox(height: 20),
                    Obx(() {
                      return AppTextField(
                        isMandatory: true,
                        isObscureText: personallogic.isShowConfirmPassword.value,
                        title: AppString.reenterPassword,
                        controller: personallogic.repeatSetPasswordController,
                        hintText: AppString.reenterPassword,
                        inputType: TextInputType.text,
                        errorText: personallogic.resetPassError.value,
                        onChanged: (str) {
                          personallogic.resetPassError.value = '';
                        },
                        maxLength: 20,
                        suffix: IconButton(
                          icon: personallogic.isShowConfirmPassword.value
                              ? Icon(
                                  Icons.visibility_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                )
                              : Icon(
                                  Icons.visibility_off_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                ),
                          onPressed: () {
                            personallogic.isShowConfirmPassword.value = !personallogic.isShowConfirmPassword.value;
                          },
                        ),
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
                      isDataLoading: personallogic.isSetPasswordLoading,
                    )
                  ],
                ),
              )
            : Container();
      });
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  Future<void> onPressSetPassword() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (personallogic.setPasswordController.text.isEmpty) {
      personallogic.setPassError.value = "Please enter password";
      personallogic.resetPassError.value = '';
    } else if (personallogic.setPasswordController.text.length < 8) {
      personallogic.resetPassError.value = "";
      personallogic.setPassError.value = 'Invalid password pattern';
    } else if (!validateStructure(personallogic.setPasswordController.text)) {
      personallogic.resetPassError.value = "";
      personallogic.setPassError.value = 'Invalid password pattern';
    } else if (personallogic.repeatSetPasswordController.text.trim().isEmpty ||
        personallogic.setPasswordController.text != personallogic.repeatSetPasswordController.text) {
      personallogic.resetPassError.value = "Password not match with confirm password";
      personallogic.setPassError.value = '';
    } else if (personallogic.repeatSetPasswordController.text.length < 8) {
      personallogic.resetPassError.value = "Invalid password pattern";
      personallogic.setPassError.value = '';
    } else if (!validateStructure(personallogic.repeatSetPasswordController.text)) {
      personallogic.resetPassError.value = "Invalid password pattern";
      personallogic.setPassError.value = '';
    } else {
      personallogic.setPassError.value = '';
      personallogic.resetPassError.value = '';
      personallogic.isSetPasswordLoading.value = true;
      var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
      SetPasswordRequest verifySignupOtpRequest = SetPasswordRequest(
          password: personallogic.setPasswordController.text,
          confirmPassword: personallogic.repeatSetPasswordController.text,
          userId: userId);
      var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
      TGLog.d("SignUpOtpRequest $jsonRequest");
      TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SET_PASSWORD);
      ServiceManager.getInstance().setPassword(
          request: tgPostRequest,
          onSuccess: (respose) => _onsuccsessSetPassword(respose),
          onError: (response) => _onErrorSetPassword(response));
    }
  }

  _onsuccsessSetPassword(SetPasswordResponseMain response) {
    if (response.skippedresponse().status == RES_SUCCESS) {
      Get.back();
      showSnackBar(Get.context!, "Password Updated Successfully");
      personallogic.isSetPasswordLoading.value = false;
    } else {
      TGLog.d("Error in VerifySignupOtpRequest");
      personallogic.isSetPasswordLoading.value = false;

      LoaderUtils.handleErrorResponse(
          Get.context!, response.skippedresponse().status ?? 0, response.skippedresponse().message ?? "", null);
    }
  }

  _onErrorSetPassword(TGResponse response) {
    showSnackBar(Get.context!, "Error Occured with error code " + response.httpStatus.toString());
    Get.back();
    personallogic.isSetPasswordLoading.value = false;
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      required this.hintText,
      this.isShowSuffixIcon = false,
      this.isObscureText = false,
      this.isShowPassword = false,
      this.maxLength = 40,
      this.inputType = TextInputType.text,
      required this.controller,
      this.onChanged,
      this.isReadOnly = false,
      this.isDobField = false,
      this.title = '',
      this.isAutoFocus = false,
      this.prefixText = '',
      required this.isMandatory,
      this.errorText = '',
      this.suffix,
      this.onTap,
      this.textInputFormatter,
      this.shouldInputNamesOnly})
      : super(key: key);
  final String hintText;
  final bool? shouldInputNamesOnly;
  final String title;
  final bool isShowSuffixIcon;
  final bool isObscureText;
  final bool isShowPassword;
  final int maxLength;
  final TextInputType? inputType;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool isReadOnly;
  final bool isMandatory;
  final bool isAutoFocus;
  final String prefixText;
  final String? errorText;
  final bool isDobField;
  final Widget? suffix;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: StyleConfig.mediumText16,
                ),
                if (isMandatory)
                  TextSpan(
                    text: AppString.mandatorySign,
                    style: StyleConfig.mediumText16.copyWith(color: ColorConfig.jsPrimaryColor),
                  ),
              ],
            ),
          ),
        if (title.isNotEmpty)
          SizedBox(
            height: 15.h,
          ),
        TextField(
          controller: controller,
          scrollPadding: EdgeInsets.only(bottom: 300.h),
          obscureText: isObscureText,
          maxLength: maxLength,
          keyboardType: inputType,
          style: StyleConfig.smallText,
          readOnly: isReadOnly,
          cursorColor: ColorConfig.jsLightBlackColor,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffix,
            counterText: AppString.emptyText,
            hintStyle: StyleConfig.smallTextLight,
            prefixIconConstraints: BoxConstraints(minWidth: 24.w, maxHeight: 24.h),
            errorText: errorText!.isEmpty ? null : errorText,
            filled: true,
            prefix: prefixText != ''
                ? Text(
                    prefixText,
                    style: StyleConfig.smallText,
                  )
                : const SizedBox.shrink(),
            fillColor: isReadOnly && !isDobField
                ? ThemeHelper.getInstance()!.colorScheme.surface
                : ThemeHelper.getInstance()!.colorScheme.background,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              borderSide: BorderSide(
                width: 1,
                color: isReadOnly && !isDobField
                    ? ThemeHelper.getInstance()!.colorScheme.surface
                    : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isReadOnly && !isDobField
                      ? ThemeHelper.getInstance()!.colorScheme.surface
                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                  width: 1.0),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConfig.jsRedColor, width: 1.0),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isReadOnly && !isDobField
                      ? ThemeHelper.getInstance()!.colorScheme.surface
                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                  width: 1.0),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          ),
          onChanged: onChanged,
          inputFormatters: textInputFormatter,
          autofocus: isAutoFocus,
          onTap: onTap,
        ),
      ],
    );
  }
}

getBottomSheet({
  required Function(String) onChangeOTP,
  required Function(String) onSubmitOTP,
  Function()? onEdit,
  required Function() onButtonPress,
  required String mobileNumber,
  required String title,
  required RxString subTitle,
  RxString? errorText,
  bool isForBank = false,
  required BuildContext context,
  required PersonalInfoLogic logic,
  required RxBool isEnable,
  required RxBool isLoading,
  required RxBool isEdit,
}) {
  Get.bottomSheet(LayoutBuilder(builder: (context, _) {
    return Obx(() {
      return Container(
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
            Text(
              title.isNotEmpty ? title : AppString.enterOTP,
              style: StyleConfig.semiBoldText16.copyWith(color: ColorConfig.jsLightBlackColor),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${subTitle.value.isNotEmpty ? subTitle.value : AppString.registerMobileNumber}${AppUtils.getMaskedMobileNumber(mobileNumber: mobileNumber)}${isForBank ? AppString.byTheBank : AppString.emptyText}',
              style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: onEdit,
              child: Padding(
                padding: EdgeInsets.all(5.h),
                child: Text(
                  'Edit Email id',
                  style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            if (errorText != null && errorText.value.isNotEmpty)
              SizedBox(
                height: 5.h,
              ),
            if (errorText != null && errorText.value.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    errorText.value ?? '',
                    style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsRedColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            SizedBox(
              height: 20.h,
            ),
            OtpTextField(
              numberOfFields: 6,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              borderColor: ColorConfig.jsLightGreyColor,
              borderRadius: BorderRadius.circular(16.r),
              borderWidth: 1,
              textStyle: StyleConfig.semiBoldText20,
              enabledBorderColor: ColorConfig.jsLightGreyColor,
              focusedBorderColor: ColorConfig.jsLightGreyColor,
              cursorColor: ColorConfig.jsLightBlackColor,
              fieldWidth: 40.r,
              fieldHeight: 40.r,
              showFieldAsBox: true,
              onCodeChanged: onChangeOTP,
              onSubmit: onSubmitOTP,
              // end onSubmit
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Didn't Receive Verification Code Yet? \n",
                    style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsTextDarkGreyColor),
                  ),
                  TextSpan(
                    text: "Resend Verification Code",
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            AppButton(
              onPress: onButtonPress,
              title: AppString.continueText,
              isButtonEnable: isEnable,
              isDataLoading: isLoading,
            )
          ],
        ),
      );
    });
  }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
}

getUpdatePasswordBottomSheet({
  required Function(String) onSubmitOTP,
  required Function() onButtonPress,
  required String title,
  RxString? errorText,
  required PersonalInfoLogic logic,
  required RxBool isEnable,
  required RxBool isLoading,
}) {
  Get.bottomSheet(LayoutBuilder(builder: (context, _) {
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
                  Text(
                    title.isNotEmpty ? title : AppString.enterOTP,
                    style: StyleConfig.semiBoldText16.copyWith(color: ColorConfig.jsLightBlackColor),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppTextField(
                    isMandatory: true,
                    title: AppString.password,
                    controller: logic.setPasswordController,
                    hintText: AppString.password,
                    inputType: TextInputType.text,
                    errorText: "",
                  ),
                  SizedBox(height: 20),
                  AppTextField(
                    isMandatory: true,
                    title: AppString.reenterPassword,
                    controller: logic.repeatSetPasswordController,
                    hintText: AppString.reenterPassword,
                    inputType: TextInputType.text,
                    errorText: "",
                  ),
                  if (errorText != null && errorText.value.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          errorText.value ?? '',
                          style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsRedColor),
                          textAlign: TextAlign.center,
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
                    isButtonEnable: ((logic.setPasswordController.text == logic.repeatSetPasswordController.text) &&
                            logic.setPasswordController.text.length > 8 &&
                            logic.validateStructure(logic.setPasswordController.text))
                        .obs,
                    isDataLoading: false.obs,
                  )
                ],
              ),
            )
          : Container();
    });
  }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
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

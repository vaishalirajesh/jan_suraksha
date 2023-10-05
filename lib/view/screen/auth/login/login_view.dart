import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/auth/Registration/registration_binding.dart';
import 'package:jan_suraksha/view/screen/auth/Registration/registration_view.dart';
import 'package:jan_suraksha/view/screen/auth/login/forgot_password_view.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_binding.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';
import 'package:jan_suraksha/view/widget/app_textfield.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final loginLogic = Get.find<LoginLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScopeAuth,
      child: Scaffold(
        backgroundColor: ColorConfig.jsCreamColor,
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
              ),
              SvgPicture.asset(
                AppImages.jsLogo,
                height: 50.h,
                width: 60.sw,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.janText,
                      style: StyleConfig.boldExtraLargeText,
                    ),
                    TextSpan(
                      text: AppString.surakshaText,
                      style: StyleConfig.boldExtraLargeText.copyWith(color: ColorConfig.jsBlueColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                AppString.insurenceScheme,
                style: StyleConfig.smallText.copyWith(color: ColorConfig.jsTextBlueGreyColor, fontFamily: JSFonts.outfitRegular, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                  child: Column(
                    children: [
                      Obx(() {
                        return AppTextField(
                          hintText: AppString.enterMobileNumber,
                          controller: loginLogic.mobileController,
                          title: AppString.enterMobileNumber,
                          isReadOnly: false,
                          isMandatory: true,
                          isAutoFocus: false,
                          inputType: TextInputType.emailAddress,
                          maxLength: isNumeric(loginLogic.mobile.value, loginLogic) ? 10 : 255,
                          onChanged: loginLogic.onChangeMobile,
                          errorText: loginLogic.mobileError.value,
                        );
                      }),
                      Obx(() {
                        return !isNumeric(loginLogic.mobile.value, loginLogic)
                            ? Padding(
                                padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${AppString.password}',
                                        style: StyleConfig.mediumText16,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => ForgotPasswordPage(), binding: LoginBinding());
                                        },
                                        child: Text(
                                          AppString.forgot_password,
                                          style: StyleConfig.regularExtraSmallBText.copyWith(
                                            color: ColorConfig.jsBlueColor,
                                            fontFamily: JSFonts.outfitRegular,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container();
                      }),
                      Obx(() {
                        return !isNumeric(loginLogic.mobile.value, loginLogic)
                            ? AppTextField(
                                isObscureText: true,
                                hintText: "Enter Password",
                                controller: loginLogic.passwordController,
                                isReadOnly: false,
                                isMandatory: false,
                                isAutoFocus: false,
                                inputType: TextInputType.text,
                                maxLength: 30,
                                onChanged: loginLogic.onChangeMobile,
                                errorText: loginLogic.passwordError.value,
                              )
                            : const SizedBox.shrink();
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Obx(() {
                        return loginLogic.captchaString.value.isNotEmpty
                            ? Row(
                                children: [
                                  SizedBox(width: 0.6.sw, height: 40, child: Image.memory(const Base64Decoder().convert(loginLogic.captchaString.value))),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.refresh,
                                    size: 18,
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Loading Capthca, Please wait",
                                    style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsBlackColor, fontFamily: JSFonts.outfitRegular),
                                  )
                                ],
                              );
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Obx(() {
                        return AppTextField(
                          isObscureText: false,
                          hintText: "Enter Captcha",
                          controller: loginLogic.captchaController,
                          isReadOnly: false,
                          isMandatory: false,
                          isAutoFocus: false,
                          inputType: TextInputType.text,
                          maxLength: 10,
                          onChanged: loginLogic.onChangeCaptcha,
                          errorText: loginLogic.captchError.value,
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Obx(() {
                          return Column(
                            children: [
                              AppButton(
                                onPress: loginLogic.onPressSentOTP,
                                title: "Get Verification code",
                                isButtonEnable: true.obs,
                                isDataLoading: loginLogic.isLoading,
                              ),
                              if (loginLogic.isLoading.value) const SizedBox.shrink(),
                              SizedBox(
                                height: 20.h,
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Don't have an account ? ",
                                      style: StyleConfig.regularText16,
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.offAll(() => const RegistrationPage(), binding: RegistrationBinding());
                                        },
                                      text: "Register",
                                      style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsBlueColor, fontFamily: JSFonts.outfitMedium),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isNumeric(String s, LoginLogic logic) {
    if (s == null) {
      logic.isMobilenumber.value = false;
      return false;
    }
    return double.tryParse(s) != null;
  }
}

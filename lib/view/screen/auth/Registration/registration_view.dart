import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/auth/Registration/registration_logic.dart';

import '../../../widget/app_button.dart';
import '../../../widget/app_textfield.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginLogic = Get.find<RegistrationLogic>();
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
              // SizedBox(
              //   height: 20.h,
              // ),
              // Text(
              //   AppString.startJourneyText,
              //   style: StyleConfig.boldLargeText.copyWith(color: ColorConfig.jsBlackColor),
              // ),
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "Name",
                              style: StyleConfig.regularText16.copyWith(
                                color: ColorConfig.jsBlackColor,
                                fontFamily: JSFonts.outfitRegular,
                              ),
                            ),
                            Text(" *",
                                style: StyleConfig.regularText16.copyWith(
                                  color: ColorConfig.jsPrimaryColor,
                                  fontFamily: JSFonts.outfitRegular,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(() {
                        return AppTextField(
                          hintText: "Enter Name",
                          controller: loginLogic.mobileController,
                          isReadOnly: false,
                          isMandatory: true,
                          isAutoFocus: true,
                          inputType: TextInputType.emailAddress,
                          maxLength: 30,
                          onChanged: loginLogic.onChangeMobile,
                          errorText: loginLogic.errorMsg.value,
                        );
                      }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(() {
                        return !loginLogic.isMobilenumber.value
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Mobile Number",
                                          style: StyleConfig.regularText16.copyWith(
                                            color: ColorConfig.jsBlackColor,
                                            fontFamily: JSFonts.outfitRegular,
                                          ),
                                        ),
                                        Text(" *",
                                            style: StyleConfig.regularText16.copyWith(
                                              color: ColorConfig.jsPrimaryColor,
                                              fontFamily: JSFonts.outfitRegular,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container();
                      }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(() {
                        return !loginLogic.isMobilenumber.value
                            ? AppTextField(
                                isObscureText: true,
                                hintText: "Enter Mobile Number",
                                controller: loginLogic.passwordController,
                                isReadOnly: false,
                                isMandatory: false,
                                isAutoFocus: true,
                                inputType: TextInputType.text,
                                maxLength: 10,
                                onChanged: loginLogic.onChangeMobile,
                                errorText: loginLogic.errorMsg.value,
                              )
                            : Container();
                      }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(() {
                        return loginLogic.captchaString.value.isNotEmpty
                            ? Row(
                                children: [
                                  SizedBox(width: 0.6.sw, height: 40, child: Image.memory(Base64Decoder().convert(loginLogic.captchaString.value))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.refresh,
                                    size: 18,
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(),
                                  ),
                                  SizedBox(
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
                        height: 15.h,
                      ),
                      AppTextField(
                        isObscureText: true,
                        hintText: "Enter Captcha",
                        controller: loginLogic.captchaController,
                        isReadOnly: false,
                        isMandatory: false,
                        isAutoFocus: true,
                        inputType: TextInputType.text,
                        maxLength: 10,
                        onChanged: loginLogic.onChangeCaptcha,
                        errorText: loginLogic.errorMsg.value,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              AppButton(
                                onPress: loginLogic.onPressSentOTP,
                                title: "Get Verification code",
                                isButtonEnable: false.obs,
                                isDataLoading: loginLogic.isLoading,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(LoginPageRoute);
                                },
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Already have and account ? ",
                                        style: StyleConfig.regularText16,
                                      ),
                                      TextSpan(
                                        text: "Login",
                                        style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsBlueColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
}

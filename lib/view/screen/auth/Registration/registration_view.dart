import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';

import '../../../../config/color_config.dart';
import '../../../../config/font_config.dart';
import '../../../../config/navigation_config.dart';
import '../../../../config/style_config.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_button.dart';
import '../../../widget/app_textfield.dart';
import '../../../widget/appbar_with_title.dart';
import 'registration_logic.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  final logic = Get.find<RegistrationLogic>();

  @override
  Widget build(BuildContext context) {
    return ConstrainedFlexView(
      1.sh,
      axis: Axis.vertical,
      child: Scaffold(
        backgroundColor: ColorConfig.jsWhiteColor,
        appBar: CommonAppBar.appbarWithoutTitleAndBackButton(title: "Register"),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: ColorConfig.jsCreamColor,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorConfig.jsWhiteColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        )),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   height: 20.h,
                            // ),
                            // Text(
                            //   AppString.startJourneyText,
                            //   style: StyleConfig.boldLargeText.copyWith(color: ColorConfig.jsBlackColor),
                            // ),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Name",
                                style: StyleConfig.regularText16.copyWith(
                                  color: ColorConfig.jsBlackColor,
                                  fontFamily: JSFonts.outfitRegular,
                                ),
                              ),
                            ),
                            Obx(() {
                              return AppTextField(
                                hintText: AppString.enterMobileNumber,
                                controller: logic.namecontroller,
                                isReadOnly: false,
                                isMandatory: true,
                                isAutoFocus: true,
                                inputType: TextInputType.text,
                                maxLength: 10,
                                onChanged: logic.onChangeMobile,
                                errorText: logic.errorMsg.value,
                              );
                            }),
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppString.mobileNumber,
                                style: StyleConfig.regularText16.copyWith(
                                  color: ColorConfig.jsBlackColor,
                                  fontFamily: JSFonts.outfitRegular,
                                ),
                              ),
                            ),
                            Obx(() {
                              return AppTextField(
                                hintText: AppString.enterMobileNumber,
                                controller: logic.mobileController,
                                isReadOnly: false,
                                isMandatory: true,
                                isAutoFocus: true,
                                inputType: TextInputType.text,
                                maxLength: 10,
                                onChanged: logic.onChangeMobile,
                                errorText: logic.errorMsg.value,
                              );
                            }),
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email Address",
                                style: StyleConfig.regularText16.copyWith(
                                  color: ColorConfig.jsBlackColor,
                                  fontFamily: JSFonts.outfitRegular,
                                ),
                              ),
                            ),
                            Obx(() {
                              return AppTextField(
                                hintText: AppString.enterMobileNumber,
                                controller: logic.emailAddressController,
                                isReadOnly: false,
                                isMandatory: true,
                                isAutoFocus: true,
                                inputType: TextInputType.text,
                                maxLength: 10,
                                onChanged: logic.onChangeMobile,
                                errorText: logic.errorMsg.value,
                              );
                            }),
                            SizedBox(
                              height: 15.h,
                            ),
                            Obx(() {
                              return !logic.isMobilenumber.value
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppString.password,
                                            style: StyleConfig.regularText16.copyWith(
                                              color: ColorConfig.jsBlackColor,
                                              fontFamily: JSFonts.outfitRegular,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppString.forgot_password,
                                            style: StyleConfig.regularExtraSmallBText.copyWith(
                                              color: ColorConfig.jsBlueColor,
                                              fontFamily: JSFonts.outfitRegular,
                                            ),
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
                              return logic.captchaString.value.isNotEmpty
                                  ? Row(
                                      children: [
                                        SizedBox(width: 0.6.sw, height: 40, child: Image.memory(const Base64Decoder().convert(logic.captchaString.value))),
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
                              height: 15.h,
                            ),
                            AppTextField(
                              isObscureText: true,
                              hintText: "Enter Captcha",
                              controller: logic.captchaController,
                              isReadOnly: false,
                              isMandatory: false,
                              isAutoFocus: true,
                              inputType: TextInputType.text,
                              maxLength: 10,
                              onChanged: logic.onChangeCaptcha,
                              errorText: logic.errorMsg.value,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    AppButton(
                                      onPress: logic.onPressSentOTP,
                                      title: "Get Verification code",
                                      isButtonEnable: false.obs,
                                      isDataLoading: logic.isLoading,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Already have an account ? ",
                                            style: StyleConfig.regularText16,
                                          ),
                                          TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Get.toNamed(RegistrationPageRoute);
                                              },
                                            text: "Login",
                                            style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsBlueColor),
                                          ),
                                        ],
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

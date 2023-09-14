import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';
import 'package:jan_suraksha/view/widget/appbar_with_title.dart';
import 'package:jan_suraksha/view/widget/custom_otp_field/custom_otp_field.dart';

import 'verify_otp_logic.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verifyOtpLogic = Get.find<VerifyOtpLogic>();

    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: Scaffold(
        extendBody: true,
        appBar: CommonAppBar.appbarWithTitle(title: AppString.emptyText, onBackPress: AppUtils.onBackPress),
        body: SizedBox(
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: ColorConfig.jsCreamColor,
                padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppString.fetchOTP,
                          style: StyleConfig.semiBoldText20.copyWith(color: ColorConfig.jsLightBlackColor),
                        ),
                        TextSpan(
                          text: '${AppString.fetchOTPMobile}${verifyOtpLogic.mobile.value}',
                          style: StyleConfig.semiBoldText20.copyWith(color: ColorConfig.jsPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OtpTextField(
                        numberOfFields: 4,
                        mainAxisAlignment: MainAxisAlignment.start,
                        borderColor: ColorConfig.jsLightGreyColor,
                        borderRadius: BorderRadius.circular(16.r),
                        borderWidth: 1,
                        textStyle: StyleConfig.semiBoldText20,
                        enabledBorderColor: ColorConfig.jsLightGreyColor,
                        focusedBorderColor: ColorConfig.jsLightGreyColor,
                        cursorColor: ColorConfig.jsLightBlackColor,
                        fieldWidth: 50.r,
                        fieldHeight: 55.r,
                        showFieldAsBox: true,
                        onCodeChanged: verifyOtpLogic.onChangeOTP,
                        onSubmit: verifyOtpLogic.onSubmitOTP,
                      ),
                      Obx(() {
                        return !verifyOtpLogic.isValideOTP.value
                            ? Text(
                                'Please enter valid otp',
                                style: StyleConfig.regularExtraSmallText.copyWith(color: Colors.red),
                              )
                            : const SizedBox.shrink();
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppString.notReceiveCode,
                                style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsTextDarkGreyColor),
                              ),
                              TextSpan(
                                text: AppString.resendCode,
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      AppButton(
                        onPress: verifyOtpLogic.onPressSubmit,
                        title: AppString.submit,
                        isButtonEnable: true.obs,
                        isDataLoading: verifyOtpLogic.isLoading,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

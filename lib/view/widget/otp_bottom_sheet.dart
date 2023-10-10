import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';

import 'custom_otp_field/custom_otp_field.dart';
import 'jumpingdot_util.dart';

class OTPBottomSheet {
  static getBottomSheet({
    required Function(String) onChangeOTP,
    required Function(String) onSubmitOTP,
    required Function() onButtonPress,
    required String mobileNumber,
    required String title,
    required String subTitle,
    bool isForBank = false,
    RxString? errorText,
    required BuildContext context,
    required RxBool isEnable,
    required RxBool isLoading,
  }) {
    Get.bottomSheet(LayoutBuilder(builder: (context, _) {
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
              '${subTitle.isNotEmpty ? subTitle : AppString.registerMobileNumber}${AppUtils.getMaskedMobileNumber(mobileNumber: mobileNumber)}${isForBank ? AppString.byTheBank : AppString.emptyText}',
              style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
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
              onSubmit: (str) {
                onButtonPress();
              },
              // end onSubmit
            ),
            Obx(() {
              return errorText != null && errorText.value.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            errorText.value ?? '',
                            style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsRedColor),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox();
            }),
            SizedBox(
              height: 10.h,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppString.notReceiveCode,
                    style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsTextDarkGreyColor),
                  ),
                  TextSpan(
                    text: AppString.resendOTP,
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            if (isLoading.value)
              Obx(() {
                return isLoading.value
                    ? JumpingDots(
                        color: ColorConfig.jsPrimaryColor,
                        radius: 7,
                      )
                    : const SizedBox();
              }),
            if (isLoading.value)
              SizedBox(
                height: 15.h,
              ),
          ],
        ),
      );
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  static getBottomSheet1({
    required Function(String) onChangeOTP,
    required Function(String) onSubmitOTP,
    required Function() onButtonPress,
    required String mobileNumber,
    required String title,
    required String subTitle,
    bool isForBank = false,
    RxString? errorText,
    required BuildContext context,
    required RxBool isEnable,
    required RxBool isLoading,
  }) {
    Get.bottomSheet(LayoutBuilder(builder: (context, _) {
      return AbsorbPointer(
        absorbing: isLoading.value,
        child: Container(
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
                title.isNotEmpty ? title : AppString.enterverificationCode,
                style: StyleConfig.semiBoldText16.copyWith(color: ColorConfig.jsLightBlackColor),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '${subTitle.isNotEmpty ? subTitle : AppString.registerMobileNumber1}${AppUtils.getMaskedMobileNumber(mobileNumber: mobileNumber)}${isForBank ? AppString.byTheBank : AppString.emptyText}',
                style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
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
                onSubmit: (str) {
                  onButtonPress();
                },
                // end onSubmit
              ),
              Obx(() {
                return errorText != null && errorText.value.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              errorText.value ?? '',
                              style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsRedColor),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      )
                    : SizedBox();
              }),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.notReceiveCode,
                      style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsTextDarkGreyColor),
                    ),
                    TextSpan(
                      text: AppString.resendCode1,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              if (isLoading.value)
                Obx(() {
                  return isLoading.value
                      ? JumpingDots(
                          color: ColorConfig.jsPrimaryColor,
                          radius: 7,
                        )
                      : const SizedBox();
                }),
              if (isLoading.value)
                SizedBox(
                  height: 15.h,
                ),
            ],
          ),
        ),
      );
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }
}

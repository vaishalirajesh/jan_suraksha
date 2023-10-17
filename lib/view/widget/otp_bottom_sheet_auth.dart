import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';

import 'custom_otp_field/custom_otp_field.dart';
import 'jumpingdot_util.dart';
import 'timer/timer_count_down.dart';

NumberFormat formatter = NumberFormat("00");

class OTPBottomSheetAuth {
  static getBottomSheet({
    required Function(String) onChangeOTP,
    required Function(String) onSubmitOTP,
    Function()? onEdit,
    Function()? onFinish,
    Function()? onResend,
    required Function() onButtonPress,
    required String mobileNumber,
    required String title,
    required RxString subTitle,
    required RxString timerText,
    RxString? errorText,
    bool isForBank = false,
    bool isForOptOUt = false,
    required BuildContext context,
    required RxBool isEnable,
    required RxBool isLoading,
    required RxBool isEdit,
  }) {
    Get.bottomSheet(LayoutBuilder(builder: (context, _) {
      return Obx(() {
        return AbsorbPointer(
          absorbing: isLoading.value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
              color: ColorConfig.jsCardBgColor,
            ),
            child: Stack(
              children: [
                Padding(
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
                      isForOptOUt
                          ? Text(
                              subTitle.value.isNotEmpty ? subTitle.value : "",
                              style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              '${subTitle.value.isNotEmpty ? subTitle.value : AppString.registerMobileNumber}${AppUtils.getMaskedMobileNumber(mobileNumber: mobileNumber)}${isForBank ? AppString.byTheBank : AppString.emptyText}',
                              style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                              textAlign: TextAlign.center,
                            ),
                      if (isEdit.value)
                        SizedBox(
                          height: 5.h,
                        ),
                      if (isEdit.value)
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
                      if (errorText != null && errorText.value.isNotEmpty)
                        SizedBox(
                          height: 5.h,
                        ),
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
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Didn't Receive Verification Code Yet? ",
                              style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsTextDarkGreyColor),
                            ),
                          ],
                        ),
                      ),
                      isEnable.value
                          ? InkWell(
                              onTap: onResend,
                              child: Text(
                                "Resend Verification Code",
                                style: StyleConfig.regularText16.copyWith(
                                  color: ColorConfig.jsPrimaryColor,
                                ),
                              ),
                            )
                          : Countdown(
                              seconds: 10,
                              build: (BuildContext context, double time) => Text(
                                time > 60
                                    ? "Resend Verification Code in 01:${formatter.format(time.round() - 60)} minutes"
                                    : "Resend Verification Code in 00:${formatter.format(time.round())} minutes",
                                style: StyleConfig.regularText16.copyWith(
                                  color: ColorConfig.jsTextDarkGreyColor,
                                ),
                              ),
                              interval: const Duration(seconds: 1),
                              onFinished: onFinish,
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
              ],
            ),
          ),
        );
      });
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }
}

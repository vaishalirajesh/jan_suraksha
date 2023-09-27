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

class OTPBottomSheetAuth {
  static getBottomSheet({
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
                onSubmit: onSubmitOTP,
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
    }), isDismissible: true, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }
}

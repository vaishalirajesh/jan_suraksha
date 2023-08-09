import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/view/widget/custom_otp_field/custom_otp_field.dart';

class OTPInputField extends StatelessWidget {
  OTPInputField({Key? key, required this.onChangeOTP, required this.onSubmitOTP}) : super(key: key);
  Function(String) onChangeOTP;
  Function(String) onSubmitOTP;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
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
      onCodeChanged: onChangeOTP,
      onSubmit: onSubmitOTP,
      // end onSubmit
    );
  }
}

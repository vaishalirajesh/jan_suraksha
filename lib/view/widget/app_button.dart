import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gstmobieservice_marketplace/util/jumpingdot_util.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';

// Common button widget
class AppButton extends StatelessWidget {
  AppButton(
      {Key? key, required this.onPress, required this.title, required this.isButtonEnable, required this.isDataLoading})
      : super(key: key);
  final VoidCallback onPress;
  final String title;
  RxBool isButtonEnable = true.obs;
  RxBool isDataLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: 1.sw,
      child: ElevatedButton(
        onPressed: isButtonEnable.value ? onPress : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConfig.jsPrimaryColor,
          disabledBackgroundColor: ColorConfig.jsPrimaryDisableColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
        child: isDataLoading.value
            ? JumpingDots(
                color: ColorConfig.jsWhiteColor,
                radius: 7,
              )
            : Text(
                title,
                style: isButtonEnable.value
                    ? StyleConfig.regularWhiteText16
                    : StyleConfig.regularWhiteText16.copyWith(color: ColorConfig.jsLightBlackColor),
              ),
      ),
    );
  }
}

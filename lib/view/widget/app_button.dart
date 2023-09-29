import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';

import 'jumpingdot_util.dart';

// Common button widget
class AppButton extends StatelessWidget {
  AppButton({Key? key, required this.onPress, required this.title, required this.isButtonEnable, required this.isDataLoading}) : super(key: key);
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
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConfig.jsPrimaryColor,
          disabledBackgroundColor: ColorConfig.jsGreyDisableColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
        child: Obx(() {
          return isDataLoading.value
              ? JumpingDots(
                  color: ColorConfig.jsWhiteColor,
                  radius: 7,
                )
              : Text(
                  title,
                  style: isButtonEnable.value ? StyleConfig.regularWhiteText16 : StyleConfig.regularWhiteText16,
                );
        }),
      ),
    );
  }
}

class ListViewButtons extends StatelessWidget {
  ListViewButtons({Key? key, required this.onPress, required this.title, this.width}) : super(key: key);
  final VoidCallback onPress;
  final String title;
  final double? width;
  RxBool isButtonEnable = true.obs;
  RxBool isDataLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      width: width ?? 0.8.sw,
      child: ElevatedButton(
        onPressed: isButtonEnable.value ? onPress : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConfig.jsPrimaryColor,
          disabledBackgroundColor: ColorConfig.jsPrimaryDisableColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
        child: Text(title, style: StyleConfig.regularWhiteText16.copyWith(fontSize: 12.sp)),
      ),
    );
  }
}

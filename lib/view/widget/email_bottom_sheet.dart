import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';

import 'app_textfield.dart';

class OTPBottomSheetEmail {
  static getBottomSheet({
    required Function(String) onChangeOTP,
    required Function(String) onSubmitOTP,
    required Function() onButtonPress,
    required Function() notNow,
    required String title,
    bool isForBank = false,
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
              height: 30.h,
            ),
            AppTextField(
              isMandatory: true,
              title: AppString.emailAddress,
              controller: TextEditingController(),
              hintText: AppString.emailAddress,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20.h,
            ),
            AppButton(
              onPress: onButtonPress,
              title: "Update",
              isButtonEnable: isEnable,
              isDataLoading: isLoading,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Not Now',
              style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
            )
          ],
        ),
      );
    }), isDismissible: true, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }
}

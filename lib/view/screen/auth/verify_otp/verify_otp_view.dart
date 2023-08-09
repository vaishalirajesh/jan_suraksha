import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_name.dart';

import 'verify_otp_logic.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verifyOtpLogic = Get.find<VerifyOtpLogic>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConfig.jsCreamColor,
        extendBody: true,
        body: SizedBox(
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SvgPicture.asset(
                  AppImages.jsLogo,
                  height: 90.h,
                  width: 100.sw,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppString.startJourneyText,
                  style: StyleConfig.boldLargeText.copyWith(color: ColorConfig.jsBlackColor),
                ),
                const AppName(),
                SizedBox(
                  height: 40.h,
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     AppString.mobileNumber,
                //     style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
                //   ),
                // ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                // Obx(() {
                //   return AppButton(
                //     onPress: loginLogic.onPressSentOTP,
                //     title: AppString.sentOTP,
                //     isButtonEnable: loginLogic.mobile.value.length >= 10 ? true.obs : false.obs,
                //     isDataLoading: false.obs,
                //   );
                // })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

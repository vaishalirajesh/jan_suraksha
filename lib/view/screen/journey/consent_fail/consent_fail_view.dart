import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';

import 'consent_fail_logic.dart';

class ConsentFailPage extends StatelessWidget {
  const ConsentFailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final consentFailLogic = Get.find<ConsentFailLogic>();
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Scaffold(
        backgroundColor: ColorConfig.jsCreamColor,
        body: SizedBox(
          height: 1.sh,
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                SvgPicture.asset(AppImages.error),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Oops!",
                  style: StyleConfig.boldLargeText.copyWith(color: ColorConfig.jsPrimaryColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'The transaction seems to have failed due to insufficient funds. Please ensure you have sufficient funds in the account and try again.',
                  style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextGreyColor),
                  textAlign: TextAlign.center,
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
          child: AppButton(
            onPress: consentFailLogic.onPressTryAgain,
            title: "Try Again",
            isButtonEnable: true.obs,
            isDataLoading: false.obs,
          ),
        ),
      ),
    );
  }
}

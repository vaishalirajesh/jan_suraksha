import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';
import 'package:jan_suraksha/view/widget/app_textfield.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginLogic = Get.find<LoginLogic>();
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScopeAuth,
      child: Scaffold(
        backgroundColor: ColorConfig.jsCreamColor,
        extendBody: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                SvgPicture.asset(
                  AppImages.jsLogo,
                  height: 50.h,
                  width: 60.sw,
                ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Text(
                //   AppString.startJourneyText,
                //   style: StyleConfig.boldLargeText.copyWith(color: ColorConfig.jsBlackColor),
                // ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppString.janText,
                        style: StyleConfig.boldExtraLargeText,
                      ),
                      TextSpan(
                        text: AppString.surakshaText,
                        style: StyleConfig.boldExtraLargeText.copyWith(color: ColorConfig.jsBlueColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  AppString.insurenceScheme,
                  style: StyleConfig.smallText.copyWith(
                      color: ColorConfig.jsTextBlueGreyColor,
                      fontFamily: JSFonts.outfitRegular,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppString.mobileNumber,
                    style: StyleConfig.regularText16.copyWith(
                      color: ColorConfig.jsPrimaryColor,
                      fontFamily: JSFonts.outfitRegular,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Obx(() {
                  return AppTextField(
                    hintText: AppString.enterMobileNumber,
                    controller: loginLogic.mobileController,
                    isReadOnly: false,
                    isMandatory: false,
                    isAutoFocus: true,
                    inputType: TextInputType.phone,
                    maxLength: 10,
                    onChanged: loginLogic.onChangeMobile,
                    prefixText: '+91  ',
                    errorText: loginLogic.errorMsg.value,
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                AppButton(
                  onPress: loginLogic.onPressSentOTP,
                  title: AppString.sentOTP,
                  isButtonEnable: true.obs,
                  isDataLoading: loginLogic.isLoading,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

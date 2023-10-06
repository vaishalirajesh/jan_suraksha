import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/auth/Registration/registration_binding.dart';
import 'package:jan_suraksha/view/screen/auth/Registration/registration_view.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';
import 'package:jan_suraksha/view/widget/app_textfield.dart';

import 'login_logic.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final forgotPasswordLogic = Get.find<LoginLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: Scaffold(
        backgroundColor: ColorConfig.jsWhiteColor,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: ColorConfig.jsCreamColor,
                width: 1.sw,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Forgot Password ?",
                      style: StyleConfig.semiBoldText18,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Verification Code will be sent to ',
                      style: StyleConfig.regularExtraSmallPinkText,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'registered Email Address',
                      style: StyleConfig.regularExtraSmallPinkText,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return AppTextField(
                          hintText: 'Enter Email Address',
                          controller: forgotPasswordLogic.forgotEmailController,
                          title: AppString.enterEmailAddress,
                          isReadOnly: false,
                          isMandatory: true,
                          isAutoFocus: false,
                          inputType: TextInputType.emailAddress,
                          maxLength: 255,
                          errorText: forgotPasswordLogic.forgotEmailError.value,
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: AppButton(
                          onPress: forgotPasswordLogic.getForgotEmail,
                          title: "Get Verification code",
                          isButtonEnable: true.obs,
                          isDataLoading: forgotPasswordLogic.isPasswordAPICall,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      buildRowWidget("Atleast 8 characters and atmost 20 characters "),
                      buildRowWidget("Atleast 1 number (e.g., 1,2,3, etc.) "),
                      buildRowWidget("Atleast 1 capital case alphabet (e.g., A, B, C, etc.) "),
                      buildRowWidget("Atleast 1 small case alphabet (e.g., a, b, c, etc.) "),
                      buildRowWidget("Atleast 1 special character (e.g., @, #, %, etc.)"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.h,
              ),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account ? ",
                      style: StyleConfig.regularText16,
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAll(() => const RegistrationPage(), binding: RegistrationBinding());
                        },
                      text: "Register",
                      style: StyleConfig.regularText16
                          .copyWith(color: ColorConfig.jsBlueColor, fontFamily: JSFonts.outfitMedium),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRowWidget(String str) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: ColorConfig.jsLightGreenColor,
            size: 18.r,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              str,
              style: StyleConfig.smallText.copyWith(color: ColorConfig.jsTextMediumGreyColor),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }

  bool isNumeric(String s, LoginLogic logic) {
    if (s == null) {
      logic.isMobilenumber.value = false;
      return false;
    }
    logic.isMobilenumber.value = true;
    return double.tryParse(s) != null;
  }
}

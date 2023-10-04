import 'dart:convert';

import 'package:flutter/gestures.dart';
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
import 'package:jan_suraksha/view/screen/auth/Registration/registration_logic.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_binding.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_view.dart';

import '../../../../utils/theme_helper.dart';
import '../../../widget/app_button.dart';
import '../../../widget/app_textfield.dart';
import '../../../widget/pdfviewfile.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpLogic = Get.find<RegistrationLogic>();
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScopeAuth,
      child: Scaffold(
        backgroundColor: ColorConfig.jsCreamColor,
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              SvgPicture.asset(
                AppImages.jsLogo,
                height: 50.h,
                width: 60.sw,
              ),
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
                height: 30.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.h, top: 15.h, bottom: 25.h),
                  child: Column(
                    children: [
                      Obx(() {
                        return AppTextField(
                          hintText: "Enter Name",
                          controller: signUpLogic.nameController,
                          isReadOnly: false,
                          isMandatory: true,
                          isAutoFocus: false,
                          title: 'Name',
                          inputType: TextInputType.emailAddress,
                          maxLength: 30,
                          onChanged: signUpLogic.onChangeMobile,
                          errorText: signUpLogic.nameError.value,
                        );
                      }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(() {
                        return AppTextField(
                          isObscureText: false,
                          hintText: "Enter Mobile Number",
                          title: "Enter Mobile Number",
                          controller: signUpLogic.mobileController,
                          isReadOnly: false,
                          isMandatory: true,
                          isAutoFocus: false,
                          inputType: TextInputType.number,
                          maxLength: 10,
                          onChanged: signUpLogic.onChangeMobile,
                          errorText: signUpLogic.mobileError.value,
                        );
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Obx(() {
                        return signUpLogic.captchaString.value.isNotEmpty
                            ? Row(
                                children: [
                                  SizedBox(
                                      width: 0.6.sw,
                                      height: 40,
                                      child: Image.memory(Base64Decoder().convert(signUpLogic.captchaString.value))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.refresh,
                                    size: 18,
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Loading Capthca, Please wait",
                                    style: StyleConfig.regularText16
                                        .copyWith(color: ColorConfig.jsBlackColor, fontFamily: JSFonts.outfitRegular),
                                  )
                                ],
                              );
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Obx(() {
                        return AppTextField(
                          isObscureText: false,
                          hintText: "Enter Captcha",
                          controller: signUpLogic.captchaController,
                          isReadOnly: false,
                          isMandatory: false,
                          isAutoFocus: false,
                          inputType: TextInputType.text,
                          maxLength: 10,
                          onChanged: signUpLogic.onChangeCaptcha,
                          errorText: signUpLogic.captchError.value,
                        );
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            return SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Theme(
                                data: ThemeData(useMaterial3: true),
                                child: Checkbox(
                                  checkColor: ThemeHelper.getInstance()!.colorScheme.background,
                                  activeColor: ThemeHelper.getInstance()!.primaryColor,
                                  value: signUpLogic.isCheckedFirst.value,
                                  onChanged: (isConfirm) {
                                    signUpLogic.isCheckedFirst.value = isConfirm!;
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.r),
                                    ),
                                  ),
                                  side: BorderSide(
                                    width: 1,
                                    color: signUpLogic.isCheckedFirst.value
                                        ? ThemeHelper.getInstance()!.primaryColor
                                        : ThemeHelper.getInstance()!.disabledColor,
                                  ),
                                ),
                              ),
                            );
                          }),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text.rich(TextSpan(
                                    text: "I Accept the ",
                                    style: StyleConfig.smallText,
                                    children: <InlineSpan>[
                                      TextSpan(
                                          text: "Privacy Policy, ",
                                          style: StyleConfig.smallText.copyWith(color: ColorConfig.jsBlueColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(builder: (context) => MyStatefulWidget("1")));

//                                               final pdfController = PdfController(
//                                                 document: PdfDocument.openAsset('assets/files/jansuraksh_privacy_policy.pdf'),
//                                               );
//
// // Simple Pdf view with one render of page (loose quality on zoom)
//                                               PdfView(
//                                                 controller: pdfController,
//                                               );
                                            }),
                                      TextSpan(
                                          text: "Terms & Conditions ",
                                          style: StyleConfig.smallText.copyWith(color: ColorConfig.jsBlueColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(builder: (context) => MyStatefulWidget("2")));
                                            }),
                                      TextSpan(
                                        text: "and ",
                                        style: StyleConfig.smallText,
                                      ),
                                      TextSpan(
                                          text: "Disclaimers",
                                          style: StyleConfig.smallText.copyWith(color: ColorConfig.jsBlueColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(builder: (context) => MyStatefulWidget("3")));
                                            }),
                                    ])),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            AppButton(
                              onPress: signUpLogic.onPressSentOTP,
                              title: "Get Verification code",
                              isButtonEnable: true.obs,
                              isDataLoading: signUpLogic.isLoading,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAll(() => LoginPage(), binding: LoginBinding());
                              },
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have and account ? ",
                                      style: StyleConfig.regularText16,
                                    ),
                                    TextSpan(
                                      text: "Login",
                                      style: StyleConfig.regularText16
                                          .copyWith(color: ColorConfig.jsBlueColor, fontFamily: JSFonts.outfitMedium),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

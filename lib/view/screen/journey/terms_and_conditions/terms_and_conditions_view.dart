import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import 'terms_and_conditions_logic.dart';

class TermsAndConditionsPage extends StatelessWidget {
  TermsAndConditionsPage({Key? key}) : super(key: key);

  final termsAndConditionsLogic = Get.find<TermsAndConditionsLogic>();

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
      appbarName: AppString.appBarWithTitle,
      title: AppString.termAndCondition,
      buttonTitle: AppString.iAgree,
      onButtonClick: termsAndConditionsLogic.onPressButton,
      isDataLoading: false,
      isButtonEnable: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    AppImages.jsLogo,
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppString.janText,
                          style: StyleConfig.semiBoldText24.copyWith(color: ColorConfig.jsPrimaryColor),
                        ),
                        TextSpan(
                          text: AppString.surakshaText,
                          style: StyleConfig.semiBoldText24.copyWith(color: ColorConfig.jsBlueColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppString.termAndCondition,
                style: StyleConfig.semiBoldText20,
              ),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.tcText1,
                      style: StyleConfig.smallTextGrey,
                    ),
                    TextSpan(
                      text: AppString.tcText2,
                      style: StyleConfig.smallTextGrey.copyWith(color: ColorConfig.jsPrimaryColor),
                    ),
                    TextSpan(
                      text: AppString.tcText3,
                      style: StyleConfig.smallTextGrey,
                    ),
                    TextSpan(
                      text: AppString.tcText2,
                      style: StyleConfig.smallTextGrey.copyWith(
                        color: ColorConfig.jsLightBlackColor,
                        fontFamily: JSFonts.outfitBold,
                      ),
                    ),
                    TextSpan(
                      text: AppString.tcText3,
                      style: StyleConfig.smallTextGrey,
                    ),
                    TextSpan(
                      text: AppString.tcText2,
                      style: StyleConfig.smallTextGrey.copyWith(
                        color: ColorConfig.jsLightBlackColor,
                        fontFamily: JSFonts.outfitBold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.tcText1,
                      style: StyleConfig.smallTextGrey,
                    ),
                    TextSpan(
                      text: AppString.tcText2,
                      style: StyleConfig.smallTextGrey.copyWith(
                        color: ColorConfig.jsLightBlackColor,
                        fontFamily: JSFonts.outfitBold,
                      ),
                    ),
                    TextSpan(
                      text: AppString.tcText3,
                      style: StyleConfig.smallTextGrey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppString.tcText2,
                style: StyleConfig.smallTextGrey,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppString.tcText2,
                style: StyleConfig.smallTextGrey,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppString.tcText2,
                style: StyleConfig.smallTextGrey,
              ),
              Text(
                AppString.tcText2,
                style: StyleConfig.smallTextGrey.copyWith(
                  color: ColorConfig.jsLightBlackColor,
                  fontFamily: JSFonts.outfitBold,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppString.tcText2,
                style: StyleConfig.smallTextGrey,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppString.tcText2,
                style: StyleConfig.smallTextGrey
                    .copyWith(color: ColorConfig.jsPrimaryColor, fontFamily: JSFonts.outfitBold),
              ),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.tcText1,
                      style: StyleConfig.smallText,
                    ),
                    TextSpan(
                      text: AppString.tcText2,
                      style: StyleConfig.smallText.copyWith(
                        color: ColorConfig.jsLightBlackColor,
                        fontFamily: JSFonts.outfitBold,
                      ),
                    ),
                    TextSpan(
                      text: AppString.tcText3,
                      style: StyleConfig.smallText,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.tcText1,
                      style: StyleConfig.smallText,
                    ),
                    TextSpan(
                      text: AppString.tcText2,
                      style: StyleConfig.smallText.copyWith(
                        color: ColorConfig.jsLightBlackColor,
                        fontFamily: JSFonts.outfitBold,
                      ),
                    ),
                    TextSpan(
                      text: AppString.tcText3,
                      style: StyleConfig.smallText,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.tcText1,
                      style: StyleConfig.smallText,
                    ),
                    TextSpan(
                      text: AppString.tcText2,
                      style: StyleConfig.smallText.copyWith(
                        color: ColorConfig.jsLightBlackColor,
                        fontFamily: JSFonts.outfitBold,
                      ),
                    ),
                    TextSpan(
                      text: AppString.tcText3,
                      style: StyleConfig.smallText,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.tcText1,
                      style: StyleConfig.smallText,
                    ),
                    TextSpan(
                      text: AppString.tcText2,
                      style: StyleConfig.smallText.copyWith(
                        color: ColorConfig.jsLightBlackColor,
                        fontFamily: JSFonts.outfitBold,
                      ),
                    ),
                    TextSpan(
                      text: AppString.tcText3,
                      style: StyleConfig.smallText,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppString.tcText2,
                style: StyleConfig.smallText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

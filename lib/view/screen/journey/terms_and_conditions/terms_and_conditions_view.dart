import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';
import 'package:webviewx/webviewx.dart';

import 'terms_and_conditions_logic.dart';

class TermsAndConditionsPage extends StatelessWidget {
  TermsAndConditionsPage({Key? key}) : super(key: key);

  final termsAndConditionsLogic = Get.find<TermsAndConditionsLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitle,
              title: AppString.termAndCondition,
              buttonTitle: AppString.iAgree,
              onButtonClick: termsAndConditionsLogic.onPressContinue,
              onBackButtonCLick: AppUtils.onBackToDashboard,
              isDataLoading: termsAndConditionsLogic.isLoading.value,
              isButtonEnable: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                  style: StyleConfig.semiBoldText24.copyWith(color: ColorConfig.jsPrimaryColor, fontSize: 26),
                                ),
                                TextSpan(
                                  text: AppString.surakshaText,
                                  style: StyleConfig.semiBoldText24.copyWith(color: ColorConfig.jsBlueColor, fontSize: 26),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // Text(
                      //   AppString.termAndCondition,
                      //   style: StyleConfig.semiBoldText20,
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      if (termsAndConditionsLogic.isDataLoaded.value)
                        WebViewX(
                          initialContent: termsAndConditionsLogic.content,
                          initialSourceType: SourceType.html,
                          javascriptMode: JavascriptMode.unrestricted,
                          key: const ValueKey('webviewx'),
                          width: 1.sw,
                          height: 3.sh,
                          onWebResourceError: (error) {
                            TGLog.d(error);
                          },
                          onPageStarted: (src) {
                            TGLog.d("Page Started $src");
                          },
                          onPageFinished: (src) {
                            TGLog.d("Page Finished $src");
                          },
                        )
                      // RichText(
                      //   textAlign: TextAlign.start,
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: AppString.tcText1,
                      //         style: StyleConfig.smallTextGrey,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText2,
                      //         style: StyleConfig.smallTextGrey.copyWith(color: ColorConfig.jsPrimaryColor),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText3,
                      //         style: StyleConfig.smallTextGrey,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText4,
                      //         style: StyleConfig.smallTextGrey.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText5,
                      //         style: StyleConfig.smallTextGrey,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText6,
                      //         style: StyleConfig.smallTextGrey.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // RichText(
                      //   textAlign: TextAlign.start,
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: AppString.tcText7,
                      //         style: StyleConfig.smallTextGrey,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText8,
                      //         style: StyleConfig.smallTextGrey.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText9,
                      //         style: StyleConfig.smallTextGrey,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Text(
                      //   AppString.tcText10,
                      //   style: StyleConfig.smallTextGrey,
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Text(
                      //   AppString.tcText11,
                      //   style: StyleConfig.smallTextGrey,
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Text(
                      //   AppString.tcText12,
                      //   style: StyleConfig.smallTextGrey,
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Text(
                      //   AppString.tcText13,
                      //   style: StyleConfig.smallTextGrey,
                      // ),
                      // Text(
                      //   AppString.tcText14,
                      //   style: StyleConfig.smallTextGrey.copyWith(
                      //     color: ColorConfig.jsLightBlackColor,
                      //     fontFamily: JSFonts.outfitBold,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Text(
                      //   AppString.tcText15,
                      //   style: StyleConfig.smallTextGrey,
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Text(
                      //   AppString.tcText16,
                      //   style: StyleConfig.smallTextGrey
                      //       .copyWith(color: ColorConfig.jsPrimaryColor, fontFamily: JSFonts.outfitBold),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // RichText(
                      //   textAlign: TextAlign.start,
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: AppString.tcText17,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText26,
                      //         style: StyleConfig.smallText.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText18,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // RichText(
                      //   textAlign: TextAlign.start,
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: AppString.tcText19,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText21,
                      //         style: StyleConfig.smallText.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText20,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText25,
                      //         style: StyleConfig.smallText.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText18,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // RichText(
                      //   textAlign: TextAlign.start,
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: AppString.tcText22,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText21,
                      //         style: StyleConfig.smallText.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText20,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText27,
                      //         style: StyleConfig.smallText.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText18,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // RichText(
                      //   textAlign: TextAlign.start,
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: AppString.tcText23,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText21,
                      //         style: StyleConfig.smallText.copyWith(
                      //           color: ColorConfig.jsLightBlackColor,
                      //           fontFamily: JSFonts.outfitBold,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: AppString.tcText18,
                      //         style: StyleConfig.smallText,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // Text(
                      //   AppString.tcText24,
                      //   style: StyleConfig.smallText,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            if (!termsAndConditionsLogic.isDataLoaded.value) const AppLoader()
          ],
        );
      }),
    );
  }
}

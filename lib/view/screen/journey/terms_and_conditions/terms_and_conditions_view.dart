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
              child: AbsorbPointer(
                absorbing: termsAndConditionsLogic.isLoading.value,
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
                                    style: StyleConfig.semiBoldText24
                                        .copyWith(color: ColorConfig.jsPrimaryColor, fontSize: 26),
                                  ),
                                  TextSpan(
                                    text: AppString.surakshaText,
                                    style: StyleConfig.semiBoldText24
                                        .copyWith(color: ColorConfig.jsBlueColor, fontSize: 26),
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
                          ),
                        SizedBox(
                          height: 90.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (!termsAndConditionsLogic.isDataLoaded.value || !termsAndConditionsLogic.isDataLoaded.value) AppLoader()
          ],
        );
      }),
    );
  }
}

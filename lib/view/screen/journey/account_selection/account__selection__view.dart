import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/selection.dart';

import '../../../../model/response_main_model/VerifyOTPResponseMain.dart';
import 'account__selection__logic.dart';

class AccountSelectionPage extends StatelessWidget {
  AccountSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AccountSelectionLogic>();
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Obx(() {
        return AddHeaderFooter(
          title: "Account Holder Details ",
          appbarName: AppString.appBarWithTitle,
          buttonTitle: "Continue",
          onButtonClick: logic.onPressContinue,
          onBackButtonCLick: AppUtils.onBackToDashboard,
          isDataLoading: logic.isLoading.value,
          isButtonEnable: true,
          isShowButton: true,
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Please select an account holder to proceed",
                  style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextGreyColor),
                ),
              )),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                      itemCount: logic.verifyOtpResponseMain.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Obx(
                          () {
                            return SelectionWidget(
                              isSelected: !logic.selectedWidget[index].value,
                              index: 1,
                              userName: logic.verifyOtpResponseMain.data?[index].accountHolderName ?? '',
                              onChnage: () {
                                logic.accountHolderData = logic.verifyOtpResponseMain.data?[index] ?? Data();
                              },
                            );
                          },
                        );
                      }),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        );
      }),
    );
  }
}

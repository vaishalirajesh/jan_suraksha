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

import 'account__selection__logic.dart';

class AccountSelectionPage extends StatelessWidget {
  AccountSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Account_Selection_Logic>();
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: AddHeaderFooter(
        title: "Account Holder Details ",
        appbarName: AppString.appBarWithTitle,
        buttonTitle: "Continue",
        onButtonClick: () {
          Get.toNamed(PolicyAvailedPageRoute);
        },
        onBackButtonCLick: AppUtils.onBackToDashboard,
        isDataLoading: false,
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
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Obx(() {
                  return SelectionWidget(
                    isSelected: !logic.selectedWidget.value,
                    index: 1,
                    userName: "Mrs. Kajal ",
                    cifNumber: '12345678',
                    accountNumber: 'XXX12045',
                    onChnage: logic.onChangeSelection,
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(() {
                return SelectionWidget(
                  isSelected: logic.selectedWidget.value,
                  index: 2,
                  userName: "Mrs. Kajal ",
                  cifNumber: '12345678',
                  accountNumber: 'XXX12045',
                  onChnage: logic.onChangeSelection,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/selection.dart';

import 'account__selection__logic.dart';

class AccountSelectionPage extends StatelessWidget {
  AccountSelectionPage({Key? key}) : super(key: key);

  final logic = Get.find<Account_Selection_Logic>();

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
      title: "Testing header",
      appbarName: AppString.appBarWithNotification,
      buttonTitle: "Test Button",
      onButtonClick: () {},
      isDataLoading: false,
      isButtonEnable: true,
      isShowButton: true,
      subTitle:
          "Happy to have you onboard! Let's start by finding out which insurance you need.",
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SelectionWidget(
                isSelected: true,
                index: 1,
                userName: "Mrs. Kajal XXXXX XXXXX",
                cifNumber: '12345678',
                accountNumber: 'XXX12045',
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SelectionWidget(
              isSelected: false,
              index: 2,
              userName: "Mrs. Kajal XXXXX XXXXX",
              cifNumber: '12345678',
              accountNumber: 'XXX12045',
            ),
          ),
        ],
      ),
    );
  }
}

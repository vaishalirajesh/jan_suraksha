import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_logic.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  SupportPage({Key? key}) : super(key: key);

  final logic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: logic.onWillPop,
      child: AddHeaderFooter(
        appbarName: AppString.appBarWithNotification,
        title: "Support",
        buttonTitle: "buttonTitle",
        onButtonClick: () {},
        onBackButtonCLick: AppUtils.onBackToDashboard,
        isDataLoading: false,
        isButtonEnable: false,
        isShowButton: false,
        subTitle: "If you are stuck, Let us know",
        child: Container(
          color: ColorConfig.jsCreamColor,
          padding: EdgeInsets.all(20.h),
          child: Column(children: [
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w),
                color: ColorConfig.jsWhiteColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.all(20.r),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Email ID",
                  style: StyleConfig.semiBoldText16,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse("mailto:customersupport@jansuraksha.in"));
                  },
                  child: Text(
                    "customersupport@jansuraksha.in",
                    style: StyleConfig.smallText
                        .copyWith(color: ColorConfig.jsPrimaryColor, decoration: TextDecoration.underline),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w),
                color: ColorConfig.jsWhiteColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.all(20.r),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Phone Number",
                  style: StyleConfig.semiBoldText16,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse("tel:7935003222"));
                  },
                  child: Text(
                    "+91 7935003222",
                    style: StyleConfig.regularText16.copyWith(
                      color: ColorConfig.jsPrimaryColor,
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

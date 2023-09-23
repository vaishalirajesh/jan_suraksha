import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_logic.dart';
import 'package:jan_suraksha/view/screen/journey/scheme_selection/select_scheme_logic.dart';

import '../../../../config/Navigation_config.dart';
import '../../../../config/style_config.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/theme_helper.dart';
import '../../../widget/app_button.dart';

class SelectSchemePage extends StatelessWidget {
  SelectSchemePage({Key? key}) : super(key: key);
  final dashboardLogic = Get.find<DashboardLogic>();
  final logic = Get.find<SelectSchemeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: AppUtils.onWillPopToDashboard,
        child: Stack(children: <Widget>[
          Obx(() {
            return Container(
              color: ColorConfig.jsCreamColor,
              padding: EdgeInsets.only(bottom: 20.h),
              child: Image.asset(logic.isSelected.value == 1 ? Assets.schemePmsby : Assets.schemePmjjbyScheme),
            );
          }),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: Container(
                width: 1.sw,
                height: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, HexColor("#00FFFFFF")])),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back_sharp)),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Scheme Selection",
                              style: StyleConfig.boldText16.copyWith(fontSize: 16.sp, color: ColorConfig.jsBlackColor),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.4.sh,
              decoration: BoxDecoration(
                color: ColorConfig.jsWhiteColor,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Jansuraksha schemes",
                    style: StyleConfig.boldText16.copyWith(fontSize: 18.sp, color: ColorConfig.jsTextGreyColor),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Please note that PMJJBY & PMSBY",
                    style: StyleConfig.smallText.copyWith(fontSize: 14.sp, color: ColorConfig.jstextLightGreyColor),
                  ),
                  Text(
                    "can be availed only once",
                    style: StyleConfig.smallText.copyWith(fontSize: 14.sp, color: ColorConfig.jstextLightGreyColor),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(children: [
                    Expanded(
                      child: Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  logic.isSelected.value = 1;
                                },
                                child: Container(
                                    height: 110.h,
                                    margin: EdgeInsets.only(top: 12.5.h),
                                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: logic.isSelected.value == 1
                                              ? ThemeHelper.getInstance()!.colorScheme.primary
                                              : ThemeHelper.getInstance()!.colorScheme.secondaryContainer),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 10),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Icon(
                                              logic.isSelected.value == 1 ? Icons.check_circle : Icons.circle_outlined,
                                              color: logic.isSelected.value == 1
                                                  ? ColorConfig.jsGreenColor
                                                  : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    Text(
                                                      "Pay Annually",
                                                      style: StyleConfig.mediumText16.copyWith(
                                                          fontSize: 12.sp, color: ColorConfig.jsTextGreyColor),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      dashboardLogic.schemeDetail[1]['premiumAmount'] != null
                                                          ? "₹${dashboardLogic.schemeDetail[1]['premiumAmount']}"
                                                          : '0',
                                                      style: StyleConfig.boldText20.copyWith(
                                                          color: ColorConfig.jsTextGreyColor, fontSize: 25.sp),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Container(
                                height: 25.h,
                                width: 1.sw,
                                margin: EdgeInsets.symmetric(horizontal: 35.w),
                                decoration: BoxDecoration(
                                  color: logic.isSelected.value == 1
                                      ? ThemeHelper.getInstance()!.colorScheme.primary
                                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  dashboardLogic.schemeDetail[1]['shortName'] ?? '',
                                  style: StyleConfig.semiBoldExtraSmallText.copyWith(
                                    color: logic.isSelected.value == 1
                                        ? ThemeHelper.getInstance()!.colorScheme.background
                                        : ThemeHelper.getInstance()!.colorScheme.onSecondary,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                    Expanded(
                      child: Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  logic.isSelected.value = 2;
                                },
                                child: Container(
                                    height: 110.h,
                                    margin: EdgeInsets.only(top: 12.5.h),
                                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: logic.isSelected.value == 2
                                              ? ThemeHelper.getInstance()!.colorScheme.primary
                                              : ThemeHelper.getInstance()!.colorScheme.secondaryContainer),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 10),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Icon(
                                              logic.isSelected.value == 2 ? Icons.check_circle : Icons.circle_outlined,
                                              color: logic.isSelected.value == 2
                                                  ? ColorConfig.jsGreenColor
                                                  : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    Text(
                                                      "Pay Annually",
                                                      style: StyleConfig.mediumText16.copyWith(
                                                          fontSize: 12.sp, color: ColorConfig.jsTextGreyColor),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      dashboardLogic.schemeDetail[0]['premiumAmount'] != null
                                                          ? "₹${dashboardLogic.schemeDetail[0]['premiumAmount']}"
                                                          : '0',
                                                      style: StyleConfig.boldText20.copyWith(
                                                          color: ColorConfig.jsTextGreyColor, fontSize: 25.sp),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Container(
                                height: 25.h,
                                width: 1.sw,
                                margin: EdgeInsets.symmetric(horizontal: 35.w),
                                decoration: BoxDecoration(
                                  color: logic.isSelected.value == 2
                                      ? ThemeHelper.getInstance()!.colorScheme.primary
                                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  dashboardLogic.schemeDetail[0]['shortName'] ?? '',
                                  style: StyleConfig.semiBoldExtraSmallText.copyWith(
                                    color: logic.isSelected.value == 2
                                        ? ThemeHelper.getInstance()!.colorScheme.background
                                        : ThemeHelper.getInstance()!.colorScheme.onSecondary,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text("* for PMJJBY,refer terms & conditions for premium",
                      style: StyleConfig.regularText16.copyWith(fontSize: 12.sp))
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButton(
            onPress: () {
              Get.toNamed(BankSelectionPageRoute);
            },
            title: "Continue",
            isButtonEnable: true.obs,
            isDataLoading: false.obs,
          ),
        ),
      ),
    );
  }
}

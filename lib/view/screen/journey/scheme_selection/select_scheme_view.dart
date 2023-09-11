import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import '../../../../utils/theme_helper.dart';
import '../../homepage/dashboard/dashboard_view.dart';
import 'select_scheme_logic.dart';

class SelectSchemePage extends StatelessWidget {
  SelectSchemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SelectSchemeLogic>();
    return Obx(() {
      return AddHeaderFooter(
          appbarName: AppString.appBarWithTitle,
          title: "Scheme Selection",
          buttonTitle: "Continue",
          onButtonClick: () {
            Get.toNamed(BankSelectionPageRoute);
          },
          isDataLoading: false,
          isButtonEnable: (logic.isSelected.value != 0),
          child: ConstrainedFlexView(MediaQuery.of(context).size.height * 0.79,
              axis: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      color: ColorConfig.jsCreamColor,
                      height: 220.h,
                      width: 220.h,
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Image.asset(AppImages.family),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Jansuraksha schemes",
                          style: StyleConfig.boldText16.copyWith(fontSize: 18.sp, color: ColorConfig.jsTextGreyColor),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Please note that PMJJBY & PMSBY",
                          style:
                              StyleConfig.smallText.copyWith(fontSize: 14.sp, color: ColorConfig.jstextLightGreyColor),
                        ),
                        Text(
                          "can be availed only once",
                          style:
                              StyleConfig.smallText.copyWith(fontSize: 14.sp, color: ColorConfig.jstextLightGreyColor),
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
                                                    logic.isSelected.value == 1
                                                        ? Icons.check_circle
                                                        : Icons.circle_outlined,
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
                                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                                            "₹ 436",
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
                                        "PMJJBY",
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
                                                    logic.isSelected.value == 2
                                                        ? Icons.check_circle
                                                        : Icons.circle_outlined,
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
                                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                                            "₹ 436",
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
                                        "PMSBY",
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
                        ])
                      ],
                    ),
                  ])));
    });
  }
}

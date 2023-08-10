import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/generated/assets.dart';
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_view.dart';

import '../../../../config/style_config.dart';
import '../../../widget/app_button.dart';
import 'dashboard_logic.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DashboardLogic>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConfig.jsSecondaryColor,
        body: ConstrainedFlexView(
          MediaQuery.of(context).size.height * 1.02,
          axis: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: ColorConfig.jsCreamColor,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      color: ColorConfig.jsCreamColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Welcome", style: StyleConfig.smallText.copyWith(fontSize: 24.sp)),
                            Icon(
                              Icons.notifications,
                              size: 24.r,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: ColorConfig.jsCreamColor,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, left: 20.w),
                            child: Text(
                              "Happy to have you onboard! \nLet's start by finding out which insurance you need.",
                              style:
                                  StyleConfig.smallText.copyWith(fontSize: 12.sp, color: ColorConfig.jsDarkPinkColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: ColorConfig.jsCreamColor,
                      height: 10.h,
                    ),
                    Container(
                      color: ColorConfig.jsCreamColor,
                      child: SizedBox(
                        height: 290.h,
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (c, i) {
                              return Flex(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                direction: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w, top: 15.w, right: 10.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.rectangle,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                          border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                                      height: 120.h,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 15.w, right: 20.w, top: 15.h),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  child: SvgPicture.asset(Assets.dashboardSchemeLogo),
                                                  height: 50.h,
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "PMJJBY",
                                                      style: StyleConfig.boldText16
                                                          .copyWith(color: ColorConfig.jsTextGreyColor),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      "Pay Annually",
                                                      style: StyleConfig.regularExtraSmallText
                                                          .copyWith(color: ColorConfig.jsTextGreyColor),
                                                    )
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        "Rs 232",
                                                        style: StyleConfig.boldText20
                                                            .copyWith(color: ColorConfig.jsTextGreyColor),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                                            child: ListViewButtons(
                                              onPress: () {
                                                Get.to(() => ApplicationFormPage(), binding: ApplicationFormBinding());
                                              },
                                              title: "View Details",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 12.5.h, left: 10.w),
                      child: Text("My Policy", style: StyleConfig.mediumText16.copyWith(color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            border: Border.all(color: ColorConfig.jsCardBgBlueColor, width: 0.5.w)),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 40.h, width: 40.w, child: SvgPicture.asset(Assets.dashboardPolicy)),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Apply for fresh policy",
                                      style: StyleConfig.mediumText16.copyWith(color: ColorConfig.jsSecondaryColor),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Policy For PMJJBY and PMSBY",
                                      style: StyleConfig.mediumText16
                                          .copyWith(fontSize: 12.sp, color: ColorConfig.jsTextGreyColor),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            border: Border.all(color: ColorConfig.jsCardBgBlueColor, width: 0.5.w)),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Name:",
                                        style: StyleConfig.boldText16
                                            .copyWith(fontSize: 16.sp, color: ColorConfig.jsTextGreyColor),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text("Kajal Tala",
                                          style: StyleConfig.smallText.copyWith(color: ColorConfig.jsTextGreyColor))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 60.w,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Scheme:",
                                        style: StyleConfig.boldText16
                                            .copyWith(fontSize: 16.sp, color: ColorConfig.jsTextGreyColor),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Text(
                                        "PMSBY",
                                        style: StyleConfig.smallText.copyWith(color: ColorConfig.jsTextGreyColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Transform(
                                      transform: new Matrix4.identity()..scale(0.8),
                                      child: Center(
                                        child: Chip(
                                          label: Text(
                                            "Active Policy",
                                            style: StyleConfig.smallTextLight
                                                .copyWith(color: Colors.white, fontSize: 14.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 30.w, top: 6.h),
                                    child: Text(
                                      "  Amount: 20",
                                      style: StyleConfig.smallText.copyWith(fontSize: 12.sp),
                                    ),
                                  ),
                                  SizedBox()
                                ],
                              ),
                              ListViewButtons(onPress: () {}, title: "Continue Journey")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          child: Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 30.h,
                    child: Column(
                      children: [
                        InkWell(
                          child: logic.index.value == 0
                              ? SvgPicture.asset(Assets.dashboardHomeEnabled)
                              : SvgPicture.asset(Assets.dashboardHomeDisabled),
                          onTap: () {
                            logic.setIndex(0);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Home",
                          style: StyleConfig.regularText16.copyWith(
                              color: logic.index.value == 0 ? ColorConfig.jsSecondaryColor : ColorConfig.jsGreyColor,
                              fontSize: 10.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Column(
                      children: [
                        InkWell(
                          child: logic.index.value == 1
                              ? SvgPicture.asset(Assets.dashboardServiceEnabled)
                              : SvgPicture.asset(Assets.dashboardServiceDisabled),
                          onTap: () {
                            logic.setIndex(1);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Services",
                          style: StyleConfig.regularText16.copyWith(
                              color: logic.index.value == 1 ? ColorConfig.jsSecondaryColor : ColorConfig.jsGreyColor,
                              fontSize: 10.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Column(
                      children: [
                        InkWell(
                          child: logic.index.value == 2
                              ? SvgPicture.asset(Assets.dashboardSupportEnabled)
                              : SvgPicture.asset(Assets.dashboardSupportDisabled),
                          onTap: () {
                            logic.setIndex(2);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Support",
                          style: StyleConfig.regularText16.copyWith(
                              color: logic.index.value == 2 ? ColorConfig.jsSecondaryColor : ColorConfig.jsGreyColor,
                              fontSize: 9.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Column(
                      children: [
                        InkWell(
                          child: logic.index.value == 3
                              ? SvgPicture.asset(Assets.dashboardProfileEnabled)
                              : SvgPicture.asset(Assets.dashboardProfileDisabled),
                          onTap: () {
                            logic.setIndex(3);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Profile",
                          style: StyleConfig.regularText16.copyWith(
                              color: logic.index.value == 3 ? ColorConfig.jsSecondaryColor : ColorConfig.jsGreyColor,
                              fontSize: 10.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ConstrainedFlexView extends StatelessWidget {
  final Widget child;
  final double minSize;
  final Axis axis;

  const ConstrainedFlexView(this.minSize, {required this.child, required this.axis});

  bool get isHz => axis == Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double viewSize = isHz ? constraints.maxWidth : constraints.maxHeight;
        if (viewSize > minSize) return child;
        return SingleChildScrollView(
          scrollDirection: axis ?? Axis.vertical,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: isHz ? double.infinity : minSize, maxWidth: isHz ? minSize : double.infinity),
            child: child,
          ),
        );
      },
    );
  }
}

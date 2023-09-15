import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/generated/assets.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/profile_view.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_view.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_view.dart';
import 'package:jan_suraksha/view/screen/journey/ongoing_pmjjby_journey/ongoing_pmjjby_journey_binding.dart';
import 'package:jan_suraksha/view/screen/journey/ongoing_pmjjby_journey/ongoing_pmjjby_journey_view.dart';
import 'package:jan_suraksha/view/screen/journey/ongoing_pmsby_journey/ongoing_pmsby_journey_binding.dart';
import 'package:jan_suraksha/view/screen/journey/ongoing_pmsby_journey/ongoing_pmsby_journey_view.dart';

import '../../../../config/navigation_config.dart';
import '../../../../config/style_config.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_button.dart';
import 'dashboard_logic.dart';
import 'dart:math' as math;

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DashboardLogic>();
    return Obx(() {
      return Scaffold(
        body: Builder(builder: (context) {
          switch (logic.index.value) {
            case (0):
              return HomePage();
            case (1):
              return ServicesPage();
            case (2):
              return SupportPage();
            case (3):
              return ProfilePage();
            default:
              return HomePage();
          }
        }),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              // height: 50.h,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      logic.setIndex(0);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 15.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          logic.index.value == 0
                              ? SvgPicture.asset(Assets.dashboardHomeEnabled)
                              : SvgPicture.asset(Assets.dashboardHomeDisabled),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            AppString.str_home,
                            style: StyleConfig.regularText16.copyWith(
                                color: logic.index.value == 0 ? ColorConfig.jsSecondaryColor : ColorConfig.jsGreyColor,
                                fontSize: 10.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      logic.setIndex(1);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 15.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          logic.index.value == 1
                              ? SvgPicture.asset(Assets.dashboardServiceEnabled)
                              : SvgPicture.asset(Assets.dashboardServiceDisabled),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            AppString.str_services,
                            style: StyleConfig.regularText16.copyWith(
                                color: logic.index.value == 1 ? ColorConfig.jsSecondaryColor : ColorConfig.jsGreyColor,
                                fontSize: 10.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      logic.setIndex(2);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 15.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          logic.index.value == 2
                              ? SvgPicture.asset(Assets.dashboardSupportEnabled)
                              : SvgPicture.asset(Assets.dashboardSupportDisabled),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            AppString.str_support,
                            style: StyleConfig.regularText16.copyWith(
                              color: logic.index.value == 2 ? ColorConfig.jsSecondaryColor : ColorConfig.jsGreyColor,
                              fontSize: 9.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      logic.setIndex(3);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 15.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          logic.index.value == 3
                              ? SvgPicture.asset(Assets.dashboardProfileEnabled)
                              : SvgPicture.asset(Assets.dashboardProfileDisabled),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            AppString.str_porfile,
                            style: StyleConfig.regularText16.copyWith(
                                color: logic.index.value == 3 ? ColorConfig.jsSecondaryColor : ColorConfig.jsGreyColor,
                                fontSize: 10.sp),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScopeAuth,
      child: Container(
        color: ColorConfig.jsSecondaryColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: ColorConfig.jsCreamColor,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      color: ColorConfig.jsCreamColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 50.h, right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppString.str_welcome, style: StyleConfig.smallText.copyWith(fontSize: 24.sp)),
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
                              AppString.happy_to_have_you_onboard,
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
                    // Container(
                    //   color: ColorConfig.jsCreamColor,
                    //   child: SizedBox(
                    //     height: 290.h,
                    //     child: ListView.builder(
                    //         primary: false,
                    //         itemCount: 2,
                    //         itemBuilder: (c, i) {
                    //           return Flex(
                    //             mainAxisSize: MainAxisSize.max,
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             direction: Axis.vertical,
                    //             children: [
                    //               Padding(
                    //                 padding: EdgeInsets.only(left: 10.w, top: 15.w, right: 10.w),
                    //                 child: Container(
                    //                   decoration: BoxDecoration(
                    //                       color: Colors.white,
                    //                       shape: BoxShape.rectangle,
                    //                       borderRadius: const BorderRadius.only(
                    //                         topLeft: Radius.circular(10.0),
                    //                         topRight: Radius.circular(10.0),
                    //                         bottomLeft: Radius.circular(10.0),
                    //                         bottomRight: Radius.circular(10.0),
                    //                       ),
                    //                       border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                    //                   height: 120.h,
                    //                   child: Column(
                    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       Padding(
                    //                         padding: EdgeInsets.only(left: 15.w, right: 20.w, top: 15.h),
                    //                         child: Row(
                    //                           children: [
                    //                             SizedBox(
                    //                               child: SvgPicture.asset(Assets.dashboardSchemeLogo),
                    //                               height: 50.h,
                    //                             ),
                    //                             SizedBox(
                    //                               width: 15.w,
                    //                             ),
                    //                             Column(
                    //                               mainAxisAlignment: MainAxisAlignment.start,
                    //                               crossAxisAlignment: CrossAxisAlignment.start,
                    //                               children: [
                    //                                 Text(
                    //                                   AppString.str_pmjjby,
                    //                                   style: StyleConfig.boldText16
                    //                                       .copyWith(color: ColorConfig.jsTextGreyColor),
                    //                                 ),
                    //                                 SizedBox(
                    //                                   height: 5.h,
                    //                                 ),
                    //                                 Text(
                    //                                   AppString.str_pay_annually,
                    //                                   style: StyleConfig.regularExtraSmallText
                    //                                       .copyWith(color: ColorConfig.jsTextGreyColor),
                    //                                 )
                    //                               ],
                    //                             ),
                    //                             Expanded(
                    //                               child: Row(
                    //                                 mainAxisAlignment: MainAxisAlignment.end,
                    //                                 mainAxisSize: MainAxisSize.max,
                    //                                 children: [
                    //                                   Text(
                    //                                     AppString.str_rs,
                    //                                     style: StyleConfig.boldText20
                    //                                         .copyWith(color: ColorConfig.jsTextGreyColor),
                    //                                   )
                    //                                 ],
                    //                               ),
                    //                             )
                    //                           ],
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    //                         child: ListViewButtons(
                    //                           onPress: () {},
                    //                           title: AppString.str_view_details,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               )
                    //             ],
                    //           );
                    //         }),
                    //   ),
                    // ),
                    Container(
                        color: ColorConfig.jsCreamColor,
                        child: Padding(
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
                                            AppString.str_pmjjby,
                                            style: StyleConfig.boldText16.copyWith(color: ColorConfig.jsTextGreyColor),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            AppString.str_pay_annually,
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
                                              AppString.str_rs,
                                              style:
                                                  StyleConfig.boldText20.copyWith(color: ColorConfig.jsTextGreyColor),
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
                                      Get.to(() => const OngoingPmjjbyJourneyPage(),
                                          binding: OngoingPmjjbyJourneyBinding());
                                    },
                                    title: AppString.str_view_details,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Container(
                        color: ColorConfig.jsCreamColor,
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Padding(
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
                                            'PMSBY',
                                            style: StyleConfig.boldText16.copyWith(color: ColorConfig.jsTextGreyColor),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            AppString.str_pay_annually,
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
                                              AppString.str_rs,
                                              style:
                                                  StyleConfig.boldText20.copyWith(color: ColorConfig.jsTextGreyColor),
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
                                      Get.to(() => const OngoingPmsbyJourneyPage(),
                                          binding: OngoingPmsbyJourneyBinding());
                                    },
                                    title: AppString.str_view_details,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                color: ColorConfig.jsSecondaryColor,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 20.h, left: 10.w),
                      child:
                          Text(AppString.str_my_policy, style: StyleConfig.mediumText16.copyWith(color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(SelectSchemePageRoute);
                        },
                        child: Container(
                          padding: EdgeInsets.all(20.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            border: Border.all(color: ColorConfig.jsCardBgBlueColor, width: 0.5.w),
                          ),
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
                                      AppString.str_apply_for_fresh_loan,
                                      style: StyleConfig.mediumText16.copyWith(color: ColorConfig.jsSecondaryColor),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      AppString.str_policy_for,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          AppString.str_name,
                                          style: StyleConfig.boldText16
                                              .copyWith(fontSize: 16.sp, color: ColorConfig.jsTextGreyColor),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(AppString.str_name_value,
                                            style: StyleConfig.smallText.copyWith(color: ColorConfig.jsTextGreyColor))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          AppString.str_scheme,
                                          style: StyleConfig.boldText16
                                              .copyWith(fontSize: 16.sp, color: ColorConfig.jsTextGreyColor),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            AppString.str_pmsby,
                                            overflow: TextOverflow.clip,
                                            style: StyleConfig.smallText.copyWith(color: ColorConfig.jsTextGreyColor),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 30.w, top: 6.h),
                                  child: Text(
                                    AppString.str_amount,
                                    style: StyleConfig.smallText.copyWith(fontSize: 12.sp),
                                  ),
                                ),
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
          scrollDirection: Axis.vertical,
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

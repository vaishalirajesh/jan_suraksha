import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/generated/assets.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/profile_view.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_view.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_view.dart';
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_view.dart';
import 'package:jan_suraksha/view/screen/journey/ongoing_pmjjby_journey/ongoing_pmjjby_journey_binding.dart';
import 'package:jan_suraksha/view/screen/journey/ongoing_pmjjby_journey/ongoing_pmjjby_journey_view.dart';
import 'package:jan_suraksha/view/screen/journey/terms_and_conditions/terms_and_conditions_binding.dart';
import 'package:jan_suraksha/view/screen/journey/terms_and_conditions/terms_and_conditions_view.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';

import '../../../../config/navigation_config.dart';
import '../../../../config/style_config.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_button.dart';
import 'dashboard_logic.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final dashboardLogic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Scaffold(
            body: Builder(builder: (context) {
              switch (dashboardLogic.index.value) {
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
                          dashboardLogic.setIndex(0);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 15.r),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              dashboardLogic.index.value == 0
                                  ? SvgPicture.asset(Assets.dashboardHomeEnabled)
                                  : SvgPicture.asset(Assets.dashboardHomeDisabled),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                AppString.str_home,
                                style: StyleConfig.regularText16.copyWith(
                                    color: dashboardLogic.index.value == 0
                                        ? ColorConfig.jsSecondaryColor
                                        : ColorConfig.jsGreyColor,
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          dashboardLogic.setIndex(1);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 15.r),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              dashboardLogic.index.value == 1
                                  ? SvgPicture.asset(Assets.dashboardServiceEnabled)
                                  : SvgPicture.asset(Assets.dashboardServiceDisabled),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                AppString.str_services,
                                style: StyleConfig.regularText16.copyWith(
                                    color: dashboardLogic.index.value == 1
                                        ? ColorConfig.jsSecondaryColor
                                        : ColorConfig.jsGreyColor,
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          dashboardLogic.setIndex(2);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 15.r),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              dashboardLogic.index.value == 2
                                  ? SvgPicture.asset(Assets.dashboardSupportEnabled)
                                  : SvgPicture.asset(Assets.dashboardSupportDisabled),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                AppString.str_support,
                                style: StyleConfig.regularText16.copyWith(
                                  color: dashboardLogic.index.value == 2
                                      ? ColorConfig.jsSecondaryColor
                                      : ColorConfig.jsGreyColor,
                                  fontSize: 9.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          dashboardLogic.setIndex(3);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 15.r),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              dashboardLogic.index.value == 3
                                  ? SvgPicture.asset(Assets.dashboardProfileEnabled)
                                  : SvgPicture.asset(Assets.dashboardProfileDisabled),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                AppString.str_porfile,
                                style: StyleConfig.regularText16.copyWith(
                                    color: dashboardLogic.index.value == 3
                                        ? ColorConfig.jsSecondaryColor
                                        : ColorConfig.jsGreyColor,
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          if (dashboardLogic.isLoading.value) const AppLoader(),
        ],
      );
    });
  }
}

class HomePage extends StatelessWidget {
  final dashboardLogic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScopeAuth,
      child: Container(
        color: ColorConfig.jsCreamColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 50.h, right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppString.str_welcome, style: StyleConfig.smallText.copyWith(fontSize: 24.sp))
                              ],
                            ),
                          ),
                        ),
                        Row(
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
                        Container(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
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
                                      border: Border.all(color: ColorConfig.jsGreyColor, width: 0.4.w)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 12.w, right: 5.w, top: 10.h),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                child: SvgPicture.asset(Assets.dashboardSchemeLogo),
                                                height: 40.h,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    dashboardLogic.schemeDetail != null &&
                                                            dashboardLogic.schemeDetail[1] != null
                                                        ? dashboardLogic.schemeDetail[1]['shortName']
                                                        : '',
                                                    style: StyleConfig.boldText16
                                                        .copyWith(color: ColorConfig.jsTextGreyColor, fontSize: 14.sp),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    AppString.str_pay_annually,
                                                    style: StyleConfig.regularExtraSmallText
                                                        .copyWith(color: ColorConfig.jsTextGreyColor, fontSize: 12.sp),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Text(
                                            dashboardLogic.schemeDetail != null &&
                                                    dashboardLogic.schemeDetail[1]['premiumAmount'] != null
                                                ? "₹${dashboardLogic.schemeDetail[1]['premiumAmount']}"
                                                : '0',
                                            style: StyleConfig.boldText20.copyWith(color: ColorConfig.jsTextGreyColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Expanded(
                                            child: ListViewButtons(
                                              onPress: () {
                                                Get.to(() => const OngoingPmjjbyJourneyPage(),
                                                    binding: OngoingPmjjbyJourneyBinding());
                                              },
                                              title: AppString.str_view_details,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
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
                                      border: Border.all(color: ColorConfig.jsGreyColor, width: 0.4.w)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 12.w, right: 5.w, top: 10.h),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                child: SvgPicture.asset(Assets.dashboardSchemeLogo),
                                                height: 40.h,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    dashboardLogic.schemeDetail != null &&
                                                            dashboardLogic.schemeDetail[0] != null
                                                        ? dashboardLogic.schemeDetail[0]['shortName']
                                                        : '',
                                                    style: StyleConfig.boldText16
                                                        .copyWith(color: ColorConfig.jsTextGreyColor, fontSize: 14.sp),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    AppString.str_pay_annually,
                                                    style: StyleConfig.regularExtraSmallText
                                                        .copyWith(color: ColorConfig.jsTextGreyColor, fontSize: 12.sp),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Text(
                                            dashboardLogic.schemeDetail != null &&
                                                    dashboardLogic.schemeDetail[0]['premiumAmount'] != null
                                                ? "₹${dashboardLogic.schemeDetail[0]['premiumAmount']}"
                                                : '0',
                                            style: StyleConfig.boldText20.copyWith(color: ColorConfig.jsTextGreyColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Expanded(
                                            child: ListViewButtons(
                                              onPress: () {
                                                Get.to(() => const OngoingPmjjbyJourneyPage(),
                                                    binding: OngoingPmjjbyJourneyBinding());
                                              },
                                              title: AppString.str_view_details,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
                                  padding: EdgeInsets.only(right: 30.w, top: 3.h),
                                  child: Text(
                                    AppString.str_amount,
                                    style: StyleConfig.smallText.copyWith(fontSize: 12.sp),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              ListViewButtons(
                                onPress: () {
                                  Get.to(() => TermsAndConditionsPage(), binding: TermsAndConditionsBinding());
                                },
                                title: "Continue Journey",
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
                                  padding: EdgeInsets.only(right: 30.w, top: 3.h),
                                  child: Text(
                                    AppString.str_amount,
                                    style: StyleConfig.smallText.copyWith(fontSize: 12.sp),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              ListViewButtons(
                                onPress: () {
                                  Get.offAll(() => ApplicationFormPage(), binding: ApplicationFormBinding());
                                },
                                title: "Continue Journey",
                              )
                            ],
                          ),
                        ),
                      ),
                    )
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

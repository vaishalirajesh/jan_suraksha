import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import '../../../../config/Navigation_config.dart';
import '../../../../config/color_config.dart';
import '../../../../config/style_config.dart';
import '../../../../generated/assets.dart';
import 'ongoing_pmjjby_journey_logic.dart';

class OngoingPmjjbyJourneyPage extends StatelessWidget {
  const OngoingPmjjbyJourneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ongoingPmjjbyJourneyLogic = Get.find<OngoingPmjjbyJourneyLogic>();
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: AddHeaderFooter(
          appbarName: AppString.appBarWithSubtitle,
          title: "PMJJBY",
          subTitle: 'Pradhan Mantri Suraksha Bima Yojana',
          buttonTitle: "Continue",
          onButtonClick: AppUtils.onBackPress,
          onBackButtonCLick: AppUtils.onBackPress,
          isDataLoading: false,
          isButtonEnable: false,
          isShowButton: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.h, bottom: 25.h, top: 25.h),
                color: ColorConfig.jsCreamColor,
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
                                'Policy for PMJJBY',
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
                padding: EdgeInsets.only(left: 20.w, right: 20.h, bottom: 15.h, top: 30.h),
                child: Text(
                  AppString.pmsbyText,
                  style: StyleConfig.smallTextGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                ),
                child: Divider(
                  color: ColorConfig.jsLightGreyColor,
                  thickness: 1.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.h, bottom: 15.h, top: 15.h),
                child: Text(
                  AppString.subjectText,
                  style: StyleConfig.semiBoldSmallText.copyWith(color: ColorConfig.jsSecondaryColor),
                ),
              ),
            ],
          )),
    );
  }
}

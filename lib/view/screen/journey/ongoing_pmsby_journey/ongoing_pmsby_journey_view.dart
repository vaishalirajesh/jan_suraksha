import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/utils.dart';

import '../../../../config/Navigation_config.dart';
import '../../../../config/color_config.dart';
import '../../../../config/style_config.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_common_screen.dart';
import 'ongoing_pmsby_journey_logic.dart';

class OngoingPmsbyJourneyPage extends StatelessWidget {
  const OngoingPmsbyJourneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<OngoingPmsbyJourneyLogic>();

    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: AddHeaderFooter(
          appbarName: AppString.appBarWithSubtitle,
          title: "PMSBY",
          subTitle: 'Pradhan Mantri Suraksha Bima Yojana',
          buttonTitle: "Continue",
          onButtonClick: () {},
          onBackButtonCLick: AppUtils.onBackToDashboard,
          isDataLoading: false,
          isButtonEnable: false,
          isShowButton: false,
          child: SingleChildScrollView(
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
                                  "Policy for PMSBY",
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
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Benifits",
                          style: StyleConfig.boldText16.copyWith(fontSize: 20.sp, color: ColorConfig.jsTextGreyColor),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Sum Insured : 2 Lakh",
                          style: StyleConfig.boldText16
                              .copyWith(fontSize: 14.sp, color: ColorConfig.jsTextMediumGreyColor),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "A. Death",
                              style: StyleConfig.smallText
                                  .copyWith(fontSize: 14.sp, color: ColorConfig.jsTextMediumGreyColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "B. ",
                              style: StyleConfig.smallText
                                  .copyWith(fontSize: 14.sp, color: ColorConfig.jsTextMediumGreyColor),
                            ),
                            Expanded(
                              child: Text(
                                "Total and irrecoverable loss of both eyes or loss of use of both hands or feet or loss of sight of one eye and loss of use of hand or foot",
                                style: StyleConfig.smallText
                                    .copyWith(fontSize: 14.sp, color: ColorConfig.jsTextMediumGreyColor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Sum Insured : 1 Lakh",
                          style: StyleConfig.boldText16
                              .copyWith(fontSize: 14.sp, color: ColorConfig.jsTextMediumGreyColor),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "C. ",
                              style: StyleConfig.smallText
                                  .copyWith(fontSize: 14.sp, color: ColorConfig.jsTextMediumGreyColor),
                            ),
                            Expanded(
                              child: Text(
                                "Total and irrecoverable loss of sight of one eye or loss of use of one hand or foot",
                                style: StyleConfig.smallText
                                    .copyWith(fontSize: 14.sp, color: ColorConfig.jsTextMediumGreyColor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
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
            ),
          )),
    );
  }
}

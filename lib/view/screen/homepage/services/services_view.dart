import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_logic.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import '../../../../config/color_config.dart';
import '../../../../config/style_config.dart';
import '../../../../generated/assets.dart';
import '../../../widget/app_button.dart';

class ServicesPage extends StatelessWidget {
  ServicesPage({Key? key}) : super(key: key);

  final logic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
        appbarName: AppString.appBarWithNotification,
        title: "Services",
        buttonTitle: "",
        onButtonClick: () {},
        isDataLoading: false,
        isButtonEnable: false,
        isShowButton: false,
        subTitle: "Select from below for the additional service",
        child: ConstrainedFlexView(
          MediaQuery.of(context).size.height * 1.2,
          axis: Axis.vertical,
          child: Container(
            color: ColorConfig.jsCreamColor,
            child: Obx(() {
              return Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              logic.isExpandedScheme.value =
                                  !logic.isExpandedScheme.value;
                            },
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
                                    border: Border.all(
                                        color: ColorConfig.jsCardBgBlueColor,
                                        width: 0.5.w)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                            Assets.dashboardSchemeLogo,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Opt-Out",
                                              style: StyleConfig.boldText16
                                                  .copyWith(
                                                      color: ColorConfig
                                                          .jsTextGreyColor),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Text(
                                              "Click here to opt-out from the scheme",
                                              style: StyleConfig
                                                  .regularExtraSmallText
                                                  .copyWith(
                                                      color: ColorConfig
                                                          .jsTextGreyColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Offstage(
                                      offstage: logic.isExpandedScheme.value,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Divider(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.str_name,
                                                          style: StyleConfig
                                                              .boldText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                            AppString
                                                                .str_name_value,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.str_scheme,
                                                          style: StyleConfig
                                                              .boldText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                          AppString.str_pmjjby,
                                                          style: StyleConfig
                                                              .smallText
                                                              .copyWith(
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.urn,
                                                          style: StyleConfig
                                                              .regularText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      10.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(AppString.urnno,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor)),
                                                      ],
                                                    ),
                                                    SizedBox(),
                                                    SizedBox(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.renual_date,
                                                          style: StyleConfig
                                                              .regularText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(AppString.date,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor))
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 60.w,
                                                ),
                                                SizedBox(
                                                  height: 5.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      child: Transform(
                                                        transform: new Matrix4
                                                            .identity()
                                                          ..scale(0.8),
                                                        child: Center(
                                                          child: Chip(
                                                            backgroundColor:
                                                                ColorConfig
                                                                    .jsGreenColor,
                                                            label: Text(
                                                              AppString
                                                                  .str_active_policy,
                                                              style: StyleConfig
                                                                  .smallTextLight
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.sp),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 30.w,
                                                          top: 10.h),
                                                      child: Text(
                                                        AppString.str_amount,
                                                        style: StyleConfig
                                                            .smallText
                                                            .copyWith(
                                                                fontSize: 12.sp,
                                                                color: ColorConfig
                                                                    .jstextLightGreyColor),
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    SizedBox(),
                                                    SizedBox()
                                                  ],
                                                ),
                                                ListViewButtons(
                                                    onPress: () {},
                                                    title: "Opt-Out")
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Divider(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.str_name,
                                                          style: StyleConfig
                                                              .boldText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                            AppString
                                                                .str_name_value,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.str_scheme,
                                                          style: StyleConfig
                                                              .boldText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                          AppString.str_pmjjby,
                                                          style: StyleConfig
                                                              .smallText
                                                              .copyWith(
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.urn,
                                                          style: StyleConfig
                                                              .regularText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      10.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(AppString.urnno,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor)),
                                                      ],
                                                    ),
                                                    SizedBox(),
                                                    SizedBox(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.renual_date,
                                                          style: StyleConfig
                                                              .regularText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(AppString.date,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor))
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 60.w,
                                                ),
                                                SizedBox(
                                                  height: 5.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      child: Transform(
                                                        transform: new Matrix4
                                                            .identity()
                                                          ..scale(0.8),
                                                        child: Center(
                                                          child: Chip(
                                                            backgroundColor:
                                                                ColorConfig
                                                                    .jsGreenColor,
                                                            label: Text(
                                                              AppString
                                                                  .str_active_policy,
                                                              style: StyleConfig
                                                                  .smallTextLight
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.sp),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 30.w,
                                                          top: 10.h),
                                                      child: Text(
                                                        AppString.str_amount,
                                                        style: StyleConfig
                                                            .smallText
                                                            .copyWith(
                                                                fontSize: 12.sp,
                                                                color: ColorConfig
                                                                    .jstextLightGreyColor),
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    SizedBox(),
                                                    SizedBox()
                                                  ],
                                                ),
                                                ListViewButtons(
                                                    onPress: () {},
                                                    title: "Opt-Out")
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              logic.isExpandedNominee.value =
                                  !logic.isExpandedNominee.value;
                            },
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
                                    border: Border.all(
                                        color: ColorConfig.jsCardBgBlueColor,
                                        width: 0.5.w)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SvgPicture.asset(
                                            Assets.dashboardSchemeLogo,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Nominee Update",
                                              style: StyleConfig.boldText16
                                                  .copyWith(
                                                      color: ColorConfig
                                                          .jsTextGreyColor),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Text(
                                              "Click here to Update the nominee",
                                              style: StyleConfig
                                                  .regularExtraSmallText
                                                  .copyWith(
                                                      color: ColorConfig
                                                          .jsTextGreyColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Offstage(
                                      offstage: logic.isExpandedNominee.value,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Divider(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.str_name,
                                                          style: StyleConfig
                                                              .boldText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                            AppString
                                                                .str_name_value,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.str_scheme,
                                                          style: StyleConfig
                                                              .boldText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                          AppString.str_pmjjby,
                                                          style: StyleConfig
                                                              .smallText
                                                              .copyWith(
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.urn,
                                                          style: StyleConfig
                                                              .regularText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      10.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(AppString.urnno,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor)),
                                                      ],
                                                    ),
                                                    SizedBox(),
                                                    SizedBox(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.renual_date,
                                                          style: StyleConfig
                                                              .regularText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(AppString.date,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor))
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 60.w,
                                                ),
                                                SizedBox(
                                                  height: 5.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      child: Transform(
                                                        transform: new Matrix4
                                                            .identity()
                                                          ..scale(0.8),
                                                        child: Center(
                                                          child: Chip(
                                                            backgroundColor:
                                                                ColorConfig
                                                                    .jsGreenColor,
                                                            label: Text(
                                                              AppString
                                                                  .str_active_policy,
                                                              style: StyleConfig
                                                                  .smallTextLight
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.sp),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 30.w,
                                                          top: 10.h),
                                                      child: Text(
                                                        AppString.str_amount,
                                                        style: StyleConfig
                                                            .smallText
                                                            .copyWith(
                                                                fontSize: 12.sp,
                                                                color: ColorConfig
                                                                    .jstextLightGreyColor),
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    SizedBox(),
                                                    SizedBox()
                                                  ],
                                                ),
                                                ListViewButtons(
                                                    onPress: () {},
                                                    title: "Nominee Update")
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Divider(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.str_name,
                                                          style: StyleConfig
                                                              .boldText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                            AppString
                                                                .str_name_value,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.str_scheme,
                                                          style: StyleConfig
                                                              .boldText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                          AppString.str_pmjjby,
                                                          style: StyleConfig
                                                              .smallText
                                                              .copyWith(
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.urn,
                                                          style: StyleConfig
                                                              .regularText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      10.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(AppString.urnno,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor)),
                                                      ],
                                                    ),
                                                    SizedBox(),
                                                    SizedBox(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          AppString.renual_date,
                                                          style: StyleConfig
                                                              .regularText16
                                                              .copyWith(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: ColorConfig
                                                                      .jsTextGreyColor),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(AppString.date,
                                                            style: StyleConfig
                                                                .smallText
                                                                .copyWith(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: ColorConfig
                                                                        .jsTextGreyColor))
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 60.w,
                                                ),
                                                SizedBox(
                                                  height: 5.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      child: Transform(
                                                        transform: new Matrix4
                                                            .identity()
                                                          ..scale(0.8),
                                                        child: Center(
                                                          child: Chip(
                                                            backgroundColor:
                                                                ColorConfig
                                                                    .jsGreenColor,
                                                            label: Text(
                                                              AppString
                                                                  .str_active_policy,
                                                              style: StyleConfig
                                                                  .smallTextLight
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.sp),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 30.w,
                                                          top: 10.h),
                                                      child: Text(
                                                        AppString.str_amount,
                                                        style: StyleConfig
                                                            .smallText
                                                            .copyWith(
                                                                fontSize: 12.sp,
                                                                color: ColorConfig
                                                                    .jstextLightGreyColor),
                                                      ),
                                                    ),
                                                    SizedBox(),
                                                    SizedBox(),
                                                    SizedBox()
                                                  ],
                                                ),
                                                ListViewButtons(
                                                    onPress: () {},
                                                    title: "Nominee Update")
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )),
                ],
              );
            }),
          ),
        ));
  }
}

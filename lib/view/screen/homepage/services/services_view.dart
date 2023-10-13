import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/showcustomesnackbar.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_logic.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_view.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';

import '../../../../config/color_config.dart';
import '../../../../config/style_config.dart';
import '../../../../generated/assets.dart';
import '../../../widget/app_button.dart';

class ServicesPage extends StatelessWidget {
  ServicesPage({Key? key}) : super(key: key);
  final dashboardLogic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: dashboardLogic.onWillPop,
      child: Obx(() {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: ColorConfig.jsCreamColor,
              appBar: AppBar(
                backgroundColor: ColorConfig.jsCreamColor,
                toolbarHeight: 110.h,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 20.w,
                    right: 20.w,
                    bottom: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Services',
                            style: StyleConfig.regularLargeText,
                          ),
                          // Icon(
                          //   Icons.notification_add,
                          //   color: ColorConfig.jsLightBlackColor,
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 0.6.sw,
                        child: Text(
                          maxLines: 2,
                          'Select from below for the additional service',
                          style: StyleConfig.regularExtraSmallPinkText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: ColorConfig.jsCreamColor,
                  child: Obx(() {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: dashboardLogic.changeSchemaData,
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
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Opt-Out",
                                                    style: StyleConfig.boldText16
                                                        .copyWith(color: ColorConfig.jsTextGreyColor),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Text(
                                                    "Click here to opt-out from the scheme",
                                                    style: StyleConfig.regularExtraSmallText
                                                        .copyWith(color: ColorConfig.jsTextGreyColor),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Offstage(
                                            offstage: dashboardLogic.isExpandedScheme.value,
                                            child: ListView.builder(
                                                itemCount: dashboardLogic.optOutNomineeList.length,
                                                shrinkWrap: true,
                                                physics: const BouncingScrollPhysics(),
                                                itemBuilder: (context, int index) {
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                                                        child: Divider(),
                                                      ),
                                                      Padding(
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
                                                                        style: StyleConfig.boldText16.copyWith(
                                                                            fontSize: 16.sp,
                                                                            color: ColorConfig.jsTextGreyColor),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 4.w,
                                                                      ),
                                                                      Expanded(
                                                                        child: Text(
                                                                          dashboardLogic.optOutNomineeList.isNotEmpty &&
                                                                                  dashboardLogic
                                                                                              .optOutNomineeList[index]
                                                                                          ['name'] !=
                                                                                      null
                                                                              ? dashboardLogic.optOutNomineeList[index]
                                                                                  ['name']
                                                                              : '',
                                                                          style: StyleConfig.smallText.copyWith(
                                                                              color: ColorConfig.jsTextGreyColor),
                                                                          overflow: TextOverflow.ellipsis,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        AppString.str_scheme,
                                                                        style: StyleConfig.boldText16.copyWith(
                                                                            fontSize: 16.sp,
                                                                            color: ColorConfig.jsTextGreyColor),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 4.w,
                                                                      ),
                                                                      Expanded(
                                                                        child: Text(
                                                                          dashboardLogic.optOutNomineeList.isNotEmpty &&
                                                                                  dashboardLogic
                                                                                              .optOutNomineeList[index]
                                                                                          ['schemeName'] !=
                                                                                      null
                                                                              ? dashboardLogic.optOutNomineeList[index]
                                                                                  ['schemeName']
                                                                              : '',
                                                                          style: StyleConfig.smallText.copyWith(
                                                                              color: ColorConfig.jsTextGreyColor),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox()
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            if (dashboardLogic.optOutNomineeList.isNotEmpty &&
                                                                dashboardLogic.optOutNomineeList[index]
                                                                        ['dateOfEffective'] !=
                                                                    null)
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          'Effective Date : ',
                                                                          style: StyleConfig.regularText16.copyWith(
                                                                              fontSize: 12.sp,
                                                                              color: ColorConfig.jsTextGreyColor),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 4.w,
                                                                        ),
                                                                        Expanded(
                                                                          child: Text(
                                                                              dashboardLogic.optOutNomineeList
                                                                                          .isNotEmpty &&
                                                                                      dashboardLogic.optOutNomineeList[
                                                                                                  index]
                                                                                              ['dateOfEffective'] !=
                                                                                          null
                                                                                  ? AppUtils.convertDateFormat(
                                                                                      dashboardLogic
                                                                                              .optOutNomineeList[index]
                                                                                          ['dateOfEffective'],
                                                                                      'yyyy-mm-dd',
                                                                                      'dd/mm/yyyy')
                                                                                  : '-',
                                                                              style: StyleConfig.smallText.copyWith(
                                                                                  fontSize: 12.sp,
                                                                                  color: ColorConfig.jsTextGreyColor)),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            SizedBox(
                                                              height: 15.h,
                                                            ),
                                                            SizedBox(
                                                              height: 26.h,
                                                              width: 1.sw,
                                                              child: ElevatedButton(
                                                                onPressed: () {
                                                                  dashboardLogic.selectedSchemaData =
                                                                      dashboardLogic.optOutNomineeList[index];
                                                                  dashboardLogic.optOutIndex = index;
                                                                  dashboardLogic.optOutNomineeList.isNotEmpty &&
                                                                          dashboardLogic.optOutNomineeList[index]
                                                                                  ['dateOfEffective'] !=
                                                                              null
                                                                      ? null
                                                                      : dashboardLogic.openOPTOutBottomSheet(
                                                                          index: index,
                                                                          schemeId: dashboardLogic
                                                                                      .optOutNomineeList.isNotEmpty &&
                                                                                  dashboardLogic
                                                                                              .optOutNomineeList[index]
                                                                                          ['scheme'] !=
                                                                                      null &&
                                                                                  dashboardLogic
                                                                                              .optOutNomineeList[index]
                                                                                          ['scheme'] !=
                                                                                      ''
                                                                              ? dashboardLogic.optOutNomineeList[index]
                                                                                  ['scheme']
                                                                              : 0);
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      dashboardLogic.optOutNomineeList.isNotEmpty &&
                                                                              dashboardLogic.optOutNomineeList[index]
                                                                                      ['dateOfEffective'] !=
                                                                                  null
                                                                          ? ColorConfig.jsGreyDisableColor
                                                                          : ColorConfig.jsPrimaryColor,
                                                                  disabledBackgroundColor:
                                                                      ColorConfig.jsPrimaryDisableColor,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(40.r),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                    dashboardLogic.optOutNomineeList.isNotEmpty &&
                                                                            dashboardLogic.optOutNomineeList[index]
                                                                                    ['dateOfEffective'] !=
                                                                                null
                                                                        ? 'Opt-out Request Submitted successfully'
                                                                        : "Opt-Out",
                                                                    style: StyleConfig.regularWhiteText16
                                                                        .copyWith(fontSize: 12.sp)),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: dashboardLogic.changeNomineeData,
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
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Nominee Update",
                                                  style: StyleConfig.boldText16
                                                      .copyWith(color: ColorConfig.jsTextGreyColor),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Text(
                                                  "Click here to Update the nominee",
                                                  style: StyleConfig.regularExtraSmallText
                                                      .copyWith(color: ColorConfig.jsTextGreyColor),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Offstage(
                                          offstage: dashboardLogic.isExpandedNominee.value,
                                          child: ListView.builder(
                                              itemCount: dashboardLogic.nomineeList.length,
                                              shrinkWrap: true,
                                              physics: const BouncingScrollPhysics(),
                                              itemBuilder: (context, int index) {
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                                                      child: Divider(),
                                                    ),
                                                    Padding(
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
                                                                      style: StyleConfig.boldText16.copyWith(
                                                                          fontSize: 16.sp,
                                                                          color: ColorConfig.jsTextGreyColor),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 4.w,
                                                                    ),
                                                                    Expanded(
                                                                      child: Text(
                                                                        dashboardLogic.nomineeList.isNotEmpty &&
                                                                                dashboardLogic.nomineeList[index]
                                                                                        ['name'] !=
                                                                                    null
                                                                            ? dashboardLogic.nomineeList[index]['name']
                                                                            : '',
                                                                        style: StyleConfig.smallText.copyWith(
                                                                            color: ColorConfig.jsTextGreyColor),
                                                                        overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      AppString.str_scheme,
                                                                      style: StyleConfig.boldText16.copyWith(
                                                                          fontSize: 16.sp,
                                                                          color: ColorConfig.jsTextGreyColor),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 4.w,
                                                                    ),
                                                                    Text(
                                                                      dashboardLogic.nomineeList.isNotEmpty &&
                                                                              dashboardLogic.nomineeList[index]
                                                                                      ['schemeName'] !=
                                                                                  null
                                                                          ? dashboardLogic.nomineeList[index]
                                                                              ['schemeName']
                                                                          : '',
                                                                      style: StyleConfig.smallText
                                                                          .copyWith(color: ColorConfig.jsTextGreyColor),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox()
                                                            ],
                                                          ),
                                                          if (dashboardLogic.nomineeList.isNotEmpty &&
                                                              dashboardLogic.nomineeList[index]
                                                                      ['dateOfNomineeUpdation'] ==
                                                                  null)
                                                            SizedBox(
                                                              height: 15.h,
                                                            ),
                                                          if (dashboardLogic.nomineeList.isNotEmpty &&
                                                              dashboardLogic.nomineeList[index]
                                                                      ['dateOfNomineeUpdation'] !=
                                                                  null)
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        "Date of nominee updation :",
                                                                        style: StyleConfig.regularText16.copyWith(
                                                                            fontSize: 12.sp,
                                                                            color: ColorConfig.jsTextGreyColor),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 4.w,
                                                                      ),
                                                                      Expanded(
                                                                        child: Text(
                                                                            dashboardLogic.nomineeList.isNotEmpty &&
                                                                                    dashboardLogic.nomineeList[index]
                                                                                            ['dateOfNomineeUpdation'] !=
                                                                                        null
                                                                                ? AppUtils.convertDateFormat(
                                                                                    dashboardLogic.nomineeList[index]
                                                                                        ['dateOfNomineeUpdation'],
                                                                                    'yyyy-mm-dd',
                                                                                    'dd/mm/yyyy')
                                                                                : '-',
                                                                            style: StyleConfig.smallText.copyWith(
                                                                                fontSize: 12.sp,
                                                                                color: ColorConfig.jsTextGreyColor)),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                                                                  child: IconButton(
                                                                    onPressed: () {
                                                                      dashboardLogic.nomineeList.isNotEmpty &&
                                                                              dashboardLogic.nomineeList[index]
                                                                                      ['scheme'] !=
                                                                                  null &&
                                                                              dashboardLogic.nomineeList[index]['id'] !=
                                                                                  null
                                                                          ? dashboardLogic.onPressDownload(
                                                                              schemeId: dashboardLogic
                                                                                  .nomineeList[index]['scheme'],
                                                                              appId: dashboardLogic.nomineeList[index]
                                                                                  ['id'],
                                                                              orgId: dashboardLogic.nomineeList[index]
                                                                                  ['orgId'])
                                                                          : showSnackBar(context, "Download error");
                                                                    },
                                                                    icon: const Icon(Icons.download_rounded),
                                                                    color: ColorConfig.jsGreenColor,
                                                                    iconSize: 25.r,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          // SizedBox(
                                                          //   height: 20.h,
                                                          // ),
                                                          ListViewButtons(
                                                              onPress: () {
                                                                dashboardLogic.nomineeList[index]
                                                                            ['dateOfNomineeUpdation'] !=
                                                                        null
                                                                    ? null
                                                                    : Get.to(() => NomineeDetailsPage(),
                                                                        binding: NomineeDetailsBinding(),
                                                                        arguments: {
                                                                            AppArguments.screenName: "Service",
                                                                            AppArguments.appId:
                                                                                dashboardLogic.nomineeList[index]['id'],
                                                                          })?.then((value) {
                                                                        dashboardLogic.onGetNomineeList();
                                                                        dashboardLogic.isNomineeLoading.value = true;
                                                                        dashboardLogic.getSchemaDeatil();
                                                                      });
                                                              },
                                                              title: dashboardLogic.nomineeList.isNotEmpty &&
                                                                      dashboardLogic.nomineeList[index]
                                                                              ['dateOfNomineeUpdation'] !=
                                                                          null
                                                                  ? "Nominee Updated"
                                                                  : "Nominee Update")
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            if (dashboardLogic.isOptOutLoading.value || dashboardLogic.isNomineeLoading.value) const AppLoader(),
          ],
        );
      }),
    );
  }
}

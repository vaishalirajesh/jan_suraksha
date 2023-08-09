import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';

import '../../../../config/style_config.dart';
import 'dashboard_logic.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DashboardLogic>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConfig.jsCreamColor,
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
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
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 20.w),
                        child: Text(
                          "Happy to have you onboard! \nLet's start by finding out which insurance you need.",
                          style: StyleConfig.smallText.copyWith(fontSize: 12.sp, color: ColorConfig.jsDarkPinkColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
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
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                      border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                                  height: 110.h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.w, right: 20.w, top: 20.h),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.circle_outlined,
                                              size: 40.r,
                                            ),
                                            SizedBox(
                                              width: 10.w,
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
                                                  style: StyleConfig.mediumSmallText
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
                                        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                                        child: ListViewButtons(
                                          onPress: () {},
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
                  Expanded(
                    flex: 0,
                    child: Container(
                      color: ColorConfig.jsSecondaryColor,
                      child: const SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BottomAppBar(
        //   shape: const CircularNotchedRectangle(),
        //   notchMargin: 5.0,
        //   clipBehavior: Clip.antiAlias,
        //   child: SizedBox(
        //     height: kBottomNavigationBarHeight,
        //     child: Row(
        //       mainAxisSize: MainAxisSize.max,
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: <Widget>[
        //         Ima(
        //           icon: const Icon(Icons.home),
        //           onPressed: () {
        //             setState(() {});
        //           },
        //         ),
        //         IconButton(
        //           icon: const Icon(Icons.search),
        //           onPressed: () {
        //             setState(() {});
        //           },
        //         ),
        //         IconButton(
        //           icon: const Icon(Icons.favorite_border_outlined),
        //           onPressed: () {
        //             setState(() {});
        //           },
        //         ),
        //         IconButton(
        //           icon: const Icon(Icons.account_circle_outlined),
        //           onPressed: () {
        //             setState(() {});
        //           },
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

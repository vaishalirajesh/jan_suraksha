import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';

class CommonAppBar {
  static PreferredSizeWidget appbarWithTitle({required String title}) {
    return AppBar(
      backgroundColor: ColorConfig.jsCreamColor,
      elevation: 0,
      centerTitle: true,
      leading: Icon(
        Icons.arrow_back_sharp,
        color: ColorConfig.jsBlackColor,
        size: 25.r,
      ),
      title: Text(
        title,
        style: StyleConfig.mediumText18,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Container(
          color: ColorConfig.jsCreamColor,
        ),
      ),
    );
  }

  static PreferredSizeWidget appbarWithSubTitle({required String title, required String subTitle}) {
    return AppBar(
      backgroundColor: ColorConfig.jsCreamColor,
      elevation: 0,
      centerTitle: true,
      leading: Icon(
        Icons.arrow_back_sharp,
        color: ColorConfig.jsBlackColor,
        size: 25.r,
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Text(
          title,
          style: StyleConfig.mediumText18,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: Container(
          color: ColorConfig.jsCreamColor,
          child: Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Text(
              subTitle,
              style: StyleConfig.regularExtraSmallPinkText,
            ),
          ),
        ),
      ),
    );
  }

  static PreferredSizeWidget appbarWithNotification({required String title, required String subTitle}) {
    return AppBar(
      backgroundColor: ColorConfig.jsCreamColor,
      toolbarHeight: 110.h,
      elevation: 0,
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
                  title,
                  style: StyleConfig.regularLargeText,
                ),
                Icon(
                  Icons.notification_add,
                  color: ColorConfig.jsBlackColor,
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 0.6.sw,
              child: Text(
                maxLines: 2,
                subTitle,
                style: StyleConfig.regularExtraSmallPinkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

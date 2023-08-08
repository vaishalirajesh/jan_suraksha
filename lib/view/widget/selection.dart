import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/theme_helper.dart';
import 'package:jan_suraksha/utils/utils.dart';

class SelectionWidget extends StatelessWidget {
  const SelectionWidget(
      {Key? key,
      required this.isSelected,
      required this.index,
      required this.userName,
      required this.accountNumber,
      required this.cifNumber})
      : super(key: key);
  final bool isSelected;
  final int index;
  final String userName;
  final String cifNumber;
  final String accountNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 110.h,
            margin: EdgeInsets.only(top: 12.5.h),
            padding: EdgeInsets.only(left: 25.w, right: 10.w, top: 10.h),
            decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected
                      ? ThemeHelper.getInstance()!.colorScheme.primary
                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 45.r,
                  width: 45.r,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: SvgPicture.asset(
                    AppUtils.path(AppImages.userImage),
                    height: 30.r,
                    width: 30.r,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userName,
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsLightBlackColor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "${AppString.cifNo}$cifNumber",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsGreyColor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "${AppString.accountNo}$accountNumber",
                        style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsGreyColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                  color:
                      isSelected ? ColorConfig.jsGreenColor : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                )
              ],
            ),
          ),
        ),
        Container(
          height: 25.h,
          width: 1.sw,
          margin: EdgeInsets.symmetric(horizontal: 35.w),
          decoration: BoxDecoration(
            color: isSelected
                ? ThemeHelper.getInstance()!.colorScheme.primary
                : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(13.r),
          ),
          alignment: Alignment.center,
          child: Text(
            "$index${index == 1 ? 'st' : index == 2 ? 'nd' : index == 3 ? 'rd' : 'th'} ${AppString.accountHolder}",
            style: StyleConfig.semiBoldExtraSmallText.copyWith(
              color: isSelected
                  ? ThemeHelper.getInstance()!.colorScheme.background
                  : ThemeHelper.getInstance()!.colorScheme.onSecondary,
            ),
          ),
        )
      ],
    );
  }
}

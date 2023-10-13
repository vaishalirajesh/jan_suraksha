import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/theme_helper.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import 'account__selection__binding.dart';
import 'account__selection__logic.dart';

class AccountSelectionPage extends StatelessWidget {
  AccountSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AccountSelectionLogic>();
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Obx(() {
        return AddHeaderFooter(
          title: "Account Holder Details ",
          appbarName: AppString.appBarWithTitle,
          buttonTitle: "Continue",
          onButtonClick: logic.onPressContinue,
          onBackButtonCLick: () {
            Get.offAll(() => AccountSelectionPage(), binding: AccountSelectionBinding());
          },
          isDataLoading: logic.isLoading.value,
          isButtonEnable: true,
          isShowButton: true,
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Please select an account holder to proceed",
                  style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextGreyColor),
                ),
              )),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.builder(
                      itemCount: logic.verifyOtpResponseMain.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  logic.onChangeDetail(index);
                                },
                                child: Obx(() {
                                  return Container(
                                    height: 80.h,
                                    margin: EdgeInsets.only(top: 12.h, bottom: 20.h),
                                    padding: EdgeInsets.only(left: 25.w, right: 10.w, top: 10.h),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: logic.isSelectedIndex.value == index
                                            ? ThemeHelper.getInstance()!.colorScheme.primary
                                            : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                                      ),
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
                                                logic.verifyOtpResponseMain.data?[index].accountHolderName ?? '',
                                                style: StyleConfig.smallTextLight
                                                    .copyWith(color: ColorConfig.jsLightBlackColor),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              // Text(
                                              //   "${AppString.cifNo}$cifNumber",
                                              //   style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsGreyColor),
                                              // ),
                                              // SizedBox(
                                              //   height: 5.h,
                                              // ),
                                              // Text(
                                              //   "${AppString.accountNo}$accountNumber",
                                              //   style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsGreyColor),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Icon(
                                          logic.isSelectedIndex.value == index
                                              ? Icons.check_circle
                                              : Icons.circle_outlined,
                                          color: logic.isSelectedIndex.value == index
                                              ? ColorConfig.jsGreenColor
                                              : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              Container(
                                height: 25.h,
                                width: 1.sw,
                                margin: EdgeInsets.symmetric(horizontal: 35.w),
                                decoration: BoxDecoration(
                                  color: logic.isSelectedIndex.value == index
                                      ? ThemeHelper.getInstance()!.colorScheme.primary
                                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(13.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "${index + 1}${index + 1 == 1 ? 'st' : index + 1 == 2 ? 'nd' : index + 1 == 3 ? 'rd' : 'th'} ${AppString.accountHolder}",
                                  style: StyleConfig.semiBoldExtraSmallText.copyWith(
                                    color: logic.isSelectedIndex.value == index
                                        ? ThemeHelper.getInstance()!.colorScheme.background
                                        : ThemeHelper.getInstance()!.colorScheme.onSecondary,
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                      }),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        );
      }),
    );
  }
}

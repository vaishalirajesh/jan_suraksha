import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';

import 'certificate_insurence_logic.dart';

class CertificateInsurencePage extends StatelessWidget {
  CertificateInsurencePage({Key? key}) : super(key: key);

  final certificateInsurenceLogic = Get.find<CertificateInsurenceLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitle,
              title: AppString.insuranceTitle,
              buttonTitle: AppString.download,
              onBackButtonCLick: AppUtils.onBackToDashboard,
              onButtonClick: () {},
              isDataLoading: certificateInsurenceLogic.isLoading.value,
              isButtonEnable: true,
              isShowButton: false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: buildDownloadWidget(),
                      // ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        certificateInsurenceLogic.schemeId.value == 1 ? AppString.yojna : AppString.yojna2,
                        style: StyleConfig.boldText16.copyWith(color: ColorConfig.jsBlackColor),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        AppString.COI,
                        style: StyleConfig.boldText16
                            .copyWith(fontFamily: JSFonts.outfitRegular, color: ColorConfig.jsTextBlueGreyColor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                certificateInsurenceLogic.generateCoiData.data!.bankLogoUrl ?? '',
                                height: 30.r,
                                // width: 30.r,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.network(
                                certificateInsurenceLogic.generateCoiData.data!.logoUrl ?? '',
                                height: 30.r,
                                // width: 30.r,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                AppImages.jsLogo,
                                height: 25.h,
                                width: 25.w,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppString.janText,
                                      style: StyleConfig.boldText18.copyWith(color: ColorConfig.jsPrimaryColor),
                                    ),
                                    TextSpan(
                                      text: AppString.surakshaText,
                                      style: StyleConfig.boldText18.copyWith(color: ColorConfig.jsBlueColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      Table(
                        border: TableBorder.all(color: ColorConfig.jsGreyColor),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.r),
                                child: Text(
                                  certificateInsurenceLogic.schemeId.value == 1 ? AppString.yojna : AppString.yojna2,
                                  style: StyleConfig.mediumExtraSmallBlackText,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.r),
                                child: Text(
                                  certificateInsurenceLogic.generateCoiData.data?.nameOfInsurer ?? '-',
                                  style: StyleConfig.regularExtraSmallBText,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          TableRow(children: [
                            Text(
                              AppString.nameMember,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.nameOfMember ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.address,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.address ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.aadharNo,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.aadharNo ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.bankNo,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.aadharNo ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.nomineeName,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.nameOfNominee ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                AppString.commencement,
                                style: StyleConfig.mediumExtraSmallBlackText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                AppUtils.convertDateFormat(
                                    certificateInsurenceLogic.generateCoiData.data?.dateOfComOfCover,
                                    'yyyy-mm-dd',
                                    'dd/mm/yyyy'),
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.amountPaid,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                'Rs. ${certificateInsurenceLogic.generateCoiData.data?.premAmtPaid}',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.sumAssured,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.sumAssured ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.policyNo,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.mstPolicyNo ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.urno,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.urnNo ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.mobileNumber,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.mobileNo ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.dateOfBirth,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                AppUtils.convertDateFormat(
                                    certificateInsurenceLogic.generateCoiData.data?.dob, 'yyyy-mm-dd', 'dd/mm/yyyy'),
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.bank,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.nameOfBank ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.age,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                '${certificateInsurenceLogic.generateCoiData.data?.ageOfNominee} Years' ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.coverDate,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.coverEndDate ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.lienPeriod,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.lienPeriod ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Text(
                              AppString.renewalDate,
                              style: StyleConfig.mediumExtraSmallBlackText,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Text(
                                certificateInsurenceLogic.generateCoiData.data?.annuRenDate ?? '-',
                                style: StyleConfig.regularExtraSmallBText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        AppString.insurance1,
                        style: StyleConfig.mediumExtraSmallBlackText,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppString.insurance2,
                        style: StyleConfig.mediumExtraSmallBlackText,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppString.insurance3,
                              style: StyleConfig.mediumExtraSmallBlackText,
                            ),
                            TextSpan(
                              text: AppString.insurance4,
                              style: StyleConfig.mediumExtraSmallBlackText.copyWith(
                                color: ColorConfig.jsPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        AppString.insurance5,
                        style: StyleConfig.semiBoldSmallText,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppString.insurance6,
                          style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsBlackColor),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppButton(
                        onPress: certificateInsurenceLogic.onPressDownload,
                        title: "Download",
                        isButtonEnable: true.obs,
                        isDataLoading: false.obs,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (certificateInsurenceLogic.isLoading.value) const AppLoader(),
          ],
        );
      }),
    );
  }

  Widget buildDownloadWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 120.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
          border: Border.all(color: ColorConfig.jsLightGreyColor, width: 1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 5.w,
            ),
            Icon(
              Icons.file_download,
              color: ColorConfig.jsTextGreyColor,
              size: 18.h,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              AppString.download,
              style: StyleConfig.semiBoldExtraSmallText.copyWith(
                color: ColorConfig.jsTextGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

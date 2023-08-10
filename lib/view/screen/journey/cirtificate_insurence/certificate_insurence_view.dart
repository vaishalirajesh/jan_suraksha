import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import 'certificate_insurence_logic.dart';

class CertificateInsurencePage extends StatelessWidget {
  CertificateInsurencePage({Key? key}) : super(key: key);

  final certificateInsurenceLogic = Get.find<CertificateInsurenceLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => DashboardPage(), binding: DashboardBinding());
        return true;
      },
      child: AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: AppString.insuranceTitle,
        buttonTitle: AppString.emptyText,
        onButtonClick: () {},
        isDataLoading: false,
        isButtonEnable: false,
        isShowButton: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: buildDownloadWidget(),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppUtils.path(AppImages.sbiLogo),
                      height: 30.r,
                      width: 30.r,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          AppImages.jsLogo,
                          height: 20.h,
                          width: 20.w,
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
                                style: StyleConfig.boldText16.copyWith(color: ColorConfig.jsPrimaryColor),
                              ),
                              TextSpan(
                                text: AppString.surakshaText,
                                style: StyleConfig.boldText16.copyWith(color: ColorConfig.jsBlueColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  AppString.ackInsurance,
                  style: StyleConfig.semiBoldText20.copyWith(decoration: TextDecoration.underline),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.h,
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
                            AppString.yojana,
                            style: StyleConfig.mediumExtraSmallBlackText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Text(
                            'State Bank Of India',
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
                          'Abc Xyz',
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
                          'Ankur Apartments Ambavadi, Ahmedabad, 384551',
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
                          '-',
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
                          '49383838',
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
                          'xxx',
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
                          '20/09/2022',
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
                          'Rs. 200,000*',
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
                          'Rs. 436',
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
                          '76001001549',
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
                          'PMJ0000001797',
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
                          '9768693970',
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
                          'State Bank Of India',
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
                          '30 Years',
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
                          '31/05/2022',
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
                          '30 Days From The Date Of Enrolment / Re-Joining',
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
                          '1 st June of every year',
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
                Text(
                  AppString.insurance6,
                  style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsBlackColor),
                ),
              ],
            ),
          ),
        ),
      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      onWillPop: AppUtils.onWillNoPop,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitle,
              title: AppString.insuranceTitle,
              buttonTitle: AppString.download,
              onBackButtonCLick: AppUtils.onBackToDashboard,
              onButtonClick: () {},
              isDataLoading: certificateInsurenceLogic.isDownLoading.value,
              isButtonEnable: true,
              isShowButton: false,
              isLeading: false,
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
                      Obx(() {
                        return Text(
                          certificateInsurenceLogic.schemeId.value == 1 ? AppString.yojna2 : AppString.yojna,
                          style: StyleConfig.boldText16.copyWith(color: ColorConfig.jsBlackColor),
                          textAlign: TextAlign.center,
                        );
                      }),
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
                              AppUtils.getImageFromType(
                                  imageUrl: certificateInsurenceLogic.generateCoiData.data?.logoUrl ?? ''),
                              SizedBox(
                                width: 10.w,
                              ),
                              AppUtils.getImageFromType(
                                  imageUrl: certificateInsurenceLogic.generateCoiData.data?.bankLogoUrl ?? '')
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
                      certificateInsurenceLogic.schemeId.value == 1
                          ? Table(
                              border: TableBorder.all(color: ColorConfig.jsGreyColor),
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        certificateInsurenceLogic.schemeId.value == 1
                                            ? AppString.yojna2
                                            : AppString.yojna,
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
                                    certificateInsurenceLogic.generateCoiData.data?.kycName ?? '',
                                    style: StyleConfig.mediumExtraSmallBlackText,
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.r),
                                    child: Text(
                                      certificateInsurenceLogic.generateCoiData.data?.kycValue ?? '-',
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
                                      certificateInsurenceLogic.generateCoiData.data?.accountNo ?? '-',
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
                                if (!certificateInsurenceLogic.isLoading.value &&
                                    certificateInsurenceLogic.generateCoiData.data?.ageOfNominee != null &&
                                    int.parse(certificateInsurenceLogic.generateCoiData.data!.ageOfNominee!) < 18)
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        'Name of Guardian/Appointee (In case of minor nominee)',
                                        style: StyleConfig.mediumExtraSmallBlackText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        certificateInsurenceLogic.generateCoiData.data?.nameOfGuardian ?? '-',
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
                                      certificateInsurenceLogic.generateCoiData.data?.dateOfComOfCover != null
                                          ? DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(
                                                  certificateInsurenceLogic.generateCoiData.data?.dateOfComOfCover ??
                                                      '')
                                              .toLocal())
                                          : '',
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
                                      AppUtils.convertDateFormat(certificateInsurenceLogic.generateCoiData.data?.dob,
                                          'yyyy-mm-dd', 'dd/mm/yyyy'),
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
                                if (!certificateInsurenceLogic.isLoading.value &&
                                    certificateInsurenceLogic.generateCoiData.data?.ageOfNominee != null &&
                                    int.parse(certificateInsurenceLogic.generateCoiData.data!.ageOfNominee!) < 18)
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        'Relationship of Guardian/Appointee with Nominee (In case of minor nominee)',
                                        style: StyleConfig.mediumExtraSmallBlackText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        certificateInsurenceLogic.generateCoiData.data?.relationShipOfGuardian ?? '-',
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
                            )
                          : Table(
                              border: TableBorder.all(color: ColorConfig.jsGreyColor),
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        certificateInsurenceLogic.schemeId.value == 1
                                            ? AppString.yojna2
                                            : AppString.yojna,
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
                                    certificateInsurenceLogic.generateCoiData.data?.kycName ?? '',
                                    style: StyleConfig.mediumExtraSmallBlackText,
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.r),
                                    child: Text(
                                      certificateInsurenceLogic.generateCoiData.data?.kycValue ?? '-',
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
                                      certificateInsurenceLogic.generateCoiData.data?.accountNo ?? '-',
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
                                if (!certificateInsurenceLogic.isLoading.value &&
                                    certificateInsurenceLogic.generateCoiData.data?.ageOfNominee != null &&
                                    int.parse(certificateInsurenceLogic.generateCoiData.data!.ageOfNominee!) < 18)
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        'Name of Guardian/Appointee (In case of minor nominee)',
                                        style: StyleConfig.mediumExtraSmallBlackText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        certificateInsurenceLogic.generateCoiData.data?.nameOfGuardian ?? '-',
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
                                      certificateInsurenceLogic.generateCoiData.data?.dateOfComOfCover != null
                                          ? DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(
                                                  certificateInsurenceLogic.generateCoiData.data?.dateOfComOfCover ??
                                                      '')
                                              .toLocal())
                                          : '',
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
                                      AppUtils.convertDateFormat(certificateInsurenceLogic.generateCoiData.data?.dob,
                                          'yyyy-mm-dd', 'dd/mm/yyyy'),
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
                                if (!certificateInsurenceLogic.isLoading.value &&
                                    certificateInsurenceLogic.generateCoiData.data?.ageOfNominee != null &&
                                    int.parse(certificateInsurenceLogic.generateCoiData.data!.ageOfNominee!) < 18)
                                  TableRow(children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        '"Relationship of Guardian/Appointee with Nominee (In case of minor nominee)',
                                        style: StyleConfig.mediumExtraSmallBlackText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.r),
                                      child: Text(
                                        certificateInsurenceLogic.generateCoiData.data?.relationShipOfGuardian ?? '-',
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
                              ],
                            ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        certificateInsurenceLogic.schemeId.value == 1
                            ? "* Rs. 2 lakh is payable on member's death due to accident."
                            : "* Rs. 2 lakh is payable on member's death due to any cause",
                        style: StyleConfig.mediumExtraSmallBlackText,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        certificateInsurenceLogic.schemeId.value == 1
                            ? "Rs. 2 lakhs is payable on total and irrecoverable loss of both eyes or loss of use of both hands or feet or loss of sight of one eye and loss of use of one hand or foot due to accident"
                            : "** In case of death (other than due to accident) during lien period , no claim would be admissible.\n\n The terms and conditions of the scheme are available at https://jansuraksha.in",
                        style: StyleConfig.mediumExtraSmallBlackText,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      if (certificateInsurenceLogic.schemeId.value == 1)
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: certificateInsurenceLogic.schemeId.value == 1
                                    ? "Rs 1 Lakh is payable on total and irrecoverable loss of sight of one eye or loss of use of one hand or foot due to accident"
                                    : "",
                                style: StyleConfig.mediumExtraSmallBlackText,
                              ),
                            ],
                          ),
                        ),
                      if (certificateInsurenceLogic.schemeId.value == 1)
                        SizedBox(
                          height: 10.h,
                        ),
                      if (certificateInsurenceLogic.schemeId.value == 1)
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: certificateInsurenceLogic.schemeId.value == 1
                                  ? "The terms and conditions of the scheme are available at "
                                  : "",
                              style: StyleConfig.mediumExtraSmallBlackText,
                            ),
                            TextSpan(
                              text: certificateInsurenceLogic.schemeId.value == 1 ? "https://jansuraksha.in/" : "",
                              style: StyleConfig.boldExtraLargeText.copyWith(fontSize: 12.sp),
                            ),
                          ]),
                        ),
                      if (certificateInsurenceLogic.schemeId.value == 1)
                        SizedBox(
                          height: 20.h,
                        ),
                      Text(
                        AppString.insurance5,
                        style: StyleConfig.semiBoldSmallText,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          certificateInsurenceLogic.generateCoiData.data?.dateOfComOfCover != null
                              ? DateFormat('dd/MM/yyyy HH:mm:ss').format(
                                  DateTime.parse(certificateInsurenceLogic.generateCoiData.data?.dateOfComOfCover ?? '')
                                      .toLocal())
                              : '',
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
                        isDataLoading: certificateInsurenceLogic.isDownLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (certificateInsurenceLogic.isLoading.value) AppLoader(),
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

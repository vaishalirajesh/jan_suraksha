import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';
import 'package:jan_suraksha/view/widget/disable_test_field.dart';

import 'preview_application_form_logic.dart';

class PreviewApplicationPage extends StatelessWidget {
  PreviewApplicationPage({Key? key}) : super(key: key);
  final previewApplicationFormLogic = Get.find<PreviewApplicationFormLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitleAndProgressBar,
              title: AppString.previewApplicationForm,
              buttonTitle: AppString.submit,
              onButtonClick: previewApplicationFormLogic.onPressContinue,
              isDataLoading: previewApplicationFormLogic.isLoading.value,
              onBackButtonCLick: AppUtils.onBackToDashboard,
              isButtonEnable: true,
              progress: 0.8,
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Obx(
                  () => !previewApplicationFormLogic.isDataLoaded.value
                      ? const SizedBox.shrink()
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.appDetail,
                                style: StyleConfig.mediumText18.copyWith(
                                  color: ColorConfig.jsPrimaryColor,
                                  fontFamily: JSFonts.outfitMedium,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic.getAppData.data?.firstName ?? '',
                                title: AppString.firstName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: previewApplicationFormLogic.getAppData.data?.middleName ?? '',
                                title: AppString.middleName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: previewApplicationFormLogic.getAppData.data?.lastName ?? '',
                                title: AppString.lastName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic.getAppData.data?.fatherHusbandName ?? '',
                                title: AppString.fatherName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: AppUtils.convertDateFormat(
                                    previewApplicationFormLogic.getAppData.data?.dob, 'yyyy-mm-dd', 'dd/mm/yyyy'),
                                title: AppString.dateOfBirth,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: '+91 ${previewApplicationFormLogic.getAppData.data?.mobileNo ?? ''}',
                                title: AppString.mobileNumber,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: previewApplicationFormLogic.getAppData.data?.emailAddress ?? '',
                                title: AppString.emailId,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: previewApplicationFormLogic.getAppData.data?.insuranceName ?? '',
                                title: AppString.insurerName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                AppString.appAddDetail,
                                style: StyleConfig.mediumText18.copyWith(
                                  color: ColorConfig.jsPrimaryColor,
                                  fontFamily: JSFonts.outfitMedium,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic.getAppData.data?.address?.addressLine1 ?? '',
                                title: AppString.addressLine1,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: previewApplicationFormLogic.getAppData.data?.address?.addressLine2 ?? '',
                                title: AppString.addressLine2,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic.getAppData.data?.address?.city ?? '',
                                title: AppString.city,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic.getAppData.data?.address?.district ?? '',
                                title: AppString.district,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic.getAppData.data?.address?.state ?? '',
                                title: AppString.state,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic.getAppData.data?.address?.pincode != null
                                    ? '${previewApplicationFormLogic.getAppData.data?.address?.pincode}'
                                    : '',
                                title: AppString.pincode,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                AppString.nomineeDetail,
                                style: StyleConfig.mediumText18.copyWith(
                                  color: ColorConfig.jsPrimaryColor,
                                  fontFamily: JSFonts.outfitMedium,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.firstName ?? '',
                                title: AppString.firstName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.middleName ?? '',
                                title: AppString.middleName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: previewApplicationFormLogic.getAppData.data!.nominee?.first.lastName ?? '',
                                title: AppString.lastName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: AppUtils.convertDateFormat(
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.dateOfBirth,
                                    'yyyy-mm-dd',
                                    'dd/mm/yyyy'),
                                title: AppString.dateOfBirth,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale:
                                    '+91 ${previewApplicationFormLogic.getAppData.data!.nominee?.first.mobileNumber ?? ''}',
                                title: AppString.mobileNumber,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic
                                        .getAppData.data!.nominee?.first.relationOfNomineeApplicantStr ??
                                    '',
                                title: AppString.relationWithApplicant,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.emailIdOfNominee ?? '',
                                title: AppString.emailId,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                AppString.nomineeAddDetail,
                                style: StyleConfig.mediumText18.copyWith(
                                  color: ColorConfig.jsPrimaryColor,
                                  fontFamily: JSFonts.outfitMedium,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.address?.addressLine1 ??
                                        '',
                                title: AppString.addressLine1,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.address?.addressLine2 ??
                                        '',
                                title: AppString.addressLine2,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.address?.city ?? '',
                                title: AppString.cityName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.address?.district ?? '',
                                title: AppString.district,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.address?.state ?? '',
                                title: AppString.state,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: previewApplicationFormLogic
                                            .getAppData.data!.nominee?.first.address?.pincode !=
                                        null
                                    ? '${previewApplicationFormLogic.getAppData.data!.nominee?.first.address?.pincode}'
                                    : '',
                                title: AppString.pincode,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                AppString.guardianDetail,
                                style: StyleConfig.mediumText18.copyWith(
                                  color: ColorConfig.jsPrimaryColor,
                                  fontFamily: JSFonts.outfitMedium,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                isReadOnly: true,
                                title: AppString.name,
                                hintText: AppString.enterYourName,
                                inputType: TextInputType.text,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.nameOfGuardian ?? '',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                isReadOnly: true,
                                title: AppString.address,
                                hintText: AppString.enterYourAddress,
                                inputType: TextInputType.text,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.addressOfGuardian ?? '',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                isReadOnly: true,
                                title: AppString.relationNominee,
                                hintText: AppString.selectRelation,
                                inputType: TextInputType.text,
                                initialvale: previewApplicationFormLogic
                                        .getAppData.data!.nominee?.first.relationShipOfGuardianStr ??
                                    '',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                isReadOnly: true,
                                title: AppString.mobileNumber,
                                hintText: AppString.enterMobile,
                                inputType: TextInputType.phone,
                                initialvale: previewApplicationFormLogic
                                        .getAppData.data!.nominee?.first.mobileNumberOfGuardian ??
                                    '',
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                isReadOnly: true,
                                title: AppString.emailId,
                                hintText: AppString.enterEmail,
                                inputType: TextInputType.emailAddress,
                                initialvale:
                                    previewApplicationFormLogic.getAppData.data!.nominee?.first.emailIdOfGuardian ?? '',
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            if (!previewApplicationFormLogic.isDataLoaded.value) const AppLoader()
          ],
        );
      }),
    );
  }
}

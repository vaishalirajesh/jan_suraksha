import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/disable_test_field.dart';

import 'preview_application_form_logic.dart';

class PreviewApplicationPage extends StatelessWidget {
  PreviewApplicationPage({Key? key}) : super(key: key);
  final previewApplicationFormLogic = Get.find<PreviewApplicationFormLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: AppString.previewApplicationForm,
        buttonTitle: AppString.continueText,
        onButtonClick: previewApplicationFormLogic.onPressContinue,
        isDataLoading: false,
        isButtonEnable: previewApplicationFormLogic.isDataLoaded.value,
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Obx(
            () => !previewApplicationFormLogic.isDataLoaded.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
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
                          initialvale: "MAXXXX",
                          title: AppString.firstName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'CHAXXXXXX',
                          title: AppString.middleName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'TAXXXXX',
                          title: AppString.lastName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'TAXXXXX',
                          title: AppString.fatherName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: '01/01/2020',
                          title: AppString.dateOfBirth,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: '+91 1234567890',
                          title: AppString.mobileNumber,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'abc@gmail.com',
                          title: AppString.emailId,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'abc insurer pvt. ltd.',
                          title: AppString.insurerName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 25.h,
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
                          initialvale: 'Shanti XXXXXX',
                          title: AppString.addressLine1,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'Indira Gandhi Rd, Opp. XXXX XXXXX XX sfsf sbfdhs hsgdfgsf kfs',
                          title: AppString.addressLine2,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'Kalol',
                          title: AppString.city,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'Ahmedabad',
                          title: AppString.district,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'Gujarat',
                          title: AppString.state,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: '123456',
                          title: AppString.pincode,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 25.h,
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
                          initialvale: "MAXXXX",
                          title: AppString.firstName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'CHAXXXXXX',
                          title: AppString.middleName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'TAXXXXX',
                          title: AppString.lastName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: '01/01/2020',
                          title: AppString.dateOfBirth,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'Wife',
                          title: AppString.relationWithApplicant,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: '+91 1234567890',
                          title: AppString.mobileNumber,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'abc@gmail.com',
                          title: AppString.emailId,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 25.h,
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
                          initialvale: 'Shanti XXXXXX',
                          title: AppString.addressLine1,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'Indira Gandhi Rd, Opp. XXXX XXXXX XX sfsf sbfdhs hsgdfgsf kfs',
                          title: AppString.addressLine2,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'Kalol',
                          title: AppString.cityName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'Ahmedabad',
                          title: AppString.district,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'Gujarat',
                          title: AppString.state,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: '123456',
                          title: AppString.pincode,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 25.h,
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
                          initialvale: 'Abc',
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
                          initialvale: 'Ahmedabad',
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
                          initialvale: 'Sister',
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
                          initialvale: '+91 1234567890',
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
                          initialvale: 'anc@gmail.com',
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }
}

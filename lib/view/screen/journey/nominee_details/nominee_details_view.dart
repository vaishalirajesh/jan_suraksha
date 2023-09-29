import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/font_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/theme_helper.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';
import 'package:jan_suraksha/view/widget/app_textfield.dart';

import 'nominee_details_logic.dart';

class NomineeDetailsPage extends StatelessWidget {
  NomineeDetailsPage({Key? key}) : super(key: key);

  final nomineeDetailsLogic = Get.find<NomineeDetailsLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitleAndProgressBar,
              title: AppString.nomineeDetails,
              buttonTitle: AppString.continueText,
              onButtonClick: nomineeDetailsLogic.onPressContinue,
              isDataLoading: false,
              onBackButtonCLick: AppUtils.onBackPress,
              isButtonEnable: true,
              progress: 0.6,
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Obx(
                  () => !nomineeDetailsLogic.isLoading.value
                      ? const SizedBox.shrink()
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextField(
                                isMandatory: true,
                                title: AppString.firstName,
                                controller: nomineeDetailsLogic.firstNameController,
                                hintText: AppString.enterFirstName,
                                inputType: TextInputType.text,
                                errorText: nomineeDetailsLogic.fNameErrorMsg.value,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: false,
                                title: AppString.middleName,
                                controller: nomineeDetailsLogic.middleNameController,
                                hintText: AppString.enterMiddleName,
                                inputType: TextInputType.text,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: false,
                                title: AppString.lastName,
                                controller: nomineeDetailsLogic.latsNameController,
                                hintText: AppString.enterlastName,
                                inputType: TextInputType.text,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.dateOfBirth,
                                controller: nomineeDetailsLogic.dobController,
                                hintText: AppString.dateOfBirthType,
                                isDobField: true,
                                isReadOnly: true,
                                onTap: nomineeDetailsLogic.selectDate,
                                errorText: nomineeDetailsLogic.dobErrorMsg.value,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: false,
                                title: AppString.mobileNumber,
                                controller: nomineeDetailsLogic.mobileController,
                                hintText: AppString.enterMobile,
                                inputType: TextInputType.phone,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.relation,
                                controller: nomineeDetailsLogic.relationWithApplicantController,
                                hintText: AppString.selectRelation,
                                inputType: TextInputType.text,
                                // suffix: DropdownButtonFormField(
                                //   padding: EdgeInsets.zero,
                                //   dropdownColor: ColorConfig.jsPrimaryColor,
                                //   value: nomineeDetailsLogic.selectedValue.value,
                                //   decoration: InputDecoration(
                                //     contentPadding: EdgeInsets.zero,
                                //     isDense: true,
                                //     border: null,
                                //   ),
                                //   onChanged: (newValue) {
                                //     nomineeDetailsLogic.selectedValue.value = newValue ?? '';
                                //   },
                                //   items: nomineeDetailsLogic.items.map<DropdownMenuItem<String>>((String value) {
                                //     return DropdownMenuItem<String>(
                                //       value: value,
                                //       child: Text(
                                //         value,
                                //         overflow: TextOverflow.ellipsis,
                                //       ),
                                //     );
                                //   }).toList(),
                                // ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: false,
                                title: AppString.emailId,
                                controller: nomineeDetailsLogic.emailController,
                                hintText: AppString.enterEmail,
                                inputType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                AppString.nomineeAddress,
                                style: StyleConfig.mediumText18.copyWith(
                                  color: ColorConfig.jsPrimaryColor,
                                  fontFamily: JSFonts.outfitMedium,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    return Theme(
                                      data: ThemeData(
                                        useMaterial3: true,
                                      ),
                                      child: SizedBox(
                                        height: 22.r,
                                        width: 22.r,
                                        child: Checkbox(
                                          checkColor: ThemeHelper.getInstance()!.colorScheme.background,
                                          activeColor: ColorConfig.jsBlueColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6.r),
                                            ),
                                          ),
                                          side: BorderSide(
                                            width: 1,
                                            color: nomineeDetailsLogic.isChecked.value ? ThemeHelper.getInstance()!.primaryColor : ThemeHelper.getInstance()!.disabledColor,
                                          ),
                                          value: nomineeDetailsLogic.isChecked.value,
                                          onChanged: (bool? value) {
                                            nomineeDetailsLogic.isChecked(value);
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                  Flexible(
                                    child: Text(
                                      AppString.applicantAdd,
                                      style: StyleConfig.regularText16.copyWith(color: nomineeDetailsLogic.isChecked.value ? ColorConfig.jsBlueColor : ThemeHelper.getInstance()!.disabledColor, fontSize: 15.sp),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.addressLine1,
                                controller: nomineeDetailsLogic.addressOneController,
                                hintText: AppString.enterAddress,
                                inputType: TextInputType.streetAddress,
                                errorText: nomineeDetailsLogic.addressErrorMsg.value,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: false,
                                title: AppString.addressLine2,
                                controller: nomineeDetailsLogic.addressTwoController,
                                hintText: AppString.enterAddress,
                                inputType: TextInputType.streetAddress,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.cityName,
                                controller: nomineeDetailsLogic.cityController,
                                hintText: AppString.enterCity,
                                inputType: TextInputType.text,
                                errorText: nomineeDetailsLogic.cityErrorMsg.value,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.district,
                                controller: nomineeDetailsLogic.districtController,
                                hintText: AppString.enterDisctrict,
                                inputType: TextInputType.text,
                                errorText: nomineeDetailsLogic.districtErrorMsg.value,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.state,
                                controller: nomineeDetailsLogic.stateController,
                                hintText: AppString.enterState,
                                errorText: nomineeDetailsLogic.stateErrorMsg.value,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.pincode,
                                controller: nomineeDetailsLogic.pinCodeController,
                                hintText: AppString.enterPincode,
                                inputType: TextInputType.number,
                                maxLength: 6,
                                errorText: nomineeDetailsLogic.pinCodeErrorMsg.value,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            if (!nomineeDetailsLogic.isLoading.value) const AppLoader()
          ],
        );
      }),
    );
  }
}

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
                              Obx(() {
                                return AppTextField(
                                  isMandatory: true,
                                  title: AppString.firstName,
                                  maxLength: 50,
                                  controller: nomineeDetailsLogic.firstNameController,
                                  hintText: AppString.enterFirstName,
                                  inputType: TextInputType.name,
                                  errorText: nomineeDetailsLogic.fNameErrorMsg.value,
                                  onChanged: (str) {
                                    if (nomineeDetailsLogic.firstNameController.text.trim().isEmpty) {
                                      nomineeDetailsLogic.fNameErrorMsg.value = 'Please enter first name';
                                    } else if (!nomineeDetailsLogic.onlyCharRegExp
                                            .hasMatch(nomineeDetailsLogic.firstNameController.text) ||
                                        nomineeDetailsLogic.firstNameController.text == ' ' ||
                                        nomineeDetailsLogic.firstNameController.text.substring(0, 1) == ' ') {
                                      nomineeDetailsLogic.fNameErrorMsg.value = 'Please enter valid first name';
                                    } else {
                                      nomineeDetailsLogic.fNameErrorMsg.value = '';
                                    }
                                  },
                                );
                              }),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: false,
                                title: AppString.middleName,
                                maxLength: 50,
                                shouldInputNamesOnly: true,
                                controller: nomineeDetailsLogic.middleNameController,
                                hintText: AppString.enterMiddleName,
                                inputType: TextInputType.text,
                                errorText: nomineeDetailsLogic.mNameErrorMsg.value,
                                onChanged: (str) {
                                  if ((nomineeDetailsLogic.middleNameController.text.isNotEmpty &&
                                      (!nomineeDetailsLogic.onlyCharRegExp
                                              .hasMatch(nomineeDetailsLogic.middleNameController.text) ||
                                          nomineeDetailsLogic.middleNameController.text.substring(0, 1) == ' '))) {
                                    nomineeDetailsLogic.mNameErrorMsg.value = 'Please enter valid middle name';
                                  } else {
                                    nomineeDetailsLogic.mNameErrorMsg.value = '';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: false,
                                title: AppString.lastName,
                                maxLength: 50,
                                controller: nomineeDetailsLogic.latsNameController,
                                hintText: AppString.enterlastName,
                                inputType: TextInputType.text,
                                shouldInputNamesOnly: true,
                                errorText: nomineeDetailsLogic.lNameErrorMsg.value,
                                onChanged: (str) {
                                  if ((nomineeDetailsLogic.latsNameController.text.trim().isNotEmpty &&
                                          (!nomineeDetailsLogic.onlyCharRegExp
                                                  .hasMatch(nomineeDetailsLogic.latsNameController.text) ||
                                              nomineeDetailsLogic.latsNameController.text.substring(0, 1) == ' ')) ||
                                      nomineeDetailsLogic.latsNameController.text == ' ') {
                                    nomineeDetailsLogic.lNameErrorMsg.value = 'Please enter valid last name';
                                  } else {
                                    nomineeDetailsLogic.lNameErrorMsg.value = '';
                                  }
                                },
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
                                maxLength: 10,
                                title: AppString.mobileNumber,
                                controller: nomineeDetailsLogic.mobileController,
                                hintText: AppString.enterMobile,
                                inputType: TextInputType.phone,
                                errorText: nomineeDetailsLogic.mobileErrorMsg.value,
                                onChanged: (str) {
                                  if (((nomineeDetailsLogic.mobileController.text.trim().isNotEmpty &&
                                              !nomineeDetailsLogic.mobileRegExp
                                                  .hasMatch(nomineeDetailsLogic.mobileController.text)) ||
                                          nomineeDetailsLogic.mobileController.text == ' ' ||
                                          (nomineeDetailsLogic.mobileController.text.trim().isNotEmpty &&
                                              !nomineeDetailsLogic.mobileRegExpStartChar.hasMatch(
                                                  nomineeDetailsLogic.mobileController.text.substring(0, 1)))) ||
                                      (nomineeDetailsLogic.mobileController.text.trim().isNotEmpty &&
                                          nomineeDetailsLogic.mobileController.text.trim().length != 10)) {
                                    nomineeDetailsLogic.mobileErrorMsg.value = 'Please enter valid mobile number';
                                  } else {
                                    nomineeDetailsLogic.mobileErrorMsg.value = '';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Relationship with the applicant",
                                      style: StyleConfig.mediumText16,
                                    ),
                                    TextSpan(
                                      text: "*",
                                      style: StyleConfig.mediumText16.copyWith(color: ColorConfig.jsPrimaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              nomineeDetailsLogic.items.value.isEmpty
                                  ? AppTextField(
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
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          width: 0.87.sw,
                                          height: 60,
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            border:
                                                Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                                          ),
                                          child: SizedBox(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                items: nomineeDetailsLogic.items.values
                                                    .map((value) => DropdownMenuItem(
                                                          child: Container(
                                                              child: Text(
                                                            value,
                                                            style: StyleConfig.mediumText16,
                                                          )),
                                                          value: value,
                                                        ))
                                                    .toList(),
                                                onChanged: (i) {
                                                  nomineeDetailsLogic.relationErrorMsg.value = '';
                                                  nomineeDetailsLogic.items.value.forEach((key, value) {
                                                    if (i.toString() == value) {
                                                      nomineeDetailsLogic.relationshipid.value =
                                                          int.parse(key.toString());
                                                    }
                                                  });
                                                  nomineeDetailsLogic.nomineeRelationShip.value = i.toString();
                                                  print(i!);
                                                },
                                                isExpanded: false,
                                                value: nomineeDetailsLogic.nomineeRelationShip.value,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Obx(() {
                                          return nomineeDetailsLogic.relationErrorMsg.value.isNotEmpty
                                              ? Padding(
                                                  padding: EdgeInsets.only(top: 5.h),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        nomineeDetailsLogic.relationErrorMsg.value,
                                                        style: StyleConfig.smallTextLight
                                                            .copyWith(color: ColorConfig.jsRedColor),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : SizedBox.shrink();
                                        })
                                      ],
                                    ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                maxLength: 255,
                                isMandatory: false,
                                title: AppString.emailId,
                                controller: nomineeDetailsLogic.emailController,
                                hintText: AppString.enterEmail,
                                inputType: TextInputType.emailAddress,
                                errorText: nomineeDetailsLogic.emailErrorMsg.value,
                                onChanged: (str) {
                                  if (nomineeDetailsLogic.emailController.text.trim().isNotEmpty &&
                                      (nomineeDetailsLogic.emailController.text.trim().length < 5 ||
                                          !nomineeDetailsLogic.emailRegExp
                                              .hasMatch(nomineeDetailsLogic.emailController.text) ||
                                          nomineeDetailsLogic.emailController.text.substring(0, 1) == ' ')) {
                                    nomineeDetailsLogic.emailErrorMsg.value = 'Please enter valid email';
                                  } else {
                                    nomineeDetailsLogic.emailErrorMsg.value = '';
                                  }
                                },
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
                                            color: nomineeDetailsLogic.isChecked.value
                                                ? ThemeHelper.getInstance()!.primaryColor
                                                : ThemeHelper.getInstance()!.disabledColor,
                                          ),
                                          value: nomineeDetailsLogic.isChecked.value,
                                          onChanged: (bool? value) {
                                            nomineeDetailsLogic.onChangeCheckboxValue(value ?? false);
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
                                      style: StyleConfig.regularText16.copyWith(
                                          color: nomineeDetailsLogic.isChecked.value
                                              ? ColorConfig.jsBlueColor
                                              : ThemeHelper.getInstance()!.disabledColor,
                                          fontSize: 15.sp),
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
                                maxLength: 500,
                                controller: nomineeDetailsLogic.addressOneController,
                                hintText: AppString.enterAddress,
                                inputType: TextInputType.streetAddress,
                                errorText: nomineeDetailsLogic.addressErrorMsg.value,
                                onChanged: (str) {
                                  if (nomineeDetailsLogic.addressOneController.text.trim().isEmpty ||
                                      nomineeDetailsLogic.addressOneController.text.trim().length < 2 ||
                                      nomineeDetailsLogic.addressOneController.text.substring(0, 1) == ' ' ||
                                      nomineeDetailsLogic.specialCharExpStartChar.hasMatch(
                                          nomineeDetailsLogic.addressOneController.text.trim().substring(0, 1))) {
                                    nomineeDetailsLogic.addressErrorMsg.value = 'Please enter valid address';
                                  } else {
                                    nomineeDetailsLogic.addressErrorMsg.value = '';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: false,
                                maxLength: 500,
                                title: AppString.addressLine2,
                                controller: nomineeDetailsLogic.addressTwoController,
                                hintText: AppString.enterAddress,
                                inputType: TextInputType.streetAddress,
                                errorText: nomineeDetailsLogic.address2ErrorMsg.value,
                                onChanged: (str) {
                                  if (nomineeDetailsLogic.addressTwoController.text.isNotEmpty &&
                                      (nomineeDetailsLogic.addressTwoController.text.trim().length < 2 ||
                                          nomineeDetailsLogic.addressTwoController.text.substring(0, 1) == ' ' ||
                                          nomineeDetailsLogic.specialCharExpStartChar.hasMatch(
                                              nomineeDetailsLogic.addressTwoController.text.trim().substring(0, 1)))) {
                                    nomineeDetailsLogic.address2ErrorMsg.value = 'Please enter valid address';
                                  } else {
                                    nomineeDetailsLogic.address2ErrorMsg.value = '';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                maxLength: 200,
                                title: AppString.cityName,
                                controller: nomineeDetailsLogic.cityController,
                                hintText: AppString.enterCity,
                                inputType: TextInputType.text,
                                errorText: nomineeDetailsLogic.cityErrorMsg.value,
                                onChanged: (str) {
                                  if (nomineeDetailsLogic.cityController.text.trim().isEmpty ||
                                      nomineeDetailsLogic.cityController.text.trim().length < 2 ||
                                      nomineeDetailsLogic.cityController.text.substring(0, 1) == ' ' ||
                                      nomineeDetailsLogic.specialCharExpStartChar
                                          .hasMatch(nomineeDetailsLogic.cityController.text.trim().substring(0, 1))) {
                                    nomineeDetailsLogic.cityErrorMsg.value = 'Please enter valid city';
                                  } else {
                                    nomineeDetailsLogic.cityErrorMsg.value = '';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.district,
                                maxLength: 200,
                                controller: nomineeDetailsLogic.districtController,
                                hintText: AppString.enterDisctrict,
                                inputType: TextInputType.text,
                                errorText: nomineeDetailsLogic.districtErrorMsg.value,
                                onChanged: (str) {
                                  if (nomineeDetailsLogic.districtController.text.trim().isEmpty ||
                                      nomineeDetailsLogic.districtController.text.trim().length < 2 ||
                                      nomineeDetailsLogic.districtController.text.substring(0, 1) == ' ' ||
                                      nomineeDetailsLogic.specialCharExpStartChar.hasMatch(
                                          nomineeDetailsLogic.districtController.text.trim().substring(0, 1))) {
                                    nomineeDetailsLogic.districtErrorMsg.value = 'Please enter valid district';
                                  } else {
                                    nomineeDetailsLogic.districtErrorMsg.value = '';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              AppTextField(
                                isMandatory: true,
                                title: AppString.state,
                                maxLength: 200,
                                controller: nomineeDetailsLogic.stateController,
                                hintText: AppString.enterState,
                                errorText: nomineeDetailsLogic.stateErrorMsg.value,
                                onChanged: (str) {
                                  if (nomineeDetailsLogic.stateController.text.trim().isEmpty ||
                                      nomineeDetailsLogic.stateController.text.trim().length < 2 ||
                                      nomineeDetailsLogic.stateController.text.substring(0, 1) == ' ' ||
                                      nomineeDetailsLogic.specialCharExpStartChar
                                          .hasMatch(nomineeDetailsLogic.stateController.text.trim().substring(0, 1))) {
                                    nomineeDetailsLogic.stateErrorMsg.value = 'Please enter valid state';
                                  } else {
                                    nomineeDetailsLogic.stateErrorMsg.value = '';
                                  }
                                },
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
                                onChanged: (str) {
                                  final validCharacters = RegExp(r'^[0-9]+$');
                                  if (nomineeDetailsLogic.pinCodeController.text.trim().isEmpty) {
                                    nomineeDetailsLogic.pinCodeErrorMsg.value = 'Please enter pincode';
                                  } else if (!validCharacters.hasMatch(nomineeDetailsLogic.pinCodeController.text) ||
                                      nomineeDetailsLogic.pinCodeController.text.trim().length != 6) {
                                    nomineeDetailsLogic.pinCodeErrorMsg.value = 'Please enter valid pincode';
                                  } else {
                                    nomineeDetailsLogic.pinCodeErrorMsg.value = '';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            if (!nomineeDetailsLogic.isLoading.value) AppLoader()
          ],
        );
      }),
    );
  }
}

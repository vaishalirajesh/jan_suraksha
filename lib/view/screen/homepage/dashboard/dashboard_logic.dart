import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/model/request_model/EmailOtpRequest.dart';
import 'package:jan_suraksha/model/request_model/GetEnrollmnetListrequest.dart';
import 'package:jan_suraksha/model/request_model/GetSchemaByUserIdRequest.dart';
import 'package:jan_suraksha/model/request_model/VerifyEmailOtpRequest.dart';
import 'package:jan_suraksha/model/response_model/GetEnrollmentListResponse.dart';
import 'package:jan_suraksha/model/response_model/GetSchemaByUserIdResponse.dart';
import 'package:jan_suraksha/model/response_model/OTPResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/mock/mock_service.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/utils/showcustomesnackbar.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_button.dart';
import 'package:jan_suraksha/view/widget/app_textfield.dart';
import 'package:jan_suraksha/view/widget/otp_bottom_sheet_auth.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class DashboardLogic extends GetxController {
  var index = 0.obs;
  RxBool isLoading = true.obs;
  var isExpandedScheme = true.obs;
  var isExpandedNominee = true.obs;
  var schemeDetail;
  List<dynamic> schemeList = [];
  TextEditingController emailController = TextEditingController(text: '');
  RxString emailErrorMsg = ''.obs;
  RxString otp = ''.obs;
  RxBool isEmailVerifying = false.obs;
  RxBool isOTPVerifing = false.obs;
  TextEditingController dateController = TextEditingController();
  RxString dateErrorMsg = ''.obs;
  List<RxBool> isOptOut = [];
  RxString userName = ''.obs;

  setIndex(int value) {
    index.value = value;
  }

  Future<bool> onWillPop() async {
    index.value = 0;
    return false;
  }

  @override
  Future<void> onInit() async {
    userName.value = await TGSharedPreferences.getInstance().get(PREF_USER_NAME) ?? '';
    getSchemaDeatil();
    super.onInit();
  }

  void changeSchemaData() {
    if (isExpandedScheme.value) {
      isExpandedNominee.value = true;
    }
    isExpandedScheme.value = !isExpandedScheme.value;
  }

  void changeNomineeData() {
    if (isExpandedNominee.value) {
      isExpandedScheme.value = true;
    }
    isExpandedNominee.value = !isExpandedNominee.value;
  }

  Future<void> getSchemaDeatil() async {
    if (await NetUtils.isInternetAvailable()) {
      getDetail();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getDetail);
      }
    }
  }

  Future<void> getDetail() async {
    var encUserId = AesGcmEncryptionUtils.encryptNew('1');
    GetSchemaByUserIdRequest getSchemaByUserIdRequest =
        GetSchemaByUserIdRequest(id: TGMockService.applyMock ? '1' : encUserId);
    TGLog.d("GetSchemaByUserIdRequest Decrypt:--------$getSchemaByUserIdRequest");
    ServiceManager.getInstance().getSchemaByUserId(
      request: getSchemaByUserIdRequest,
      onSuccess: (response) => _onSuccessGetSchemaByUserId(response),
      onError: (error) => _onErrorGetSchemaByUserId(error),
    );
  }

  _onSuccessGetSchemaByUserId(GetSchemaByUserIdResponse response) async {
    TGLog.d("GetSchemaByUserIdRequest : onSuccess()---$response");
    if (response.getSchemaByUserId().status == RES_SUCCESS) {
      TGLog.d("Scheme Value-------${response.getSchemaByUserId().data}");
      if (response.getSchemaByUserId().data != null) {
        schemeDetail = json.decode(response.getSchemaByUserId().data ?? '');
      }
      // isLoading.value = false;
      getSchemasList();
    } else {
      TGLog.d("Error in GetSchemaByUserIdRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getSchemaByUserId().status ?? 0, response.getSchemaByUserId().message ?? "", null);
    }
  }

  _onErrorGetSchemaByUserId(TGResponse errorResponse) {
    TGLog.d("GetSchemaByUserIdRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> getSchemasList() async {
    if (await NetUtils.isInternetAvailable()) {
      getSchemeList();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getSchemeList);
      }
    }
  }

  Future<void> getSchemeList() async {
    GetEnrollmnetListrequest getEnrollmentListRequest =
        GetEnrollmnetListrequest(type: 1, paginationFROM: 0, paginationTO: 10);
    var jsonRequest = jsonEncode(getEnrollmentListRequest.toJson());
    TGLog.d("GetEnrollmentListRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_ENROLLMENT_LIST);
    TGLog.d("GetEnrollmentListRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().getEnrollmentList(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessGetEnrollmentList(response),
      onError: (error) => _onErrorGetEnrollmentList(error),
    );
  }

  _onSuccessGetEnrollmentList(GetEnrollmentListResponse response) async {
    TGLog.d("GetEnrollmentListRequest : onSuccess()---$response");
    if (response.getEnrollmentList().status == RES_SUCCESS) {
      if (response.getEnrollmentList().data != null) {
        schemeList = json.decode(response.getEnrollmentList().data ?? '');
        schemeList.forEach((element) {
          isOptOut.add(false.obs);
        });
      }
      TGLog.d("Schema lenght--${schemeList.length}");
      bool isFromReg = await TGSharedPreferences.getInstance().get(PREF_IS_FROM_REG) ?? false;
      if (isFromReg) {
        openBottomSheet();
        TGSharedPreferences.getInstance().set(PREF_IS_FROM_REG, false);
      }
      isLoading.value = false;
    } else {
      TGLog.d("Error in updateVerificationType");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.getEnrollmentList().status ?? 0, response.getEnrollmentList().message ?? "", null);
    }
  }

  _onErrorGetEnrollmentList(TGResponse errorResponse) {
    TGLog.d("GetEnrollmentListRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  void onUpdate() {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (emailController.text.isEmpty || !(regex.hasMatch(emailController.text))) {
      emailErrorMsg.value = 'Please enter valid email';
    } else {
      emailErrorMsg.value = '';
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      onUpdateEmail();
    }
  }

  void openBottomSheet() {
    Get.bottomSheet(LayoutBuilder(builder: (context, _) {
      return Obx(() {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
            color: ColorConfig.jsCardBgColor,
          ),
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Update Email ID',
                style: StyleConfig.semiBoldText16.copyWith(color: ColorConfig.jsLightBlackColor),
              ),
              SizedBox(
                height: 30.h,
              ),
              AppTextField(
                isMandatory: true,
                title: AppString.emailAddress,
                controller: emailController,
                hintText: AppString.emailAddress,
                inputType: TextInputType.emailAddress,
                errorText: emailErrorMsg.value,
                onChanged: (str) {
                  emailErrorMsg.value = '';
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              AppButton(
                onPress: onUpdate,
                title: "Update",
                isButtonEnable: true.obs,
                isDataLoading: isEmailVerifying,
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Text(
                    'Not Now',
                    style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
                  ),
                ),
              )
            ],
          ),
        );
      });
    }), isDismissible: true, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  Future<void> onUpdateEmail() async {
    if (await NetUtils.isInternetAvailable()) {
      updateEmail();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, updateEmail);
      }
    }
  }

  Future<void> updateEmail() async {
    isEmailVerifying.value = true;
    EmailOtpRequest emailOtpRequest = EmailOtpRequest(userId: 9492, email: emailController.text);
    var jsonRequest = jsonEncode(emailOtpRequest.toJson());
    TGLog.d("EmailOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_EMAIL_OTP);
    TGLog.d("EmailOtpRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().otpRequest(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessEmailOtp(response),
      onError: (error) => _onErrorEmailOTP(error),
    );
  }

  _onSuccessEmailOtp(OTPResponse response) async {
    TGLog.d("EmailOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      TGLog.d("Schema lenght--${schemeList.length}");
      Get.back();
      isEmailVerifying.value = false;
      OTPBottomSheetAuth.getBottomSheet(
        context: Get.context!,
        isEdit: true.obs,
        onChangeOTP: (s) {
          otp.value = s;
          TGLog.d("Otp---------${otp.value}");
        },
        onSubmitOTP: (s) {
          otp.value = s;
        },
        onEdit: () {
          Get.back();
          openBottomSheet();
        },
        title: 'Email Verification',
        mobileNumber: emailController.text ?? '',
        isEnable: (otp.value.length == 6 ? true : false).obs,
        isLoading: isOTPVerifing,
        onButtonPress: verifyOtp,
        subTitle: 'A Verification code is sent on your email id'.obs,
      );
    } else {
      TGLog.d("Error in EmailOtpRequest");
      isEmailVerifying.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  _onErrorEmailOTP(TGResponse errorResponse) {
    TGLog.d("EmailOtpRequest : onError()--${errorResponse.error}");
    isEmailVerifying.value = false;
    isOTPVerifing.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> verifyOtp() async {
    if (await NetUtils.isInternetAvailable()) {
      onVerifyOTP();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, onVerifyOTP);
      }
    }
  }

  Future<void> onVerifyOTP() async {
    isOTPVerifing.value = true;
    VerifyEmailOtpRequest verifyEmailOtpRequest =
        VerifyEmailOtpRequest(email: emailController.text, otpType: 2, userId: 9492, otp: '123456');
    var jsonRequest = jsonEncode(verifyEmailOtpRequest.toJson());
    TGLog.d("verifyEmailOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_VERIFY_OTP);
    ServiceManager.getInstance().otpRequest(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessVerifyOTP(response),
        onError: (error) => _onErrorEmailOTP(error));
  }

  _onSuccessVerifyOTP(OTPResponse response) async {
    TGLog.d("verifyEmailOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      Get.back();
      showSnackBar(Get.context!, 'Email updated successfully');
      isOTPVerifing.value = false;
    } else {
      TGLog.d("Error in verifyEmailOtpRequest");
      isOTPVerifing.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  void openOPTOutBottomSheet({required int index}) {
    Get.bottomSheet(LayoutBuilder(builder: (context, _) {
      return Obx(() {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
            color: ColorConfig.jsCardBgColor,
          ),
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Effective Date',
                style: StyleConfig.semiBoldText16.copyWith(color: ColorConfig.jsLightBlackColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Are you sure you want to Opt-out of the PMJJBY Scheme? Doing so, will lead to withdrawal of benefit from effective date.",
                style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsOptOutTextGreyColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              AppTextField(
                isMandatory: true,
                title: 'Effective Date',
                controller: dateController,
                hintText: 'Enter Date',
                isDobField: true,
                isReadOnly: true,
                onTap: selectDate,
                errorText: dateErrorMsg.value,
              ),
              SizedBox(
                height: 30.h,
              ),
              AppButton(
                onPress: () {
                  openDialog(index: index);
                },
                title: "Continue",
                isButtonEnable: true.obs,
                isDataLoading: isLoading,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        );
      });
    }), isDismissible: true, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  DateTime date = DateTime.now();

  Future selectDate() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    DateTime currentDate = DateTime.now();
    int firstDateYear = currentDate.year - 18;
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024, 5, 31),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: ColorConfig.jsPrimaryColor,
              onPrimary: ColorConfig.jsWhiteColor,
              surface: ColorConfig.jsPrimaryColor,
              onSurface: ColorConfig.jsBlackColor,
            ),
            dialogBackgroundColor: ColorConfig.jsWhiteColor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      date = picked;
      String month = getmonth(date.month);
      if (month.isNotEmpty && month.length > 4) {
        month = month.substring(0, 3);
      }
      var stringDate = '${date.day}/${date.month}/${date.year}';
      dateController.text = AppUtils.convertDateFormat(stringDate, 'dd/mm/yyyy', 'dd/mm/yyyy');
    }
  }

  String getmonth(int month) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  void openDialog({required int index}) {
    Get.back();
    Get.dialog(
      AlertDialog(
        title: Text(
          'Opt-out',
          textAlign: TextAlign.center,
          style: StyleConfig.semiBoldText18,
        ),
        backgroundColor: ColorConfig.jsCreamColor,
        content: Text(
          'Are you sure you want to Opt-out of the PMJJBY Scheme? \n\n Doing so , will lead to withdrawal of benefit from effective date.',
          style: StyleConfig.regularText16,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actionsPadding: EdgeInsets.only(bottom: 20.h),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 35.h,
              width: 120.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorConfig.jsCreamColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(18.r)),
                border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w),
              ),
              child: Text(
                'No',
                textAlign: TextAlign.center,
                style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsGreyColor),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.back();
              isOptOut[index].value = true;
            },
            child: Container(
              height: 35.h,
              width: 120.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorConfig.jsPrimaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(18.r)),
                border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w),
              ),
              child: Text(
                'Yes',
                textAlign: TextAlign.center,
                style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsWhiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}

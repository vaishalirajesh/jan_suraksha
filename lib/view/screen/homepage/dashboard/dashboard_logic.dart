import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as Format;
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/model/request_model/DownloadAgreementRequest.dart';
import 'package:jan_suraksha/model/request_model/EmailOtpRequest.dart';
import 'package:jan_suraksha/model/request_model/GetEnrollmnetListrequest.dart';
import 'package:jan_suraksha/model/request_model/GetNomineeRequest.dart';
import 'package:jan_suraksha/model/request_model/GetOptOutListRequest.dart';
import 'package:jan_suraksha/model/request_model/GetSchemaByUserIdRequest.dart';
import 'package:jan_suraksha/model/request_model/GetUserIdRequest.dart';
import 'package:jan_suraksha/model/request_model/SaveOptoutRequest.dart';
import 'package:jan_suraksha/model/request_model/VerifyEmailOtpRequest.dart';
import 'package:jan_suraksha/model/response_main_model/SetPasswordResponseMain.dart';
import 'package:jan_suraksha/model/response_model/DownloadAgreementResponse.dart';
import 'package:jan_suraksha/model/response_model/GetEnrollmentListResponse.dart';
import 'package:jan_suraksha/model/response_model/GetSchemaByUserIdResponse.dart';
import 'package:jan_suraksha/model/response_model/OTPResponse.dart';
import 'package:jan_suraksha/model/response_model/OptOutHistoryResponse.dart';
import 'package:jan_suraksha/model/response_model/fetch_profile_details_response_main.dart';
import 'package:jan_suraksha/services/common/app_functions.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/request/tg_get_request.dart';
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
import 'package:jan_suraksha/view/widget/jumpingdot_util.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';
import 'package:jan_suraksha/view/widget/timer/timer_count_down.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../model/request_model/SetPasswordRequest.dart';
import '../../../../model/response_model/SkipEmailResponse.dart';
import '../../../widget/custom_otp_field/custom_otp_field.dart';
import '../../auth/login/login_binding.dart';
import '../../auth/login/login_view.dart';

class DashboardLogic extends GetxController {
  var index = 0.obs;
  RxBool isLoading = true.obs;
  RxBool isOptOutLoading = false.obs;
  RxBool isNomineeLoading = false.obs;
  RxBool isLogoutAPICalling = false.obs;
  RxBool isDownLoading = false.obs;
  var isExpandedScheme = true.obs;
  var isExpandedNominee = true.obs;
  var schemeDetail;
  List<dynamic> schemeList = [];
  List<dynamic> optOutNomineeList = [];
  List<dynamic> nomineeList = [];
  List<dynamic> OptOutHistoryNomineeList = [];
  var selectedSchemaData = {};
  TextEditingController emailController = TextEditingController(text: '');
  RxString emailErrorMsg = ''.obs;
  RxString otpErrorMsg = ''.obs;
  RxString otp = ''.obs;
  RxBool isEmailVerifying = false.obs;
  RxBool isOTPVerifing = false.obs;
  TextEditingController dateController = TextEditingController();
  RxString dateErrorMsg = ''.obs;
  List<RxBool> isOptOut = [];
  RxString userName = ''.obs;
  RxString mobilenumber = ''.obs;
  var passwordController = TextEditingController(text: '');
  var repeatPasswordController = TextEditingController(text: "");
  int optOutIndex = -1;
  RxBool isShowPassword = true.obs;
  RxBool isShowConfirmPassword = true.obs;
  RxBool isEnableEmailOtpResend = false.obs;

  setIndex(int value) {
    index.value = value;
  }

  Future<bool> onWillPop() async {
    index.value = 0;
    return false;
  }

  @override
  Future<void> onInit() async {
    bool isfromreg = await TGSharedPreferences.getInstance().get(PREF_IS_FROM_REG) ?? false;
    mobilenumber.value = await TGSharedPreferences.getInstance().get(PREF_MOBILE) ?? '';
    TGLog.d("On dashbaord------$isfromreg");
    if (isfromreg) {
      String userId = (await TGSharedPreferences.getInstance().get(PREF_USER_ID)).toString();
      GetUserIDRequest request = GetUserIDRequest(userId: userId);
      var jsonRequest = jsonEncode(request);
      TGLog.d("DashboardLogic skip response $jsonRequest");
      TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SKIP_EMAIL);
      ServiceManager.getInstance().skipEmailDetails(
          request: tgPostRequest,
          onSuccess: (response) => _onsuccsessSkipEmailResponse(response),
          onError: (response) => _onErrorSkipEmailResponse(response));
    } else {
      String ref_token = await (TGSharedPreferences.getInstance().get(PREF_REFRESHTOKEN)) ?? "";
      String log_token = await (TGSharedPreferences.getInstance().get(PREF_LOGIN_TOKEN)) ?? "";
      TGLog.d("ref_token Token---$ref_token");
      TGLog.d("log_token Token---$log_token");
      if (ref_token.isEmpty || log_token.isEmpty) {
        showSnackBar(Get.context!, "Your session has expired");
        Get.offAll(() => LoginPage(), binding: LoginBinding());
      } else {
        setAccessTokenInRequestHeader();
        getSchemaDeatil();
        getOptOutList();
        onGetNomineeList();
      }
    }
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
    GetSchemaByUserIdRequest getSchemaByUserIdRequest = GetSchemaByUserIdRequest(id: encUserId);
    TGLog.d("GetSchemaByUserIdRequest Decrypt:--------${getSchemaByUserIdRequest.toString()}");
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
    TGLog.d("GetSchemaByUserIdRequest : onError()--${errorResponse.body}");
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
    GetEnrollmnetListrequest getEnrollmentListRequest = GetEnrollmnetListrequest(paginationFROM: 0, paginationTO: 10);
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
        List<dynamic> scheme = json.decode(response.getEnrollmentList().data ?? '');
        for (var element in scheme) {
          if (element['stageId'] == 6 || element['stageId'] == 4) {
            schemeList.add(element);
          }
        }
      }
      TGLog.d("Schema lenght--${schemeList.length}");
      bool isFromReg = (await TGSharedPreferences.getInstance().get(PREF_IS_FROM_REG)) ?? false;
      print(isFromReg.toString());
      if (isFromReg) {
        updateEmailOtpBottomSheet();
        TGSharedPreferences.getInstance().set(PREF_IS_FROM_REG, false);
      }
      fetchProfileData();
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
      updateEmail(true);
    }
  }

  void updateEmailOtpBottomSheet() {
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
                height: 20.h,
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
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  Future<void> updateEmail(bool isFromBottomSheet) async {
    isEmailVerifying.value = true;
    var userID = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
    await TGSharedPreferences.getInstance().get(PREF_REFRESHTOKEN);
    await TGSharedPreferences.getInstance().remove(PREF_ACCESS_TOKEN);
    await TGSharedPreferences.getInstance().remove(PREF_LOGIN_TOKEN);
    EmailOtpRequest emailOtpRequest =
        EmailOtpRequest(userId: userID, email: emailController.text, otpType: 2, notificationMasterId: 16);
    var jsonRequest = jsonEncode(emailOtpRequest.toJson());
    TGLog.d("EmailOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_EMAIL_OTP);
    TGLog.d("EmailOtpRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().otpRequest(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessEmailOtp(response, isFromBottomSheet),
      onError: (error) => _onErrorEmailOTP(error),
    );
  }

  _onSuccessEmailOtp(OTPResponse response, bool isBack) async {
    TGLog.d("EmailOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      TGLog.d("Schema lenght--${schemeList.length}");
      if (isBack) {
        Get.back();
      }
      otpErrorMsg.value = '';
      isEmailVerifying.value = false;
      isEnableEmailOtpResend.value = false;
      otp.value = '';
      openEmailOtpBottomSheet(
        context: Get.context!,
        isEdit: true.obs,
        onChangeOTP: (s) {
          if (s.isEmpty) {
            otp.value = otp.value.substring(0, otp.value.length - 1);
            otpErrorMsg.value = '';
          } else {
            otp.value = otp.value + s;
            otpErrorMsg.value = '';
          }
          TGLog.d("Otp---------${otp.value}");
        },
        onSubmitOTP: (s) {
          otp.value = otp.value + s;
        },
        onEdit: () {
          Get.back();
          updateEmailOtpBottomSheet();
        },
        onResend: onResendEmailOtpTimer,
        onFinish: onFinishEmailOtpTimer,
        errorText: otpErrorMsg,
        title: 'Email Verification',
        mobileNumber: emailController.text ?? '',
        isEnable: isEnableEmailOtpResend,
        isLoading: isOTPVerifing,
        onButtonPress: () async {
          await verifyOtp();
        },
        subTitle: 'A Verification code is sent on your email id'.obs,
      );
    } else {
      TGLog.d("Error in EmailOtpRequest");
      Get.back();
      isEmailVerifying.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  Future<void> onFinishEmailOtpTimer() async {
    isEnableEmailOtpResend.value = true;
  }

  Future<void> onResendEmailOtpTimer() async {
    Get.back();
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    isEnableEmailOtpResend.value = false;
    updateEmail(false);
  }

  _onErrorEmailOTP(TGResponse errorResponse) {
    TGLog.d("EmailOtpRequest : onError()--${errorResponse.error}");
    isEmailVerifying.value = false;
    isOTPVerifing.value = false;
    otpErrorMsg.value = errorResponse.error ?? "";
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
    var userID = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
    VerifyEmailOtpRequest verifyEmailOtpRequest =
        VerifyEmailOtpRequest(email: emailController.text, otpType: 2, userId: userID, otp: otp.value);
    var jsonRequest = jsonEncode(verifyEmailOtpRequest.toJson());
    TGLog.d("verifyEmailOtpRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SIGN_UP_VERIFY_OTP);
    ServiceManager.getInstance().otpRequest(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessVerifyOTP(response),
        onError: (error) => _onErrorEmailOTP(error));
  }

  var setPassError = "".obs;

  var resetPassError = "".obs;
  RxBool isSetPasswordLoading = false.obs;

  _onSuccessVerifyOTP(OTPResponse response) async {
    TGLog.d("verifyEmailOtpRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      TGSharedPreferences.getInstance().set(PREF_EMAIL, emailController.text);
      Get.back();
      getUpdatePasswordBottomSheet(
        onSubmitOTP: (String) {
          Get.back();
        },
        onButtonPress: () async {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
          if (passwordController.text.isEmpty) {
            setPassError.value = "Please enter password";
            resetPassError.value = '';
          } else if (passwordController.text.length < 8) {
            resetPassError.value = "";
            setPassError.value = 'Invalid password pattern';
          } else if (!validateStructure(passwordController.text)) {
            resetPassError.value = "";
            setPassError.value = 'Invalid password pattern';
          } else if (repeatPasswordController.text.trim().isEmpty ||
              passwordController.text != repeatPasswordController.text) {
            resetPassError.value = "Password not match with confirm password";
            setPassError.value = '';
          } else if (repeatPasswordController.text.length < 8) {
            resetPassError.value = "Invalid password pattern";
            setPassError.value = '';
          } else if (!validateStructure(repeatPasswordController.text)) {
            resetPassError.value = "Invalid password pattern";
            setPassError.value = '';
          } else {
            setPassError.value = '';
            resetPassError.value = '';
            isSetPasswordLoading.value = true;
            var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
            SetPasswordRequest verifySignupOtpRequest = SetPasswordRequest(
                password: passwordController.text, confirmPassword: repeatPasswordController.text, userId: userId);
            var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
            TGLog.d("SignUpOtpRequest $jsonRequest");
            TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SET_PASSWORD);
            ServiceManager.getInstance().setPassword(
                request: tgPostRequest,
                onSuccess: (respose) => _onsuccsessSetPassword(respose),
                onError: (response) => _onErrorSetPassword(response));
          }
        },
        title: 'Update Password',
        isEnable: true.obs,
        isLoading: false.obs,
      );

      isOTPVerifing.value = false;
    } else {
      TGLog.d("Error in verifyEmailOtpRequest");
      otpErrorMsg.value = response.getOtpResponse().message ?? "";
      isOTPVerifing.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOtpResponse().status ?? 0, response.getOtpResponse().message ?? "", null);
    }
  }

  void onPressContinue(int index, int schemeId) {
    if (dateController.text.isEmpty) {
      dateErrorMsg.value = 'Please select date';
    } else {
      dateErrorMsg.value = '';
      openDialog(index: index, schemeId: schemeId);
    }
  }

  void openOPTOutBottomSheet({required int index, required int schemeId}) {
    dateErrorMsg.value = '';
    dateController.text = '';

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
                onChanged: (str) {
                  dateErrorMsg.value = '';
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              AppButton(
                onPress: () {
                  onPressContinue(index, schemeId);
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
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  DateTime date = DateTime.now();

  Future selectDate() async {
    dateErrorMsg.value = '';
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

  void openDialog({required int index, required int schemeId}) {
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
          'Are you sure you want to Opt-out of the ${AppUtils.getSchemeName(schemeId)} Scheme? \n\n Doing so , will lead to withdrawal of benefit from effective date.',
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
              onSaveDetail();
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

  _onsuccsessSkipEmailResponse(GetResponseForSkipEmailMain response) async {
    if (response.skippedresponse().status == RES_SUCCESS) {
      AppUtils.setAccessToken(response.skippedresponse().data?.accessToken ?? "");
      TGSharedPreferences.getInstance().set(PREF_REFRESHTOKEN, response.skippedresponse().data?.refreshToken ?? "");
      TGSharedPreferences.getInstance()
          .set(PREF_LOGIN_TOKEN, response.skippedresponse().data?.loginToken.toString() ?? '');
      TGSharedPreferences.getInstance().set(PREF_ACCESS_TOKEN, response.skippedresponse().data?.accessToken ?? "");
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded = stringToBase64.encode(response.skippedresponse().data?.userName ?? '');
      TGSharedPreferences.getInstance().set(PREF_LOGIN_USERNAME, encoded);
      TGSharedPreferences.getInstance().set(PREF_LOGIN_RES, json.encode(response.skippedresponse().data));
      TGSharedPreferences.getInstance().set(PREF_ORG_ID, response.skippedresponse().data?.userOrgId ?? "");
      TGSharedPreferences.getInstance().set(PREF_USER_ID, response.skippedresponse().data?.userId ?? "");
      setAccessTokenInRequestHeader();
      getSchemaDeatil();
      getOptOutList();
      onGetNomineeList();
    } else {
      LoaderUtils.handleErrorResponse(
          Get.context!, response.skippedresponse().status ?? 0, response.skippedresponse().message ?? "", null);
    }
  }

  _onErrorSkipEmailResponse(TGResponse response) {
    showSnackBar(Get.context!, "Error Occured with code${response.httpStatus}");
  }

  openEmailOtpBottomSheet({
    required Function(String) onChangeOTP,
    required Function(String) onSubmitOTP,
    Function()? onEdit,
    required Function() onButtonPress,
    required String mobileNumber,
    required String title,
    required RxString subTitle,
    RxString? errorText,
    bool isForBank = false,
    required BuildContext context,
    required RxBool isEnable,
    required RxBool isLoading,
    Function()? onFinish,
    Function()? onResend,
    required RxBool isEdit,
  }) {
    Format.NumberFormat formatter = Format.NumberFormat("00");

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
                title.isNotEmpty ? title : AppString.enterOTP,
                style: StyleConfig.semiBoldText16.copyWith(color: ColorConfig.jsLightBlackColor),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '${subTitle.value.isNotEmpty ? subTitle.value : AppString.registerMobileNumber}${AppUtils.getMaskedMobileNumber(mobileNumber: mobileNumber)}${isForBank ? AppString.byTheBank : AppString.emptyText}',
                style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextMediumGreyColor),
                textAlign: TextAlign.center,
              ),
              // if (isEdit.value)
              //   SizedBox(
              //     height: 5.h,
              //   ),
              if (isEdit.value)
                InkWell(
                  onTap: onEdit,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.h, right: 5.h, top: 5.h),
                    child: Text(
                      'Edit Email id',
                      style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsPrimaryColor),
                    ),
                  ),
                ),
              SizedBox(
                height: 10.h,
              ),
              OtpTextField(
                numberOfFields: 6,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                borderColor: ColorConfig.jsLightGreyColor,
                borderRadius: BorderRadius.circular(16.r),
                borderWidth: 1,
                textStyle: StyleConfig.semiBoldText20,
                enabledBorderColor: ColorConfig.jsLightGreyColor,
                focusedBorderColor: ColorConfig.jsLightGreyColor,
                cursorColor: ColorConfig.jsLightBlackColor,
                fieldWidth: 40.r,
                fieldHeight: 40.r,
                showFieldAsBox: true,
                onCodeChanged: onChangeOTP,
                onSubmit: (str) {
                  onButtonPress();
                },
              ),
              if (errorText != null && errorText.value.isNotEmpty)
                SizedBox(
                  height: 5.h,
                ),
              if (errorText != null && errorText.value.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      errorText.value ?? '',
                      style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsRedColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Didn't Receive Verification Code Yet?",
                style: StyleConfig.regularText16.copyWith(color: ColorConfig.jsTextDarkGreyColor),
              ),
              isEnable.value
                  ? InkWell(
                      onTap: onResend,
                      child: Text(
                        "Resend Verification Code",
                        style: StyleConfig.regularText16.copyWith(
                          color: ColorConfig.jsPrimaryColor,
                        ),
                      ),
                    )
                  : Countdown(
                      seconds: 120,
                      build: (BuildContext context, double time) => Text(
                        time > 60
                            ? "Resend Verification Code in 01:${formatter.format(time.round() - 60)} minutes"
                            : "Resend Verification Code in 00:${formatter.format(time.round())} minutes",
                        style: StyleConfig.regularText16.copyWith(
                          color: ColorConfig.jsTextDarkGreyColor,
                        ),
                      ),
                      interval: const Duration(seconds: 1),
                      onFinished: onFinish,
                    ),
              SizedBox(
                height: 15.h,
              ),
              if (isLoading.value)
                Obx(() {
                  return isLoading.value
                      ? JumpingDots(
                          color: ColorConfig.jsPrimaryColor,
                          radius: 7,
                        )
                      : const SizedBox();
                }),
              if (isLoading.value)
                SizedBox(
                  height: 15.h,
                ),
              // AppButton(
              //   onPress: onButtonPress,
              //   title: AppString.continueText,
              //   isButtonEnable: isEnable,
              //   isDataLoading: isLoading,
              // )
            ],
          ),
        );
      });
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  // getBottomSheet(
  // onSubmitOTP: (String) {},
  // onButtonPress: () async {
  // var userId = await TGSharedPreferences.getInstance().get(PREF_USER_ID);
  // SetPasswordRequest verifySignupOtpRequest = SetPasswordRequest(password: passwordController.text, confirmPassword: repeatPasswordController.text, userId: userId);
  // var jsonRequest = jsonEncode(verifySignupOtpRequest.toJson());
  // TGLog.d("SignUpOtpRequest $jsonRequest");
  // TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SET_PASSWORD);
  // ServiceManager.getInstance().setPassword(request: tgPostRequest,onSuccess: (respose)=>_onsuccsessSetPassword(respose),onError: (response)=>_onErrorSetPassword(response));
  // },
  // title: 'Update Password',
  // isEnable: true.obs,
  // isLoading: false.obs,
  // );
  //
  //

  void onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }

  getUpdatePasswordBottomSheet({
    required Function(String) onSubmitOTP,
    required Function() onButtonPress,
    required String title,
    RxString? errorText,
    required RxBool isEnable,
    required RxBool isLoading,
  }) {
    Get.bottomSheet(LayoutBuilder(builder: (context, _) {
      final key = GlobalKey<State<Tooltip>>();
      return Obx(() {
        return isEnable.value
            ? Container(
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
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Text(
                              title.isNotEmpty ? title : AppString.enterOTP,
                              style: StyleConfig.semiBoldText16.copyWith(color: ColorConfig.jsLightBlackColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Tooltip(
                          key: key,
                          showDuration: const Duration(seconds: 1),
                          waitDuration: const Duration(seconds: 2),
                          message:
                              "Password must contain at least one number, one uppercase, lowercase and special character, and at least 8 or more characters",
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.all(10.r),
                          margin: EdgeInsets.all(10.r),
                          decoration: ShapeDecoration(
                            color: ColorConfig.jsDarkCreamColor,
                            shape: const ToolTipCustomShape(),
                          ),
                          textStyle: StyleConfig.regularExtraSmallText,
                          child: GestureDetector(
                            onTap: () {
                              onTap(key);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.h, right: 5.h, top: 2.h),
                              child: Icon(
                                Icons.info_outline_rounded,
                                size: 20.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(() {
                      return AppTextField(
                        isMandatory: true,
                        title: AppString.password,
                        controller: passwordController,
                        hintText: AppString.password,
                        inputType: TextInputType.text,
                        errorText: setPassError.value,
                        isObscureText: isShowPassword.value,
                        onChanged: (str) {
                          setPassError.value = '';
                        },
                        suffix: IconButton(
                          icon: isShowPassword.value
                              ? Icon(
                                  Icons.visibility_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                )
                              : Icon(
                                  Icons.visibility_off_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                ),
                          onPressed: () {
                            isShowPassword.value = !isShowPassword.value;
                          },
                        ),
                      );
                    }),
                    SizedBox(height: 20),
                    Obx(() {
                      return AppTextField(
                        isMandatory: true,
                        title: AppString.reenterPassword,
                        controller: repeatPasswordController,
                        hintText: AppString.reenterPassword,
                        inputType: TextInputType.text,
                        errorText: resetPassError.value,
                        onChanged: (str) {
                          resetPassError.value = '';
                        },
                        isObscureText: isShowConfirmPassword.value,
                        suffix: IconButton(
                          icon: isShowConfirmPassword.value
                              ? Icon(
                                  Icons.visibility_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                )
                              : Icon(
                                  Icons.visibility_off_sharp,
                                  color: ColorConfig.jsTextMediumGreyColor,
                                ),
                          onPressed: () {
                            isShowConfirmPassword.value = !isShowConfirmPassword.value;
                          },
                        ),
                      );
                    }),
                    if (errorText != null && errorText.value.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            errorText.value ?? '',
                            style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsRedColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppButton(
                      onPress: onButtonPress,
                      title: AppString.continueText,
                      isButtonEnable: true.obs,
                      isDataLoading: false.obs,
                    )
                  ],
                ),
              )
            : Container();
      });
    }), isDismissible: false, elevation: 0, isScrollControlled: true, ignoreSafeArea: true, enableDrag: true);
  }

  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  _onsuccsessSetPassword(SetPasswordResponseMain respose) {
    Get.back();
    Get.back();
    showSnackBar(Get.context!, "Password Updated Successfully");
  }

  _onErrorSetPassword(response) {}

  Future<void> onSaveDetail() async {
    if (await NetUtils.isInternetAvailable()) {
      saveDetail();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, saveDetail);
      }
    }
  }

  Future<void> saveDetail() async {
    isOptOutLoading.value = true;
    DateTime datetime = DateTime.now();
    SaveOptoutRequest optOutRequest = SaveOptoutRequest(
      name: selectedSchemaData['name'] ?? '',
      applicationId: selectedSchemaData['id'] ?? '',
      accountNumber: selectedSchemaData['accountNumber'] ?? '',
      dateOfEffective: AppUtils.convertDateFormat('$date', 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-ddThh:mm:ss.000Z'),
      dateOfRequest: AppUtils.convertDateFormat('$datetime', 'yyyy-MM-dd HH:mm:ss', 'yyyy-MM-ddThh:mm:ss.000Z'),
      policyEffectiveDate: selectedSchemaData['enrollDate'] ?? '',
      schemeName: selectedSchemaData['schemeName'] ?? '',
      urn: selectedSchemaData['urn'] ?? '',
    );
    var jsonRequest = jsonEncode(optOutRequest.toJson());
    TGLog.d("SaveOptoutRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SAVE_OPT_OUT);
    TGLog.d("SaveOptoutRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().optOut(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessSaveData(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessSaveData(OTPResponse response) async {
    TGLog.d("SaveOptoutRequest : onSuccess()---$response");
    if (response.getOtpResponse().status == RES_SUCCESS) {
      getOptOutList();

      // isOptOut[optOutIndex].value = true;
    } else {
      TGLog.d("Error in PremiumDeductionResponse");
      isOptOutLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.getOtpResponse().status ?? 0, response?.getOtpResponse()?.message ?? "", null);
    }
  }

  _onErrorSaveData(TGResponse errorResponse) {
    TGLog.d("SaveOptoutRequest : onError()--${errorResponse.error}");
    isOptOutLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> fetchProfileData() async {
    FetchProfile fetchProfile = FetchProfile();
    ServiceManager.getInstance().fetchBasicDetails(
        request: fetchProfile,
        onSuccess: (response) {
          FetchProfileInfoMain responseInfo = response;
          if (responseInfo.getprofileinfo().status == RES_SUCCESS) {
            TGSharedPreferences.getInstance().set(PREF_MOBILE, responseInfo.getprofileinfo().data?.mobile ?? "");
            TGSharedPreferences.getInstance().set(PREF_USERNAME, responseInfo.getprofileinfo().data?.userName ?? "");
            userName.value = responseInfo.getprofileinfo().data?.userName ?? "";
            TGSharedPreferences.getInstance().set(PREF_USER_EMAIL, responseInfo.getprofileinfo().data?.email ?? "");
          } else {}
        },
        onError: (response) {});
  }

  Future<void> onPressDownload({dynamic schemeId, dynamic appId, dynamic orgId}) async {
    isDownLoading.value = true;
    DownloadAgreementRequest request = DownloadAgreementRequest(
        applicationId: appId.toString(), schemeId: schemeId.toString(), orgId: orgId.toString(), isDownload: true);
    var jsonRequest = jsonEncode(request.toJson());
    TGLog.d("GenerateCoiRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_DOWNLOAD_AGREEMENT);
    ServiceManager.getInstance().downloadCoi(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccess(response),
        onError: (response) => _onFailure(response));
  }

  _onSuccess(GetCoiAgreementResponseMain response) async {
    TGLog.d(response);
    final byteString = base64Decode(response.getLoginResponseData().data ?? "");
    final int8List = Uint8List.fromList(byteString);
    var currentDate =
        AppUtils.convertDateFormat(DateTime.now().toString(), 'yyyy-MM-dd hh:mm:ss.SSSSSS', 'dd_MM_yyyy_hh_mm_ss');
    var date = currentDate.toString().replaceAll(' ', '_');
    saveFileToDownloads("JanSuraksha_COI_${date}.pdf", int8List);
  }

  _onFailure(response) {
    isDownLoading.value = false;
  }

  Future<void> saveFileToDownloads(String fileName, List<int> fileBytes) async {
    String? filePath = await getDownloadPath();
    File file = File(filePath! + "/" + fileName);
    await file.writeAsBytes(fileBytes);
    showSnackBar(Get.context!, "COI downloaded successfully");
    // Check if the file was saved successfully
    if (await file.exists()) {
    } else {}
    isDownLoading.value = false;
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) directory = await getExternalStorageDirectory();
      }
    } catch (err, stack) {}
    return directory?.path;
  }

  Future<void> getOptOutList() async {
    if (await NetUtils.isInternetAvailable()) {
      optOutList();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, optOutList);
      }
    }
  }

  Future<void> optOutList() async {
    isOptOutLoading.value = true;
    GetOptOutListRequest getOptOutListRequest = GetOptOutListRequest(paginationFROM: 0, paginationTO: 10, type: 1);
    var jsonRequest = jsonEncode(getOptOutListRequest.toJson());
    TGLog.d("GetOptOutListRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_ENROLLMENT_LIST);
    TGLog.d("GetOptOutListRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().getEnrollmentList(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessOptOutList(response),
      onError: (error) => _onErrorOptOutList(error),
    );
  }

  _onSuccessOptOutList(GetEnrollmentListResponse response) async {
    TGLog.d("GetOptOutListRequest : onSuccess()---$response");
    if (response.getEnrollmentList().status == RES_SUCCESS) {
      if (response.getEnrollmentList().data != null) {
        optOutNomineeList = json.decode(response.getEnrollmentList().data ?? '');
        optOutNomineeList.forEach((element) {
          isOptOut.add(false.obs);
        });
      }
      TGLog.d("optOutNomineeList lenght--${optOutNomineeList.length}");
      getOptOutHistoryList();
    } else {
      TGLog.d("Error in GetOptOutListRequest");
      isOptOutLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.getEnrollmentList().status ?? 0, response.getEnrollmentList().message ?? "", null);
    }
  }

  _onErrorOptOutList(TGResponse errorResponse) {
    TGLog.d("GetEnrollmentListRequest : onError()--${errorResponse.error}");
    isOptOutLoading.value = false;
    isNomineeLoading.value = false;

    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> getOptOutHistoryList() async {
    if (await NetUtils.isInternetAvailable()) {
      OptOutHistoryList();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, OptOutHistoryList);
      }
    }
  }

  Future<void> OptOutHistoryList() async {
    GetOptOutListRequest getOptOutHistoryListRequest =
        GetOptOutListRequest(paginationFROM: 0, paginationTO: 10, type: 1);
    var jsonRequest = jsonEncode(getOptOutHistoryListRequest.toJson());
    TGLog.d("GetOptOutHistoryListRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_OPT_OUT_HISTORY);
    TGLog.d("GetOptOutHistoryListRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().optOutHistory(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessOptOutHistoryList(response),
      onError: (error) => _onErrorOptOutHistoryList(error),
    );
  }

  _onSuccessOptOutHistoryList(OptOutHistoryResponse response) async {
    TGLog.d("GetOptOutHistoryListRequest : onSuccess()---$response");
    if (response.getOptOutHistory().status == RES_SUCCESS) {
      if (response.getOptOutHistory().data != null) {
        OptOutHistoryNomineeList = json.decode(response.getOptOutHistory().data ?? '');
        optOutNomineeList.addAll(OptOutHistoryNomineeList);
      }
      TGLog.d("OptOutHistoryNomineeList lenght--${OptOutHistoryNomineeList.length}---${optOutNomineeList.length}");
      isOptOutLoading.value = false;
    } else {
      TGLog.d("Error in GetOptOutHistoryListRequest");
      isOptOutLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOptOutHistory().status ?? 0, response.getOptOutHistory().message ?? "", null);
    }
  }

  _onErrorOptOutHistoryList(TGResponse errorResponse) {
    TGLog.d("GetEnrollmentListRequest : onError()--${errorResponse.error}");
    isOptOutLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> onGetNomineeList() async {
    if (await NetUtils.isInternetAvailable()) {
      getNomineeList();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getNomineeList);
      }
    }
  }

  Future<void> getNomineeList() async {
    isNomineeLoading.value = true;
    GetNomineeListRequest getOptOutListRequest =
        GetNomineeListRequest(paginationFROM: 0, paginationTO: 10, schemeId: null, type: 2);
    var jsonRequest = jsonEncode(getOptOutListRequest.toJson());
    TGLog.d("GetOptOutListRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_ENROLLMENT_LIST);
    TGLog.d("GetOptOutListRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().getEnrollmentList(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessNomineeList(response),
      onError: (error) => _onErrorOptOutList(error),
    );
  }

  _onSuccessNomineeList(GetEnrollmentListResponse response) async {
    TGLog.d("GetOptOutListRequest : onSuccess()---$response");
    if (response.getEnrollmentList().status == RES_SUCCESS) {
      if (response.getEnrollmentList().data != null) {
        nomineeList = json.decode(response.getEnrollmentList().data ?? '');
      }
      isNomineeLoading.value = false;
      TGLog.d("optOutNomineeList lenght--${nomineeList.length}");
    } else {
      TGLog.d("Error in GetOptOutListRequest");
      isNomineeLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.getEnrollmentList().status ?? 0, response.getEnrollmentList().message ?? "", null);
    }
  }
}

class FetchProfile extends TGGetRequest {
  FetchProfile();

  @override
  String getUri() {
    return URIS.URI_GET_PROFILE;
  }

  @override
  Map<String, dynamic> params() {
    return <String, dynamic>{};
  }
}

class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;

  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(5.r)))
      ..moveTo(rect.topCenter.dx + 140, rect.topCenter.dy)
      ..relativeLineTo(10, -10)
      ..relativeLineTo(10, 10)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ToolTipCustomShape scale(double t) => this;
}

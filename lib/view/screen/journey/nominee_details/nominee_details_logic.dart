import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jan_suraksha/model/request_model/SaveFormDeatilRequest.dart' as request;
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/model/response_model/GetApplicationFormDetailsResponse.dart';
import 'package:jan_suraksha/model/response_model/GetMasterListResponse.dart';
import 'package:jan_suraksha/model/response_model/SaveFormDetailResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/guardian_details/guradian_details_view.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/preview_application/preview_application_form_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

import '../../../../model/request_model/GetApplicationFormDetailsRequest.dart';
import '../../../../services/encryption/encdec/aesGcmEncryption.dart';

class NomineeDetailsLogic extends GetxController {
  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;
  RxBool isDataSaving = false.obs;
  GetApplicationFormDetailsResponseMain getAppData = GetApplicationFormDetailsResponseMain();
  Nominee nominee = Nominee();
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController middleNameController = TextEditingController(text: '');
  TextEditingController latsNameController = TextEditingController(text: '');
  TextEditingController mobileController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController pinCodeController = TextEditingController(text: '');
  TextEditingController stateController = TextEditingController(text: '');
  TextEditingController cityController = TextEditingController(text: '');
  TextEditingController districtController = TextEditingController(text: '');
  TextEditingController addressOneController = TextEditingController(text: '');
  TextEditingController addressTwoController = TextEditingController(text: '');
  TextEditingController dobController = TextEditingController(text: '');
  TextEditingController relationWithApplicantController = TextEditingController(text: '');
  String dob = '';
  int appId = 0;
  DateTime date = DateTime.now();
  RxString fNameErrorMsg = ''.obs;
  RxString mNameErrorMsg = ''.obs;
  RxString lNameErrorMsg = ''.obs;
  RxString dobErrorMsg = ''.obs;
  RxString addressErrorMsg = ''.obs;
  RxString address2ErrorMsg = ''.obs;
  RxString cityErrorMsg = ''.obs;
  RxString districtErrorMsg = ''.obs;
  RxString stateErrorMsg = ''.obs;
  RxString pinCodeErrorMsg = ''.obs;
  RxString relationErrorMsg = ''.obs;
  RxString mobileErrorMsg = ''.obs;
  RxString emailErrorMsg = ''.obs;
  RxString selectedValue = ''.obs;
  RxMap<String, String> items = {"": ""}.obs;
  RxString screenName = ''.obs;
  var nomineeRelationShip = "".obs;
  Rx<num> relationshipid = num.parse('0').obs;
  var guardianid = 0.obs;
  var guardianShipValue = "".obs;
  RegExp nameRegExp = RegExp(r'^[a-zA-Z .]+$');
  RegExp onlyCharRegExp = RegExp(r'^[a-zA-Z]+$');
  RegExp cityRegExp = RegExp(r'^[a-zA-Z0-9 &-.,()]+$');
  RegExp addressRegExp = RegExp(r'''^[a-zA-Z0-9 /.:,-@#&_=()\"']+$''');
  RegExp mobileRegExp = RegExp(r'^[0-9]+$');
  RegExp mobileRegExpStartChar = RegExp(r'^[6-9]+$');

  // RegExp !onlyCharRegExp = RegExp(r'^[!@#$%^&*()]+$');
  RegExp emailRegExp = RegExp("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+");

  @override
  void onInit() {
    screenName.value = Get.arguments[AppArguments.screenName] ?? '';
    appId = Get.arguments[AppArguments.appId] ?? 0;
    getData();
    super.onInit();
  }

  Future<void> getMasterList() async {
    if (await NetUtils.isInternetAvailable()) {
      getList();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getList);
      }
    }
  }

  Future<void> getList() async {
    var list = ["RELEATION_SHIP"];
    var jsonRequest = jsonEncode(list);
    TGPostRequest tgPostRequest = await getPlainPayLoad(jsonRequest, URIS.URI_GET_MASTER_LIST);
    TGLog.d("GetMasterListRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().getMasterList(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessGetMasterList(response),
      onError: (error) => _onErrorGetMasterList(error),
    );
  }

  _onSuccessGetMasterList(GetMasterListResponse response) async {
    TGLog.d("GetMasterListRequest : onSuccess()---$response");
    if (response.getMasterList().status == RES_SUCCESS) {
      response.getMasterList().data?.releationship?.forEach((element) {
        items.value.addAll({element?.id?.toString() ?? "": element.value ?? ""});
      });
      isLoading.value = true;
    } else {
      TGLog.d("Error in GetMasterListRequest");
      isLoading.value = true;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getMasterList().status ?? 0, response.getMasterList().message ?? "", null);
    }
  }

  _onErrorGetMasterList(TGResponse errorResponse) {
    TGLog.d("GetMasterListRequest : onError()--${errorResponse.error}");
    isLoading.value = true;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> getData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      String data = await TGSession.getInstance().get(PREF_USER_FORM_DATA) ?? '';
      if (data.isNotEmpty && screenName.value != 'Service') {
        getAppData = getApplicationFormDetailsResponseMainFromJson(data);
        nominee = getAppData.data?.nominee?.first ?? Nominee();
        firstNameController.text = nominee.firstName ?? '';
        latsNameController.text = nominee.lastName ?? '';
        middleNameController.text = nominee.middleName ?? '';
        dobController.text = nominee.dateOfBirth != null
            ? AppUtils.convertDateFormat(nominee.dateOfBirth ?? '', 'yyyy-mm-dd', 'dd/mm/yyyy')
            : '';
        date = DateTime.parse(
            AppUtils.convertDateFormat(nominee.dateOfBirth ?? '', 'yyyy-mm-dd', 'yyyy-MM-dd hh:mm:ss.SSSSSS'));
        mobileController.text = nominee.mobileNumber ?? '';
        nomineeRelationShip.value = nominee.relationOfNomineeApplicantStr ?? '';
        relationshipid.value = nominee.relationOfNomineeApplicant ?? num.parse('0');
        emailController.text = nominee.emailIdOfNominee ?? '';
        addressOneController.text = nominee.address?.addressLine1 ?? '';
        addressTwoController.text = nominee.address?.addressLine2 ?? '';
        cityController.text = nominee.address?.city ?? '';
        districtController.text = nominee.address?.district ?? '';
        stateController.text = nominee.address?.state ?? '';
        pinCodeController.text = nominee.address?.pincode != null ? '${nominee.address?.pincode}' : '';
        print("nominee.relationOfNomineeApplicant${nominee.relationOfNomineeApplicant}");
        num id = nominee.relationOfNomineeApplicant!;
        items.value.forEach((key, value) {
          print("$key: $value");
          if (nominee.relationOfNomineeApplicant.toString() == key) {
            nomineeRelationShip.value = value;
            print("Final value$value");
          }
        });
        getMasterList();
      } else {
        getUserData();
      }
    });
  }

  void onChangeCheckboxValue(bool value) {
    isChecked.value = value;
    if (isChecked.value) {
      addressOneController.text = getAppData.data?.address?.addressLine1 ?? '';
      addressTwoController.text = getAppData.data?.address?.addressLine2 ?? '';
      cityController.text = getAppData.data?.address?.city ?? '';
      districtController.text = getAppData.data?.address?.district ?? '';
      stateController.text = getAppData.data?.address?.state ?? '';
      pinCodeController.text = getAppData.data?.address?.pincode != null ? '${getAppData.data?.address?.pincode}' : '';
    } else {
      addressOneController.text = '';
      addressTwoController.text = '';
      cityController.text = '';
      districtController.text = '';
      stateController.text = '';
      pinCodeController.text = '';
    }
  }

  Future selectDate() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    DateTime currentDate = DateTime.now();
    int firstDateYear = currentDate.year - 18;
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null) {
      date = picked;
      String month = getmonth(date.month);
      if (month.isNotEmpty && month.length > 4) {
        month = month.substring(0, 3);
      }
      var stringDate = '${date.day}/${date.month}/${date.year}';

      dobController.text = AppUtils.convertDateFormat(stringDate, 'dd/mm/yyyy', 'dd/mm/yyyy');
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

  bool isAdult(String birthDateString) {
    String datePattern = "dd/mm/yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 18 || yearDiff == 18 && monthDiff > 0 || yearDiff == 18 && monthDiff == 0 && dayDiff >= 0;
  }

  Future<void> setData() async {
    nominee.firstName = firstNameController.text;
    nominee.lastName = latsNameController.text;
    nominee.mobileNumber = mobileController.text;
    nominee.middleName = middleNameController.text;
    nominee.emailIdOfNominee = emailController.text;
    nominee.dateOfBirth = AppUtils.convertDateFormat('$date', 'yyyy-MM-dd hh:mm:ss.SSSSSS', 'yyyy-MM-ddThh:mm:ss.000Z');
    nominee.relationOfNomineeApplicantStr = nomineeRelationShip.value;
    nominee.relationOfNomineeApplicant = relationshipid.value;
    nominee.address?.addressLine1 = addressOneController.text;
    nominee.address?.addressLine2 = addressTwoController.text;
    nominee.address?.city = cityController.text;
    nominee.address?.district = districtController.text;
    nominee.address?.state = stateController.text;
    nominee.address?.pincode = num.parse(pinCodeController.text);
    getAppData.data?.nominee = [nominee];
    getAppData.data?.isSameApplicantAddress = isChecked.value;
    TGSession.getInstance().set(PREF_USER_FORM_DATA, getApplicationFormDetailsResponseMainToJson(getAppData));
    TGLog.d("First Name--${getAppData.data?.nominee!.first.firstName}");
  }

  void onPressContinue() {
    TGLog.d("IsAduu---${isAdult(dobController.text)}");
    TGSharedPreferences.getInstance().set(PREF_IS_ADULT, isAdult(dobController.text));
    if (isLoading.value) {
      final validCharacters = RegExp(r'^[0-9]+$');
      if (firstNameController.text.trim().isEmpty) {
        fNameErrorMsg.value = 'Please enter first name';
      } else if (!nameRegExp.hasMatch(firstNameController.text) ||
          firstNameController.text.trim() == ' ' ||
          firstNameController.text.substring(0, 1) == ' ') {
        fNameErrorMsg.value = 'Please enter valid first name';
      } else if ((middleNameController.text.isNotEmpty &&
              ((!nameRegExp.hasMatch(middleNameController.text)) ||
                  middleNameController.text.substring(0, 1) == ' ')) ||
          middleNameController.text == ' ') {
        mNameErrorMsg.value = 'Please enter valid middle name';
      } else if ((latsNameController.text.trim().isNotEmpty &&
              (!nameRegExp.hasMatch(latsNameController.text) || latsNameController.text.substring(0, 1) == ' ')) ||
          latsNameController.text == ' ') {
        lNameErrorMsg.value = 'Please enter valid last name';
      } else if (dobController.text.isEmpty) {
        dobErrorMsg.value = 'Please select date of birth';
      } else if (((mobileController.text.trim().isNotEmpty && !mobileRegExp.hasMatch(mobileController.text)) ||
              mobileController.text == ' ' ||
              (mobileController.text.trim().isNotEmpty &&
                  !mobileRegExpStartChar.hasMatch(mobileController.text.substring(0, 1)))) ||
          (mobileController.text.trim().isNotEmpty && mobileController.text.trim().length != 10)) {
        mobileErrorMsg.value = 'Please enter valid mobile number';
      } else if (relationshipid.value == 0) {
        relationErrorMsg.value = 'Please select relationship with the applicant';
      } else if (emailController.text.trim().isNotEmpty &&
          (emailController.text.trim().length < 5 ||
              !emailRegExp.hasMatch(emailController.text) ||
              emailController.text.substring(0, 1) == ' ')) {
        emailErrorMsg.value = 'Please enter valid email';
      } else if (addressOneController.text.trim().isEmpty ||
          addressOneController.text.trim().length < 2 ||
          addressOneController.text.substring(0, 1) == ' ' ||
          !addressRegExp.hasMatch(addressOneController.text)) {
        addressErrorMsg.value = 'Please enter valid address';
      } else if (addressTwoController.text.trim().isNotEmpty &&
          (addressTwoController.text.trim().length < 2 ||
              addressTwoController.text.substring(0, 1) == ' ' ||
              !addressRegExp.hasMatch(addressTwoController.text))) {
        address2ErrorMsg.value = 'Please enter valid address';
      } else if (cityController.text.trim().isEmpty ||
          cityController.text.trim().length < 2 ||
          cityController.text.substring(0, 1) == ' ' ||
          !onlyCharRegExp.hasMatch(cityController.text.trim().substring(0, 1)) ||
          !cityRegExp.hasMatch(cityController.text)) {
        cityErrorMsg.value = 'Please enter valid city';
      } else if (districtController.text.trim().isEmpty ||
          districtController.text.trim().length < 2 ||
          districtController.text.substring(0, 1) == ' ' ||
          !onlyCharRegExp.hasMatch(districtController.text.trim().substring(0, 1)) ||
          !cityRegExp.hasMatch(districtController.text)) {
        districtErrorMsg.value = 'Please enter valid district';
      } else if (stateController.text.trim().isEmpty ||
          stateController.text.trim().length < 2 ||
          stateController.text.substring(0, 1) == ' ' ||
          !onlyCharRegExp.hasMatch(stateController.text.trim().substring(0, 1))) {
        stateErrorMsg.value = 'Please enter valid state';
      } else if (pinCodeController.text.trim().isEmpty) {
        pinCodeErrorMsg.value = 'Please enter pincode';
      } else if (!validCharacters.hasMatch(pinCodeController.text) || pinCodeController.text.trim().length != 6) {
        pinCodeErrorMsg.value = 'Please enter valid pincode';
      } else {
        fNameErrorMsg.value = '';
        dobErrorMsg.value = '';
        addressErrorMsg.value = '';
        cityErrorMsg.value = '';
        stateErrorMsg.value = '';
        emailErrorMsg.value = '';
        address2ErrorMsg.value = '';
        districtErrorMsg.value = '';
        mNameErrorMsg.value = '';
        mobileErrorMsg.value = '';
        pinCodeErrorMsg.value = '';
        relationErrorMsg.value = '';
        lNameErrorMsg.value = '';
        setData();
        if (screenName.value == 'Service') {
          if (isAdult(dobController.text)) {
            onSaveData();
          } else {
            Get.to(() => GuradianDetailsPage(), binding: GuradianDetailsBinding(), arguments: {
              AppArguments.screenName: "Service",
              AppArguments.appId: appId,
            });
          }
        } else {
          if (isAdult(dobController.text)) {
            Get.to(() => PreviewApplicationPage(), binding: PreviewApplicationBinding());
          } else {
            Get.to(() => GuradianDetailsPage(), binding: GuradianDetailsBinding(), arguments: {
              AppArguments.screenName: "Address",
              AppArguments.appId: appId,
            });
          }
        }
      }
    }
  }

  Future<void> onSaveData() async {
    if (await NetUtils.isInternetAvailable()) {
      saveData();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, saveData);
      }
    }
  }

  Future<void> saveData() async {
    isLoading.value = false;
    request.SaveFormDetailsRequest saveFormDetailRequest = request.SaveFormDetailsRequest(
      dob: getAppData.data?.dob,
      applicationId: getAppData.data?.id,
      address: request.RequestAddress(
        id: getAppData.data?.address?.id,
        addressLine1: getAppData.data?.address?.addressLine1,
        addressLine2: getAppData.data?.address?.addressLine2,
        city: getAppData.data?.address?.city,
        district: getAppData.data?.address?.district,
        isActive: getAppData.data?.address?.isActive,
        pincode: getAppData.data?.address?.pincode,
        state: getAppData.data?.address?.state,
      ),
      dedupErrorMsg: null,
      emailAddress: getAppData.data?.emailAddress,
      fatherHusbandName: getAppData.data?.fatherHusbandName,
      firstName: getAppData.data?.firstName,
      insuranceName: getAppData.data?.insuranceName,
      isNomineeDeatilsSameEnroll: getAppData.data?.isNomineeDeatilsSameEnroll,
      isNomineeUpdate: true,
      isSameApplicantAddress: getAppData.data?.isSameApplicantAddress,
      kycId1: getAppData.data?.kycId1,
      kycId1number: getAppData.data?.kycId1number,
      kycId2: getAppData.data?.kycId2,
      kycId2number: getAppData.data?.kycId2number,
      lastName: getAppData.data?.lastName,
      middleName: getAppData.data?.middleName,
      mobileNo: getAppData.data?.mobileNo,
      nominee: [
        request.RequestNominee(
          middleName: getAppData.data?.nominee?.first.middleName,
          lastName: getAppData.data?.nominee?.first.lastName,
          firstName: getAppData.data?.nominee?.first.firstName,
          isActive: getAppData.data?.nominee?.first.isActive,
          id: getAppData.data?.nominee?.first.id,
          addressOfGuardian: null,
          emailIdOfGuardian: null,
          mobileNumberOfGuardian: null,
          nameOfGuardian: null,
          relationShipOfGuardian: 0,
          address: request.RequestAddress(
            id: getAppData.data?.nominee?.first.address?.id,
            addressLine1: getAppData.data?.nominee?.first.address?.addressLine1,
            addressLine2: getAppData.data?.nominee?.first.address?.addressLine2,
            city: getAppData.data?.nominee?.first.address?.city,
            district: getAppData.data?.nominee?.first.address?.district,
            isActive: getAppData.data?.nominee?.first.address?.isActive,
            pincode: getAppData.data?.nominee?.first.address?.pincode,
            state: getAppData.data?.nominee?.first.address?.state,
          ),
          mobileNumber: getAppData.data?.nominee?.first.mobileNumber,
          dateOfBirth: getAppData.data?.nominee?.first.dateOfBirth,
          emailIdOfNominee: getAppData.data?.nominee?.first.emailIdOfNominee,
          relationOfNomineeApplicant: relationshipid.value,
        ),
      ],
    );
    var jsonRequest = jsonEncode(saveFormDetailRequest.toJson());
    TGLog.d("SaveFormDetailRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_SAVE_FORM_DETAIL);
    TGLog.d("SaveFormDetailRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().saveFormDetail(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessSaveData(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessSaveData(SaveFormDetailResponse response) async {
    TGLog.d("SaveFormDetailRequest : onSuccess()---$response");
    if (response.saveFormDetail().status == RES_SUCCESS) {
      isLoading.value = true;
      Get.back(result: [
        {"backValue": true}
      ]);
    } else {
      TGLog.d("Error in SaveFormDetailResponse");
      isLoading.value = true;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.saveFormDetail().status ?? 0, response?.saveFormDetail()?.message ?? "", null);
    }
  }

  _onErrorSaveData(TGResponse errorResponse) {
    TGLog.d("SaveFormDetailRequest : onError()--${errorResponse.error}");
    isLoading.value = true;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> getUserData() async {
    if (await NetUtils.isInternetAvailable()) {
      getNomineeData();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getNomineeData);
      }
    }
  }

  Future<void> getNomineeData() async {
    if (appId == 0) {
      appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID) ?? 0;
    }
    var encAppId = AesGcmEncryptionUtils.encryptNew(appId.toString());
    var mockAppId = "101212404";
    GetApplicationFormDetailsRequest getApplicationFormDetailsRequest =
        GetApplicationFormDetailsRequest(appId: encAppId);
    TGLog.d("GetApplicationFormDetailsRequest--------$getApplicationFormDetailsRequest");
    ServiceManager.getInstance().getApplicationFormDetails(
      request: getApplicationFormDetailsRequest,
      onSuccess: (response) => _onSuccessVerifyOTP(response),
      onError: (error) => _onErrorVerifyOTP(error),
    );
  }

  _onSuccessVerifyOTP(GetApplicationFormDetailsResponse response) async {
    TGLog.d("GetApplicationFormDetailsRequest : onSuccess()---$response");
    if (response.getApplicationFormDetailsResponse().status == RES_SUCCESS) {
      TGSession.getInstance().set(PREF_USER_FORM_DATA,
          getApplicationFormDetailsResponseMainToJson(response.getApplicationFormDetailsResponse()));
      getAppData = response.getApplicationFormDetailsResponse();
      nominee = getAppData.data?.nominee?.first ?? Nominee();
      firstNameController.text = nominee.firstName ?? '';
      latsNameController.text = nominee.lastName ?? '';
      middleNameController.text = nominee.middleName ?? '';
      dobController.text = AppUtils.convertDateFormat(nominee.dateOfBirth, 'yyyy-mm-dd', 'dd/mm/yyyy') ?? '';
      mobileController.text = nominee.mobileNumber ?? '';
      relationWithApplicantController.text = nominee.relationOfNomineeApplicantStr ?? '';
      emailController.text = nominee.emailIdOfNominee ?? '';
      addressOneController.text = nominee.address?.addressLine1 ?? '';
      addressTwoController.text = nominee.address?.addressLine2 ?? '';
      cityController.text = nominee.address?.city ?? '';
      districtController.text = nominee.address?.district ?? '';
      stateController.text = nominee.address?.state ?? '';
      pinCodeController.text = nominee.address?.pincode != null ? '${nominee.address?.pincode}' : '';
      getMasterList();
    } else {
      TGLog.d("Error in GetApplicationFormDetailsRequest");
      isLoading.value = true;
      LoaderUtils.handleErrorResponse(Get.context!, response?.getApplicationFormDetailsResponse().status ?? 0,
          response?.getApplicationFormDetailsResponse()?.message ?? "", null);
    }
  }

  _onErrorVerifyOTP(TGResponse errorResponse) {
    TGLog.d("GetApplicationFormDetailsRequest : onError()--${errorResponse.error}");
    isLoading.value = true;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

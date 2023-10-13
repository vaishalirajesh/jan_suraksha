import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jan_suraksha/model/request_model/SaveFormDeatilRequest.dart' as request;
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/model/response_model/SaveFormDetailResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/view/screen/journey/terms_and_conditions/terms_and_conditions_binding.dart';
import 'package:jan_suraksha/view/screen/journey/terms_and_conditions/terms_and_conditions_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class PreviewApplicationFormLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isDataLoaded = false.obs;
  RxBool isAdultUser = true.obs;
  GetApplicationFormDetailsResponseMain getAppData = GetApplicationFormDetailsResponseMain();
  var dropdownValues = ["Yes", "No"];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      String data = await TGSession.getInstance().get(PREF_USER_FORM_DATA);
      getAppData = getApplicationFormDetailsResponseMainFromJson(data);
      isAdultUser.value = (await TGSharedPreferences.getInstance().get(PREF_IS_ADULT)) ?? false;
      isDataLoaded.value = true;
      update();
    });
  }

  void onPressContinue() {
    // if (isLoading.value) {
    onSaveData();
    // }
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
    isLoading.value = true;
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
      isNomineeUpdate: false,
      isSameApplicantAddress: getAppData.data?.isSameApplicantAddress,
      kycId1: getAppData.data?.kycId1,
      kycId1number: getAppData.data?.kycId1number,
      kycId2: getAppData.data?.kycId2,
      kycId2number: getAppData.data?.kycId2number,
      lastName: getAppData.data?.lastName,
      middleName: getAppData.data?.middleName,
      mobileNo: getAppData.data?.mobileNo,
      disabilityDetails: getAppData.data?.disabilityDetails,
      disabilityStatus: getAppData.data?.disabilityStatus,
      nominee: [
        request.RequestNominee(
          middleName: getAppData.data?.nominee?.first.middleName,
          lastName: getAppData.data?.nominee?.first.lastName,
          firstName: getAppData.data?.nominee?.first.firstName,
          isActive: getAppData.data?.nominee?.first.isActive,
          id: getAppData.data?.nominee?.first.id,
          addressOfGuardian: getAppData.data?.nominee?.first.addressOfGuardian,
          emailIdOfGuardian: getAppData.data?.nominee?.first.emailIdOfGuardian,
          mobileNumberOfGuardian: getAppData.data?.nominee?.first.mobileNumberOfGuardian,
          nameOfGuardian: getAppData.data?.nominee?.first.nameOfGuardian,
          relationShipOfGuardian: getAppData.data?.nominee?.first.relationShipOfGuardian,
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
          relationOfNomineeApplicant: getAppData.data?.nominee!.first.relationOfNomineeApplicant,
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
      isLoading.value = false;
      TGSession.getInstance().set(PREF_USER_FORM_DATA, "");
      // TGSession.getInstance().set(PREF_ACCOUNT_HOLDER_DATA, json.encode(response.verifyOTP()));
      Get.to(() => TermsAndConditionsPage(), binding: TermsAndConditionsBinding());
    } else {
      TGLog.d("Error in SaveFormDetailResponse");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.saveFormDetail().status ?? 0, response?.saveFormDetail()?.message ?? "", null);
    }
  }

  _onErrorSaveData(TGResponse errorResponse) {
    TGLog.d("SaveFormDetailRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
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
}

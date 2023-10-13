import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/GetApplicationFormDetailsRequest.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/model/response_model/GetApplicationFormDetailsResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/session.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/view/screen/journey/address_details/address_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/address_details/address_details_view.dart';
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_disability.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class ApplicationFormLogic extends GetxController {
  RxBool isLoading = false.obs;
  String dob = '';
  GetApplicationFormDetailsResponseMain getAppData = GetApplicationFormDetailsResponseMain();
  var isdisabled = false.obs;
  Rx<String?> disbletext = (null as String?).obs;
  RxString disableError = "".obs;
  RxString disableSelectionError = "".obs;
  var schemeId = 0.obs;
  var appId = 0.obs;
  TextEditingController disableController = TextEditingController(text: '');

  @override
  void onInit() {
    schemeId.value = Get.arguments[AppArguments.schemaId] ?? 0;
    appId.value = Get.arguments[AppArguments.appId] ?? 0;
    getUserData();
    super.onInit();
  }

  void onPressContinue() {
    if (schemeId.value == AppString.pmsbyId) {
      Get.to(() => ApplicationFormDisabilityPage(), binding: ApplicationFormBinding());
    } else {
      Get.to(() => AddressDetailsPage(), binding: AddressDetailsBinding());
    }
  }

  void onPressContinueFromDisability() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    if (disbletext?.value == 'Yes') {
      if (disableController.text.trim().isEmpty) {
        disableError.value = 'Please add disability detail';
      } else {
        disableError.value = '';
        getAppData.data?.disabilityStatus = disbletext.value;
        getAppData.data?.disabilityDetails = disableController.text;
        TGSession.getInstance().set(PREF_USER_FORM_DATA, getApplicationFormDetailsResponseMainToJson(getAppData));
        TGLog.d("Disablity---------${getAppData.data?.disabilityStatus}");
        TGLog.d("Disablity-------1--${getAppData.data?.disabilityDetails}");
        Get.to(() => AddressDetailsPage(), binding: AddressDetailsBinding());
      }
    } else {
      if (disbletext.value == null) {
        disableSelectionError.value = 'Please select disability';
      } else {
        disableError.value = '';
        getAppData.data?.disabilityStatus = disbletext.value;
        getAppData.data?.disabilityDetails = null;
        TGSession.getInstance().set(PREF_USER_FORM_DATA, getApplicationFormDetailsResponseMainToJson(getAppData));
        Get.to(() => AddressDetailsPage(), binding: AddressDetailsBinding());
      }
    }
  }

  Future<void> getUserData() async {
    if (schemeId.value == 0) {
      schemeId.value = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID);
    }
    if (await NetUtils.isInternetAvailable()) {
      getData();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getData);
      }
    }
  }

  Future<void> getData() async {
    isLoading.value = true;
    if (appId.value == 0) {
      appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID) ?? 0;
    }
    var encAppId = AesGcmEncryptionUtils.encryptNew(appId.toString());
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
      disbletext.value = getAppData.data?.disabilityStatus;
      disableController.text = getAppData.data?.disabilityDetails ?? '';
      isLoading.value = false;
    } else {
      TGLog.d("Error in GetApplicationFormDetailsRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response?.getApplicationFormDetailsResponse().status ?? 0,
          response?.getApplicationFormDetailsResponse()?.message ?? "", null);
    }
  }

  _onErrorVerifyOTP(TGResponse errorResponse) {
    TGLog.d("GetApplicationFormDetailsRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

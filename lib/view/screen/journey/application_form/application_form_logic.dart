import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/GetApplicationFormDetailsRequest.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/model/response_model/GetApplicationFormDetailsResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/view/screen/journey/address_details/address_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/address_details/address_details_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class ApplicationFormLogic extends GetxController {
  RxBool isLoading = false.obs;
  String dob = '';
  GetApplicationFormDetailsResponseMain getAppData = GetApplicationFormDetailsResponseMain();

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void onPressContinue() {
    Get.to(() => AddressDetailsPage(), binding: AddressDetailsBinding());
  }

  Future<void> getUserData() async {
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
    String appId = (await TGSharedPreferences.getInstance().get(PREF_APP_ID)).toString();
    var encAppId = AesGcmEncryptionUtils.encryptNew(appId);
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
      TGSharedPreferences.getInstance().set(PREF_USER_FORM_DATA,
          getApplicationFormDetailsResponseMainToJson(response.getApplicationFormDetailsResponse()));
      getAppData = response.getApplicationFormDetailsResponse();
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

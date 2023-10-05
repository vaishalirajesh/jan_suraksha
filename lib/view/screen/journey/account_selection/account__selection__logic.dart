import 'dart:convert';

import 'package:get/get.dart';
import 'package:jan_suraksha/config/Navigation_config.dart';
import 'package:jan_suraksha/model/request_model/UpdateSelectedAccountHolderRequest.dart';
import 'package:jan_suraksha/model/request_model/UpdateStageRequest.dart';
import 'package:jan_suraksha/model/response_main_model/VerifyOTPResponseMain.dart';
import 'package:jan_suraksha/model/response_model/UpdateSelectedAccountHolderResponse.dart';
import 'package:jan_suraksha/model/response_model/UpdateStageResponse.dart';
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
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_binding.dart';
import 'package:jan_suraksha/view/screen/journey/application_form/application_form_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class AccountSelectionLogic extends GetxController {
  List<RxBool> selectedWidget = [];
  VerifyOtpResponseMain verifyOtpResponseMain = VerifyOtpResponseMain();
  RxString accountHolderName = 'Vaishali Patel'.obs;
  RxString secondAccountHolderName = ''.obs;
  Data accountHolderData = Data();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    String data = TGSession.getInstance().get(PREF_ACCOUNT_HOLDER_DATA);
    verifyOtpResponseMain = verifyOtpResponseMainFromJson(data);
    if (verifyOtpResponseMain.data != null && verifyOtpResponseMain.data?.isNotEmpty == true) {
      for (var element in verifyOtpResponseMain.data!) {
        selectedWidget.add(false.obs);
      }
    }
    accountHolderData = verifyOtpResponseMain.data?.first ?? Data();
    TGLog.d("Accoun holder data----$verifyOtpResponseMain");
    super.onInit();
  }

  Future<void> onPressContinue() async {
    if (await NetUtils.isInternetAvailable()) {
      updateUserAccountData();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, updateUserAccountData);
      }
    }
  }

  Future<void> updateUserAccountData() async {
    isLoading.value = true;
    UpdateSelectedAccountHolderRequest updateSelectedAccountHolderRequest = UpdateSelectedAccountHolderRequest(
      applicationId: accountHolderData.applicationId,
      dob: accountHolderData.dob,
      gender: accountHolderData.gender,
      accountHolderName: accountHolderData.accountHolderName,
      index: '1st',
      cif: accountHolderData.cif,
      customerAccountNumber: accountHolderData.customerAccountNumber,
      holderId: null,
      id: null,
      invalidAgeHolder: false,
      kycUpdated: accountHolderData.kycUpdated,
      pmjjbyExists: accountHolderData.pmjjbyExists,
      pmsbyExists: accountHolderData.pmsbyExists,
      sizeOfACHolder: accountHolderData.sizeOfACHolder,
      urnCode: accountHolderData.urnCode,
    );
    var jsonRequest = jsonEncode(updateSelectedAccountHolderRequest.toJson());
    TGLog.d("UpdateSelectedAccountHolderRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_UPDATE_SELECTED_ACCOUNT_HOLDER);
    ServiceManager.getInstance().updateSelectedAccountHolder(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessUpdateSelectedAccountHolder(response),
      onError: (error) => _onErrorUpdateSelectedAccountHolder(error),
    );
  }

  _onSuccessUpdateSelectedAccountHolder(UpdateSelectedAccountHolderResponse response) async {
    TGLog.d("UpdateSelectedAccountHolderRequest : onSuccess()---$response");
    if (response.updateSelectedAccountHolder().status == RES_SUCCESS) {
      updateStage();
    } else if (response.updateSelectedAccountHolder().status == POLICY_NOT_AVAILABLE) {
      /// TODO: Add new page and policy not available code
      Get.toNamed(PolicyAvailedPageRoute);
    } else {
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response?.updateSelectedAccountHolder().status ?? 0,
          response?.updateSelectedAccountHolder()?.message ?? "", null);
    }
  }

  _onErrorUpdateSelectedAccountHolder(TGResponse errorResponse) {
    TGLog.d("UpdateSelectedAccountHolderRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }

  Future<void> updateStage() async {
    if (await NetUtils.isInternetAvailable()) {
      updateStageDeatil();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, updateStageDeatil);
      }
    }
  }

  Future<void> updateStageDeatil() async {
    isLoading.value = true;
    var appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID);
    UpdateStageRequest updateStageRequest = UpdateStageRequest(applicationId: appId, stageId: 4);
    var jsonRequest = jsonEncode(updateStageRequest.toJson());
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_UPDATE_STAGE);
    TGLog.d("UpdateStageRequest Decrypt:--------$tgPostRequest");
    ServiceManager.getInstance().updateApplicationStage(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessUpdateStage(response, appId),
      onError: (error) => _onErrorUpdateStage(error),
    );
  }

  _onSuccessUpdateStage(UpdateStageResponse response, var appId) async {
    TGLog.d("UpdateStageRequest : onSuccess()---$response");
    var schemeId = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID) ?? 0;
    if (response.updateApplicationStage().status == RES_SUCCESS) {
      isLoading.value = false;
      Get.offAll(() => ApplicationFormPage(), binding: ApplicationFormBinding(), arguments: {
        AppArguments.schemaId: schemeId,
        AppArguments.appId: appId,
      });
    } else {
      TGLog.d("Error in UpdateStageRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(Get.context!, response.updateApplicationStage().status ?? 0,
          response.updateApplicationStage().message ?? "", null);
    }
  }

  _onErrorUpdateStage(TGResponse errorResponse) {
    TGLog.d("UpdateStageRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

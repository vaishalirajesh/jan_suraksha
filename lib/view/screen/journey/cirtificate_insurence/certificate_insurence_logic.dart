import 'dart:convert';

import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/GenerateCOIRequest.dart';
import 'package:jan_suraksha/model/response_main_model/GenerateCoiResponseMain.dart';
import 'package:jan_suraksha/model/response_model/GenerateCoiResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class CertificateInsurenceLogic extends GetxController {
  RxBool isLoading = true.obs;
  GenerateCoiResponseMain generateCoiData = GenerateCoiResponseMain();
  RxInt schemeId = 1.obs;

  @override
  void onInit() {
    getSchemeDetail();
    getDetail();
    super.onInit();
  }

  Future<void> getSchemeDetail() async {
    schemeId.value = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID) ?? 1;
  }

  void onPressDownload() {
    Get.offAll(() => DashboardPage(), binding: DashboardBinding());
  }

  Future<void> onGetDetail() async {
    if (await NetUtils.isInternetAvailable()) {
      getDetail();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getDetail);
      }
    }
  }

  Future<void> getDetail() async {
    var appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID) ?? '';
    var orgId = await TGSharedPreferences.getInstance().get(PREF_ORG_ID) ?? '13';
    GenerateCoiRequest generateCoiRequest = GenerateCoiRequest(
      applicationId: appId.toString(),
      schemeId: schemeId.value.toString(),
      orgId: orgId.toString(),
      isDownload: false,
    );
    var jsonRequest = jsonEncode(generateCoiRequest.toJson());
    TGLog.d("GenerateCoiRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_GENERATE_COI);
    TGLog.d("GenerateCoiRequest Decrypt:--------${tgPostRequest.body()}");
    ServiceManager.getInstance().generateCoi(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessSaveData(response),
      onError: (error) => _onErrorSaveData(error),
    );
  }

  _onSuccessSaveData(GenerateCoiResponse response) async {
    TGLog.d("GenerateCoiRequest : onSuccess()---$response");
    if (response.generateCoi().status == RES_SUCCESS) {
      generateCoiData = response.generateCoi();
      isLoading.value = false;
    } else {
      TGLog.d("Error in PremiumDeductionResponse");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response?.generateCoi().status ?? 0, response?.generateCoi()?.message ?? "", null);
    }
  }

  _onErrorSaveData(TGResponse errorResponse) {
    TGLog.d("GenerateCoiRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/GetSchemaByUserIdRequest.dart';
import 'package:jan_suraksha/model/response_model/GetSchemaByUserIdResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/mock/mock_service.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class DashboardLogic extends GetxController {
  var index = 0.obs;
  RxBool isLoading = true.obs;
  var isExpandedScheme = true.obs;
  var isExpandedNominee = true.obs;
  var schemeDetail;

  setIndex(int value) {
    index.value = value;
  }

  @override
  void onInit() {
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
      isLoading.value = false;
      schemeDetail = response.getSchemaByUserId();
      schemeDetail = json.decode(response.getSchemaByUserId().data ?? '');
      TGLog.d("Jsondata=--------$schemeDetail");
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
}

import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/GetOrgMasterListRequest.dart';
import 'package:jan_suraksha/model/response_model/GetOrgMasterListResponse.dart';
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
import 'package:jan_suraksha/model/response_main_model/GetOrgMasterListResponseMain.dart';

class BankSelectionLogic extends GetxController {
  RxBool isLoading = true.obs;
  List<Data> bankList = [];

  @override
  void onInit() {
    getOrgMasterList();
  }

  Future<void> getOrgMasterList() async {
    if (await NetUtils.isInternetAvailable()) {
      getDetail();
    } else {
      if (Get.context!.mounted) {
        showSnackBarForintenetConnection(Get.context!, getDetail);
      }
    }
  }

  Future<void> getDetail() async {
    var encUserId = AesGcmEncryptionUtils.encryptNew('2');
    GetOrgMasterListRequest getOrgMasterListRequest =
        GetOrgMasterListRequest(id: TGMockService.applyMock ? '2' : encUserId);
    TGLog.d("GetOrgMasterListRequest Decrypt:--------$getOrgMasterListRequest");
    ServiceManager.getInstance().getOrgMasterList(
      request: getOrgMasterListRequest,
      onSuccess: (response) => _onSuccessGetSchemaByUserId(response),
      onError: (error) => _onErrorGetSchemaByUserId(error),
    );
  }

  _onSuccessGetSchemaByUserId(GetOrgMasterListResponse response) async {
    TGLog.d("GetOrgMasterListRequest : onSuccess()---$response");
    if (response.getOrgMasterList().status == RES_SUCCESS) {
      bankList = response.getOrgMasterList().data ?? [];
      isLoading.value = false;
    } else {
      TGLog.d("Error in GetOrgMasterListRequest");
      isLoading.value = false;
      LoaderUtils.handleErrorResponse(
          Get.context!, response.getOrgMasterList().status ?? 0, response.getOrgMasterList().message ?? "", null);
    }
  }

  _onErrorGetSchemaByUserId(TGResponse errorResponse) {
    TGLog.d("GetOrgMasterListRequest : onError()--${errorResponse.error}");
    isLoading.value = false;
    handleServiceFailError(Get.context!, errorResponse.error);
  }
}

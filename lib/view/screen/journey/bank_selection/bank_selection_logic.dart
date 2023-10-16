import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/GetOrgMasterListRequest.dart';
import 'package:jan_suraksha/model/response_main_model/GetOrgMasterListResponseMain.dart';
import 'package:jan_suraksha/model/response_model/GetOrgMasterListResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/encryption/encdec/aesGcmEncryption.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';

class BankSelectionLogic extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Data> bankList = <Data>[].obs;
  RxList<Data> tempList = <Data>[].obs;
  final TextEditingController searchController = TextEditingController();

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

  void onSearch(String str) {
    tempList.value = bankList
        .where((bankList) => bankList.value?.toLowerCase().contains(searchController.text.toLowerCase()) == true)
        .toList();
  }

  Future<void> getDetail() async {
    var encUserId = AesGcmEncryptionUtils.encryptNew('2');
    GetOrgMasterListRequest getOrgMasterListRequest = GetOrgMasterListRequest(id: encUserId);
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
      bankList.value = response.getOrgMasterList().data ?? [];
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

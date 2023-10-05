import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';
import 'package:jan_suraksha/view/widget/progressloader.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../config/color_config.dart';
import '../../../../model/request_model/DownloadAgreementRequest.dart';
import '../../../../model/response_model/DownloadAgreementResponse.dart';

class CertificateInsurenceLogic extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isDownLoading = false.obs;

  GenerateCoiResponseMain generateCoiData = GenerateCoiResponseMain();
  RxInt schemeId = 0.obs;
  RxInt appId = 0.obs;
  var dateTimeNow = DateTime.now();

  @override
  void onInit() {
    getSchemeDetail();

    super.onInit();
  }

  Future<void> getSchemeDetail() async {
    schemeId.value = Get.arguments[AppArguments.schemaId] ?? 0;
    appId.value = Get.arguments[AppArguments.appId] ?? 0;
    if (schemeId.value == 0) {
      schemeId.value = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID) ?? 0;
    }
    if (appId.value == 0) {
      appId.value = (await TGSharedPreferences.getInstance().get(PREF_APP_ID));
    }
    onGetDetail();
  }

  Future<void> onPressDownload() async {
    isDownLoading.value = true;
    String orgId = (await TGSharedPreferences.getInstance().get(PREF_ORG_ID)).toString() ?? '13';
    DownloadAgreementRequest request = DownloadAgreementRequest(
        applicationId: appId.toString(), schemeId: schemeId.toString(), orgId: orgId, isDownload: true);
    var jsonRequest = jsonEncode(request.toJson());
    TGLog.d("GenerateCoiRequest $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_DOWNLOAD_AGREEMENT);
    ServiceManager.getInstance().downloadCoi(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccess(response),
        onError: (response) => _onFailure(response));
    // Get.offAll(() => DashboardPage(), binding: DashboardBinding());
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
    var orgId = await TGSharedPreferences.getInstance().get(PREF_ORG_ID) ?? '';
    GenerateCoiRequest generateCoiRequest = GenerateCoiRequest(
      applicationId: appId.value.toString(),
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
      TGLog.d(generateCoiData.toJson());
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

  _onSuccess(GetCoiAgreementResponseMain response) async {
    TGLog.d(response);
    final byteString = base64Decode(response.getLoginResponseData().data ?? "");
    final int8List = Uint8List.fromList(byteString);
    var currentDate =
        AppUtils.convertDateFormat(DateTime.now().toString(), 'yyyy-MM-dd hh:mm:ss.SSSSSS', 'dd_MM_yyyy_hh_mm_ss');
    var date = currentDate.toString().replaceAll(' ', '_');
    saveFileToDownloads("JanSuraksha_COI_${date}.pdf", int8List);
  }

  Future<void> saveFileToDownloads(String fileName, List<int> fileBytes) async {
    String? filePath = await getDownloadPath();
    File file = File(filePath! + "/" + fileName);
    await file.writeAsBytes(fileBytes);
    Get.defaultDialog(
      title: "File Download",
      contentPadding: EdgeInsets.all(20.r),
      titlePadding: EdgeInsets.only(top: 20.r),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConfig.jsPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
            onPressed: () {
              Get.offAll(() => DashboardPage(), binding: DashboardBinding());
            },
            child: const Text("Go to Dashboard")),
      ],
      middleText: "File Download Completed. ",
    );
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

  _onFailure(response) {
    isDownLoading.value = false;
  }
}

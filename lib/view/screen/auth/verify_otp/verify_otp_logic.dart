import 'dart:convert';

import 'package:get/get.dart';
import 'package:jan_suraksha/model/request_model/VerifyLoginOTPRequest.dart';
import 'package:jan_suraksha/model/response_model/VerifyLoginOtpResponse.dart';
import 'package:jan_suraksha/services/common/tg_log.dart';
import 'package:jan_suraksha/services/request/tg_post_request.dart';
import 'package:jan_suraksha/services/requtilization.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/uris.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/utils/constant/statusconstants.dart';
import 'package:jan_suraksha/utils/erros_handle_util.dart';
import 'package:jan_suraksha/utils/internetcheckdialog.dart';
import 'package:jan_suraksha/utils/net_util.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';

class VerifyOtpLogic extends GetxController {
  RxString otp = ''.obs;

  RxString mobile = ''.obs;
  RxBool isValideOTP = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    mobile.value = Get.arguments[AppArguments.mobileNumber] ?? '';
    super.onInit();
  }

  Future<void> onPressSubmit() async {
    if (otp.value.length == 4) {
      Get.offAll(() => DashboardPage(), binding: DashboardBinding());
      // if (await NetUtils.isInternetAvailable()) {
      //   verifyOtp();
      // } else {
      //   if (Get.context!.mounted) {
      //     showSnackBarForintenetConnection(Get.context!, verifyOtp);
      //   }
      // }
    } else {
      isValideOTP.value = false;
    }
  }

  Future<void> verifyOtp() async {
    VerifyLoginOtpRequest verifyLoginOtpRequest =
        VerifyLoginOtpRequest(otp: otp.value, userType: 2, email: 'paresh.bo@opl.com');
    var jsonRequest = jsonEncode(verifyLoginOtpRequest.toJson());
    TGLog.d("Verify OTP $jsonRequest");
    TGPostRequest tgPostRequest = await getPayLoad(jsonRequest, URIS.URI_VERIFY_LOGIN_OTP);
    ServiceManager.getInstance().verifyLoginOtp(
        request: tgPostRequest,
        onSuccess: (response) => _onSuccessAutoLogin(response),
        onError: (error) => _onErrorAutoLogin(error));
  }

  _onSuccessAutoLogin(VerifyLoginOtpResponse response) async {
    TGLog.d("VerifyLoginOtpRequest : onSuccess()");
    if (response?.verifyLoginOtp()?.status == RES_SUCCESS) {
      Get.offAll(() => DashboardPage(), binding: DashboardBinding());
    } else {
      TGLog.d("Error in VerifyLoginOtpRequest");
      // setState(() {
      //   _isGetOTPLoaderStart = false;
      // });
      // LoaderUtils.handleErrorResponse(Get.context!, response?.getLoginResponseData().status ?? 0,
      //     response?.getLoginResponseData()?.message ?? "", null);
    }
  }

  _onErrorAutoLogin(TGResponse errorResponse) {
    TGLog.d("VerifyLoginOtpRequest : onError()");
    // setState(() {
    //   _isGetOTPLoaderStart = false;
    // });
    handleServiceFailError(Get.context!, errorResponse);
  }

  void onChangeOTP(String str) {
    isValideOTP.value = true;
    otp.value = str;
  }

  void onSubmitOTP(String str) {
    otp.value = str;
  }
}

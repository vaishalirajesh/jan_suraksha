import 'package:jan_suraksha/model/response_main_model/VerifyOTPResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class VerifyOTPResponse extends TGResponse {
  VerifyOtpResponseMain _verifyOtpResponseMain = VerifyOtpResponseMain();

  VerifyOTPResponse();

  VerifyOTPResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _verifyOtpResponseMain = VerifyOtpResponseMain.fromJson(json);
  }

  VerifyOtpResponseMain verifyOTP() {
    return _verifyOtpResponseMain;
  }
}

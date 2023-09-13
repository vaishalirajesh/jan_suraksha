import 'package:jan_suraksha/model/response_main_model/VerifyLoginOtpResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class VerifyLoginOtpResponse extends TGResponse {
  VerifyLoginOtpResponseMain _verifyLoginOtpResponseMain = VerifyLoginOtpResponseMain();

  VerifyLoginOtpResponse();

  VerifyLoginOtpResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _verifyLoginOtpResponseMain = VerifyLoginOtpResponseMain.fromJson(json);
  }

  VerifyLoginOtpResponseMain verifyLoginOtp() {
    return _verifyLoginOtpResponseMain;
  }
}

import 'package:jan_suraksha/model/response_main_model/OTPResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class OTPResponse extends TGResponse {
  OTPResponseMain _consentOtpSendResponseMain = OTPResponseMain();

  OTPResponse();

  OTPResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _consentOtpSendResponseMain = OTPResponseMain.fromJson(json);
  }

  OTPResponseMain consentOtpSend() {
    return _consentOtpSendResponseMain;
  }
}

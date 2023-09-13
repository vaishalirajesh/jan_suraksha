import 'package:jan_suraksha/model/response_main_model/VerifyPhysicalSignatureResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class VerifyPhysicalSignatureResponse extends TGResponse {
  VerifyPhysicalSignatureResponseMain _verifyPhysicalSignatureResponseMain = VerifyPhysicalSignatureResponseMain();

  VerifyPhysicalSignatureResponse();

  VerifyPhysicalSignatureResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _verifyPhysicalSignatureResponseMain = VerifyPhysicalSignatureResponseMain.fromJson(json);
  }

  VerifyPhysicalSignatureResponseMain verifyPhysicalSignature() {
    return _verifyPhysicalSignatureResponseMain;
  }
}

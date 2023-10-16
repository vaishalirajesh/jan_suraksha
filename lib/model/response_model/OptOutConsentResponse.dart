import 'package:jan_suraksha/model/response_main_model/LoginWithMobilResponseMain.dart';
import 'package:jan_suraksha/model/response_main_model/OptOutConsentResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class OptOutConsentResponse extends TGResponse {
  OptOutConsentResponseMain _optOutConsentResponseMain = OptOutConsentResponseMain();

  OptOutConsentResponse();

  OptOutConsentResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _optOutConsentResponseMain = OptOutConsentResponseMain.fromJson(json);
  }

  OptOutConsentResponseMain getOptOutConsent() {
    return _optOutConsentResponseMain;
  }
}

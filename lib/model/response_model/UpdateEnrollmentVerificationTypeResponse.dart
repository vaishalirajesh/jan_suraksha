import 'package:jan_suraksha/model/response_main_model/UpdateEnrollmentVerificationTypeResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class UpdateEnrollmentVerificationTypeResponse extends TGResponse {
  UpdateEnrollmentVerificationTypeResponseMain _updateEnrollmentVerificationTypeResponseMain =
      UpdateEnrollmentVerificationTypeResponseMain();

  UpdateEnrollmentVerificationTypeResponse();

  UpdateEnrollmentVerificationTypeResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _updateEnrollmentVerificationTypeResponseMain = UpdateEnrollmentVerificationTypeResponseMain.fromJson(json);
  }

  UpdateEnrollmentVerificationTypeResponseMain updateEnrollmentVerificationType() {
    return _updateEnrollmentVerificationTypeResponseMain;
  }
}

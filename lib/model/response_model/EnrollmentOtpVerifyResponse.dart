import 'package:jan_suraksha/model/response_main_model/EnrollmentOtpVerifyResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class EnrollmentOtpVerifyResponse extends TGResponse {
  EnrollmentOtpVerifyResponseMain _enrollmentOtpVerifyResponseMain = EnrollmentOtpVerifyResponseMain();

  EnrollmentOtpVerifyResponse();

  EnrollmentOtpVerifyResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _enrollmentOtpVerifyResponseMain = EnrollmentOtpVerifyResponseMain.fromJson(json);
  }

  EnrollmentOtpVerifyResponseMain enrollmentOtpVerifyResponse() {
    return _enrollmentOtpVerifyResponseMain;
  }
}

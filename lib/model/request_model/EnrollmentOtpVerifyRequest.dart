import 'dart:convert';

EnrollmentOtpVerifyRequest enrollmentOtpVerifyRequestFromJson(String str) =>
    EnrollmentOtpVerifyRequest.fromJson(json.decode(str));

String enrollmentOtpVerifyRequestToJson(EnrollmentOtpVerifyRequest data) => json.encode(data.toJson());

class EnrollmentOtpVerifyRequest {
  EnrollmentOtpVerifyRequest({
    num? applicationId,
    num? orgId,
    String? verifyOTP,
  }) {
    _applicationId = applicationId;
    _orgId = orgId;
    _verifyOTP = verifyOTP;
  }

  EnrollmentOtpVerifyRequest.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
    _orgId = json['orgId'];
    _verifyOTP = json['verifyOTP'];
  }

  num? _applicationId;
  num? _orgId;
  String? _verifyOTP;

  EnrollmentOtpVerifyRequest copyWith({
    num? applicationId,
    num? orgId,
    String? verifyOTP,
  }) =>
      EnrollmentOtpVerifyRequest(
        applicationId: applicationId ?? _applicationId,
        orgId: orgId ?? _orgId,
        verifyOTP: verifyOTP ?? _verifyOTP,
      );

  num? get applicationId => _applicationId;

  num? get orgId => _orgId;

  String? get verifyOTP => _verifyOTP;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationId'] = _applicationId;
    map['orgId'] = _orgId;
    map['verifyOTP'] = _verifyOTP;
    return map;
  }
}

import 'dart:convert';

VerifyOtpRequest verifyOtpRequestFromJson(String str) => VerifyOtpRequest.fromJson(json.decode(str));
String verifyOtpRequestToJson(VerifyOtpRequest data) => json.encode(data.toJson());

class VerifyOtpRequest {
  VerifyOtpRequest({
    num? applicationId,
    num? orgId,
    String? verifyOTP,
  }) {
    _applicationId = applicationId;
    _orgId = orgId;
    _verifyOTP = verifyOTP;
  }

  VerifyOtpRequest.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
    _orgId = json['orgId'];
    _verifyOTP = json['verifyOTP'];
  }
  num? _applicationId;
  num? _orgId;
  String? _verifyOTP;
  VerifyOtpRequest copyWith({
    num? applicationId,
    num? orgId,
    String? verifyOTP,
  }) =>
      VerifyOtpRequest(
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

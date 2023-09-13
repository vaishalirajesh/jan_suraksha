import 'dart:convert';

VerifyPhysicalSignatureRequest verifyPhysicalSignatureRequestFromJson(String str) =>
    VerifyPhysicalSignatureRequest.fromJson(json.decode(str));
String verifyPhysicalSignatureRequestToJson(VerifyPhysicalSignatureRequest data) => json.encode(data.toJson());

class VerifyPhysicalSignatureRequest {
  VerifyPhysicalSignatureRequest({
    String? applicationId,
  }) {
    _applicationId = applicationId;
  }

  VerifyPhysicalSignatureRequest.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
  }
  String? _applicationId;
  VerifyPhysicalSignatureRequest copyWith({
    String? applicationId,
  }) =>
      VerifyPhysicalSignatureRequest(
        applicationId: applicationId ?? _applicationId,
      );
  String? get applicationId => _applicationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationId'] = _applicationId;
    return map;
  }
}

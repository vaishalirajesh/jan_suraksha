import 'dart:convert';

/// applicationId : "104753270"
/// schemeId : "2"

PremiumDeductionRequest PremiumDeductionRequestFromJson(String str) =>
    PremiumDeductionRequest.fromJson(json.decode(str));
String PremiumDeductionRequestToJson(PremiumDeductionRequest data) => json.encode(data.toJson());

class PremiumDeductionRequest {
  PremiumDeductionRequest({
    String? applicationId,
    String? schemeId,
  }) {
    _applicationId = applicationId;
    _schemeId = schemeId;
  }

  PremiumDeductionRequest.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
    _schemeId = json['schemeId'];
  }
  String? _applicationId;
  String? _schemeId;
  PremiumDeductionRequest copyWith({
    String? applicationId,
    String? schemeId,
  }) =>
      PremiumDeductionRequest(
        applicationId: applicationId ?? _applicationId,
        schemeId: schemeId ?? _schemeId,
      );
  String? get applicationId => _applicationId;
  String? get schemeId => _schemeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationId'] = _applicationId;
    map['schemeId'] = _schemeId;
    return map;
  }
}

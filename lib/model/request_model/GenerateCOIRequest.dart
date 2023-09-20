import 'dart:convert';

/// applicationId : "104753270"
/// schemeId : "2"
/// orgId : "13"
/// isDownload : false

GenerateCoiRequest generateCoiRequestFromJson(String str) => GenerateCoiRequest.fromJson(json.decode(str));
String generateCoiRequestToJson(GenerateCoiRequest data) => json.encode(data.toJson());

class GenerateCoiRequest {
  GenerateCoiRequest({
    String? applicationId,
    String? schemeId,
    String? orgId,
    bool? isDownload,
  }) {
    _applicationId = applicationId;
    _schemeId = schemeId;
    _orgId = orgId;
    _isDownload = isDownload;
  }

  GenerateCoiRequest.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
    _schemeId = json['schemeId'];
    _orgId = json['orgId'];
    _isDownload = json['isDownload'];
  }
  String? _applicationId;
  String? _schemeId;
  String? _orgId;
  bool? _isDownload;
  GenerateCoiRequest copyWith({
    String? applicationId,
    String? schemeId,
    String? orgId,
    bool? isDownload,
  }) =>
      GenerateCoiRequest(
        applicationId: applicationId ?? _applicationId,
        schemeId: schemeId ?? _schemeId,
        orgId: orgId ?? _orgId,
        isDownload: isDownload ?? _isDownload,
      );
  String? get applicationId => _applicationId;
  String? get schemeId => _schemeId;
  String? get orgId => _orgId;
  bool? get isDownload => _isDownload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationId'] = _applicationId;
    map['schemeId'] = _schemeId;
    map['orgId'] = _orgId;
    map['isDownload'] = _isDownload;
    return map;
  }
}

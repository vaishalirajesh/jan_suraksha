import 'dart:convert';

UpdateStageRequest updateStageRequestFromJson(String str) => UpdateStageRequest.fromJson(json.decode(str));
String updateStageRequestToJson(UpdateStageRequest data) => json.encode(data.toJson());

class UpdateStageRequest {
  UpdateStageRequest({
    num? applicationId,
    num? stageId,
  }) {
    _applicationId = applicationId;
    _stageId = stageId;
  }

  UpdateStageRequest.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
    _stageId = json['stageId'];
  }
  num? _applicationId;
  num? _stageId;
  UpdateStageRequest copyWith({
    num? applicationId,
    num? stageId,
  }) =>
      UpdateStageRequest(
        applicationId: applicationId ?? _applicationId,
        stageId: stageId ?? _stageId,
      );
  num? get applicationId => _applicationId;
  num? get stageId => _stageId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationId'] = _applicationId;
    map['stageId'] = _stageId;
    return map;
  }
}

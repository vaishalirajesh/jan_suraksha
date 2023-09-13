import 'dart:convert';

CreateApplication createApplicationFromJson(String str) => CreateApplication.fromJson(json.decode(str));
String createApplicationToJson(CreateApplication data) => json.encode(data.toJson());

class CreateApplication {
  CreateApplication({
    dynamic applicationId,
    String? schemeId,
    String? userId,
    String? orgId,
    String? accountNo,
    String? dob,
  }) {
    _applicationId = applicationId;
    _schemeId = schemeId;
    _userId = userId;
    _orgId = orgId;
    _accountNo = accountNo;
    _dob = dob;
  }

  CreateApplication.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
    _schemeId = json['schemeId'];
    _userId = json['userId'];
    _orgId = json['orgId'];
    _accountNo = json['accountNo'];
    _dob = json['dob'];
  }
  dynamic _applicationId;
  String? _schemeId;
  String? _userId;
  String? _orgId;
  String? _accountNo;
  String? _dob;
  CreateApplication copyWith({
    dynamic applicationId,
    String? schemeId,
    String? userId,
    String? orgId,
    String? accountNo,
    String? dob,
  }) =>
      CreateApplication(
        applicationId: applicationId ?? _applicationId,
        schemeId: schemeId ?? _schemeId,
        userId: userId ?? _userId,
        orgId: orgId ?? _orgId,
        accountNo: accountNo ?? _accountNo,
        dob: dob ?? _dob,
      );
  dynamic get applicationId => _applicationId;
  String? get schemeId => _schemeId;
  String? get userId => _userId;
  String? get orgId => _orgId;
  String? get accountNo => _accountNo;
  String? get dob => _dob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationId'] = _applicationId;
    map['schemeId'] = _schemeId;
    map['userId'] = _userId;
    map['orgId'] = _orgId;
    map['accountNo'] = _accountNo;
    map['dob'] = _dob;
    return map;
  }
}

import 'dart:convert';

/// applicationId : 5969
/// urn : "JNS-PMJJBY-23-24-00000005969-239"
/// accountNumber : "2343432"
/// name : "ankit varshney"
/// policyEffectiveDate : "2023-09-11T15:13:05.090+00:00"
/// dateOfRequest : "2023-09-22T10:23:23.532+00:00"
/// dateOfEffective : "2023-09-24T18:30:00.000Z"
/// schemeName : "PMJJBY"

SaveOptoutRequest saveOptoutRequestFromJson(String str) => SaveOptoutRequest.fromJson(json.decode(str));
String saveOptoutRequestToJson(SaveOptoutRequest data) => json.encode(data.toJson());

class SaveOptoutRequest {
  SaveOptoutRequest({
    num? applicationId,
    String? urn,
    String? accountNumber,
    String? name,
    String? policyEffectiveDate,
    String? dateOfRequest,
    String? dateOfEffective,
    String? schemeName,
  }) {
    _applicationId = applicationId;
    _urn = urn;
    _accountNumber = accountNumber;
    _name = name;
    _policyEffectiveDate = policyEffectiveDate;
    _dateOfRequest = dateOfRequest;
    _dateOfEffective = dateOfEffective;
    _schemeName = schemeName;
  }

  SaveOptoutRequest.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
    _urn = json['urn'];
    _accountNumber = json['accountNumber'];
    _name = json['name'];
    _policyEffectiveDate = json['policyEffectiveDate'];
    _dateOfRequest = json['dateOfRequest'];
    _dateOfEffective = json['dateOfEffective'];
    _schemeName = json['schemeName'];
  }
  num? _applicationId;
  String? _urn;
  String? _accountNumber;
  String? _name;
  String? _policyEffectiveDate;
  String? _dateOfRequest;
  String? _dateOfEffective;
  String? _schemeName;
  SaveOptoutRequest copyWith({
    num? applicationId,
    String? urn,
    String? accountNumber,
    String? name,
    String? policyEffectiveDate,
    String? dateOfRequest,
    String? dateOfEffective,
    String? schemeName,
  }) =>
      SaveOptoutRequest(
        applicationId: applicationId ?? _applicationId,
        urn: urn ?? _urn,
        accountNumber: accountNumber ?? _accountNumber,
        name: name ?? _name,
        policyEffectiveDate: policyEffectiveDate ?? _policyEffectiveDate,
        dateOfRequest: dateOfRequest ?? _dateOfRequest,
        dateOfEffective: dateOfEffective ?? _dateOfEffective,
        schemeName: schemeName ?? _schemeName,
      );
  num? get applicationId => _applicationId;
  String? get urn => _urn;
  String? get accountNumber => _accountNumber;
  String? get name => _name;
  String? get policyEffectiveDate => _policyEffectiveDate;
  String? get dateOfRequest => _dateOfRequest;
  String? get dateOfEffective => _dateOfEffective;
  String? get schemeName => _schemeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationId'] = _applicationId;
    map['urn'] = _urn;
    map['accountNumber'] = _accountNumber;
    map['name'] = _name;
    map['policyEffectiveDate'] = _policyEffectiveDate;
    map['dateOfRequest'] = _dateOfRequest;
    map['dateOfEffective'] = _dateOfEffective;
    map['schemeName'] = _schemeName;
    return map;
  }
}

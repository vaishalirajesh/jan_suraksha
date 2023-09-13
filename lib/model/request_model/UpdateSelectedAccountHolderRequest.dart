import 'dart:convert';

UpdateSelectedAccountHolderRequest updateSelectedAccountHolderRequestFromJson(String str) =>
    UpdateSelectedAccountHolderRequest.fromJson(json.decode(str));
String updateSelectedAccountHolderRequestToJson(UpdateSelectedAccountHolderRequest data) => json.encode(data.toJson());

class UpdateSelectedAccountHolderRequest {
  UpdateSelectedAccountHolderRequest({
    dynamic id,
    num? applicationId,
    String? accountHolderName,
    String? cif,
    String? dob,
    String? gender,
    bool? pmjjbyExists,
    bool? pmsbyExists,
    bool? kycUpdated,
    String? customerAccountNumber,
    String? urnCode,
    num? sizeOfACHolder,
    String? index,
    bool? invalidAgeHolder,
    dynamic holderId,
  }) {
    _id = id;
    _applicationId = applicationId;
    _accountHolderName = accountHolderName;
    _cif = cif;
    _dob = dob;
    _gender = gender;
    _pmjjbyExists = pmjjbyExists;
    _pmsbyExists = pmsbyExists;
    _kycUpdated = kycUpdated;
    _customerAccountNumber = customerAccountNumber;
    _urnCode = urnCode;
    _sizeOfACHolder = sizeOfACHolder;
    _index = index;
    _invalidAgeHolder = invalidAgeHolder;
    _holderId = holderId;
  }

  UpdateSelectedAccountHolderRequest.fromJson(dynamic json) {
    _id = json['id'];
    _applicationId = json['applicationId'];
    _accountHolderName = json['accountHolderName'];
    _cif = json['cif'];
    _dob = json['dob'];
    _gender = json['gender'];
    _pmjjbyExists = json['pmjjbyExists'];
    _pmsbyExists = json['pmsbyExists'];
    _kycUpdated = json['kycUpdated'];
    _customerAccountNumber = json['customerAccountNumber'];
    _urnCode = json['urnCode'];
    _sizeOfACHolder = json['sizeOfACHolder'];
    _index = json['index'];
    _invalidAgeHolder = json['invalidAgeHolder'];
    _holderId = json['holderId'];
  }
  dynamic _id;
  num? _applicationId;
  String? _accountHolderName;
  String? _cif;
  String? _dob;
  String? _gender;
  bool? _pmjjbyExists;
  bool? _pmsbyExists;
  bool? _kycUpdated;
  String? _customerAccountNumber;
  String? _urnCode;
  num? _sizeOfACHolder;
  String? _index;
  bool? _invalidAgeHolder;
  dynamic _holderId;
  UpdateSelectedAccountHolderRequest copyWith({
    dynamic id,
    num? applicationId,
    String? accountHolderName,
    String? cif,
    String? dob,
    String? gender,
    bool? pmjjbyExists,
    bool? pmsbyExists,
    bool? kycUpdated,
    String? customerAccountNumber,
    String? urnCode,
    num? sizeOfACHolder,
    String? index,
    bool? invalidAgeHolder,
    dynamic holderId,
  }) =>
      UpdateSelectedAccountHolderRequest(
        id: id ?? _id,
        applicationId: applicationId ?? _applicationId,
        accountHolderName: accountHolderName ?? _accountHolderName,
        cif: cif ?? _cif,
        dob: dob ?? _dob,
        gender: gender ?? _gender,
        pmjjbyExists: pmjjbyExists ?? _pmjjbyExists,
        pmsbyExists: pmsbyExists ?? _pmsbyExists,
        kycUpdated: kycUpdated ?? _kycUpdated,
        customerAccountNumber: customerAccountNumber ?? _customerAccountNumber,
        urnCode: urnCode ?? _urnCode,
        sizeOfACHolder: sizeOfACHolder ?? _sizeOfACHolder,
        index: index ?? _index,
        invalidAgeHolder: invalidAgeHolder ?? _invalidAgeHolder,
        holderId: holderId ?? _holderId,
      );
  dynamic get id => _id;
  num? get applicationId => _applicationId;
  String? get accountHolderName => _accountHolderName;
  String? get cif => _cif;
  String? get dob => _dob;
  String? get gender => _gender;
  bool? get pmjjbyExists => _pmjjbyExists;
  bool? get pmsbyExists => _pmsbyExists;
  bool? get kycUpdated => _kycUpdated;
  String? get customerAccountNumber => _customerAccountNumber;
  String? get urnCode => _urnCode;
  num? get sizeOfACHolder => _sizeOfACHolder;
  String? get index => _index;
  bool? get invalidAgeHolder => _invalidAgeHolder;
  dynamic get holderId => _holderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['applicationId'] = _applicationId;
    map['accountHolderName'] = _accountHolderName;
    map['cif'] = _cif;
    map['dob'] = _dob;
    map['gender'] = _gender;
    map['pmjjbyExists'] = _pmjjbyExists;
    map['pmsbyExists'] = _pmsbyExists;
    map['kycUpdated'] = _kycUpdated;
    map['customerAccountNumber'] = _customerAccountNumber;
    map['urnCode'] = _urnCode;
    map['sizeOfACHolder'] = _sizeOfACHolder;
    map['index'] = _index;
    map['invalidAgeHolder'] = _invalidAgeHolder;
    map['holderId'] = _holderId;
    return map;
  }
}

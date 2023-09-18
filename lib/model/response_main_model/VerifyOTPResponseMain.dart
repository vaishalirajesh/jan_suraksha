import 'dart:convert';

VerifyOtpResponseMain verifyOtpResponseMainFromJson(String str) => VerifyOtpResponseMain.fromJson(json.decode(str));
String verifyOtpResponseMainToJson(VerifyOtpResponseMain data) => json.encode(data.toJson());

class VerifyOtpResponseMain {
  VerifyOtpResponseMain({
    dynamic id,
    String? message,
    List<Data>? data,
    int? status,
    bool? flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  VerifyOtpResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
    _flag = json['flag'];
  }
  dynamic _id;
  String? _message;
  List<Data>? _data;
  int? _status;
  bool? _flag;
  VerifyOtpResponseMain copyWith({
    dynamic id,
    String? message,
    List<Data>? data,
    int? status,
    bool? flag,
  }) =>
      VerifyOtpResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );
  dynamic get id => _id;
  String? get message => _message;
  List<Data>? get data => _data;
  int? get status => _status;
  bool? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['flag'] = _flag;
    return map;
  }
}

/// id : null
/// applicationId : 101212406
/// accountHolderName : "Ankit Varshney"
/// cif : "4561234567"
/// dob : "30/05/1990"
/// gender : "M"
/// pmjjbyExists : false
/// pmsbyExists : false
/// kycUpdated : true
/// customerAccountNumber : "4523542102"
/// urnCode : "JNS-PMJJBY-2023-24-101212406-2392"
/// sizeOfACHolder : 1

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    dynamic id,
    int? applicationId,
    String? accountHolderName,
    String? cif,
    String? dob,
    String? gender,
    bool? pmjjbyExists,
    bool? pmsbyExists,
    bool? kycUpdated,
    String? customerAccountNumber,
    String? urnCode,
    int? sizeOfACHolder,
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
  }

  Data.fromJson(dynamic json) {
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
  }
  dynamic _id;
  int? _applicationId;
  String? _accountHolderName;
  String? _cif;
  String? _dob;
  String? _gender;
  bool? _pmjjbyExists;
  bool? _pmsbyExists;
  bool? _kycUpdated;
  String? _customerAccountNumber;
  String? _urnCode;
  int? _sizeOfACHolder;
  Data copyWith({
    dynamic id,
    int? applicationId,
    String? accountHolderName,
    String? cif,
    String? dob,
    String? gender,
    bool? pmjjbyExists,
    bool? pmsbyExists,
    bool? kycUpdated,
    String? customerAccountNumber,
    String? urnCode,
    int? sizeOfACHolder,
  }) =>
      Data(
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
      );
  dynamic get id => _id;
  int? get applicationId => _applicationId;
  String? get accountHolderName => _accountHolderName;
  String? get cif => _cif;
  String? get dob => _dob;
  String? get gender => _gender;
  bool? get pmjjbyExists => _pmjjbyExists;
  bool? get pmsbyExists => _pmsbyExists;
  bool? get kycUpdated => _kycUpdated;
  String? get customerAccountNumber => _customerAccountNumber;
  String? get urnCode => _urnCode;
  int? get sizeOfACHolder => _sizeOfACHolder;

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
    return map;
  }
}

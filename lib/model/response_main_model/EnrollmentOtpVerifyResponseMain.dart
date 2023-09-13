import 'dart:convert';

EnrollmentOtpVerifyResponseMain enrollmentOtpVerifyResponseMainFromJson(String str) =>
    EnrollmentOtpVerifyResponseMain.fromJson(json.decode(str));
String enrollmentOtpVerifyResponseMainToJson(EnrollmentOtpVerifyResponseMain data) => json.encode(data.toJson());

class EnrollmentOtpVerifyResponseMain {
  EnrollmentOtpVerifyResponseMain({
    dynamic id,
    String? message,
    List<Data>? data,
    num? status,
    bool? flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  EnrollmentOtpVerifyResponseMain.fromJson(dynamic json) {
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
  num? _status;
  bool? _flag;
  EnrollmentOtpVerifyResponseMain copyWith({
    dynamic id,
    String? message,
    List<Data>? data,
    num? status,
    bool? flag,
  }) =>
      EnrollmentOtpVerifyResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );
  dynamic get id => _id;
  String? get message => _message;
  List<Data>? get data => _data;
  num? get status => _status;
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

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
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
  Data copyWith({
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

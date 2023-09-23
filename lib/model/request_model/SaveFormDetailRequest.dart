import 'dart:convert';

SaveFormDetailsRequest saveFormDetailsRequestFromJson(String str) => SaveFormDetailsRequest.fromJson(json.decode(str));

String saveFormDetailsRequestToJson(SaveFormDetailsRequest data) => json.encode(data.toJson());

class SaveFormDetailsRequest {
  SaveFormDetailsRequest({
    num? applicationId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? fatherHusbandName,
    String? dob,
    String? mobileNo,
    RequestAddress? address,
    String? insuranceName,
    String? emailAddress,
    String? kycId1,
    String? kycId1number,
    dynamic kycId2,
    dynamic kycId2number,
    bool? isSameApplicantAddress,
    bool? isNomineeDeatilsSameEnroll,
    dynamic dedupErrorMsg,
    List<RequestNominee>? nominee,
    bool? isNomineeUpdate,
  }) {
    _applicationId = applicationId;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _fatherHusbandName = fatherHusbandName;
    _dob = dob;
    _mobileNo = mobileNo;
    _address = address;
    _insuranceName = insuranceName;
    _emailAddress = emailAddress;
    _kycId1 = kycId1;
    _kycId1number = kycId1number;
    _kycId2 = kycId2;
    _kycId2number = kycId2number;
    _isSameApplicantAddress = isSameApplicantAddress;
    _isNomineeDeatilsSameEnroll = isNomineeDeatilsSameEnroll;
    _dedupErrorMsg = dedupErrorMsg;
    _nominee = nominee;
    _isNomineeUpdate = isNomineeUpdate;
  }

  SaveFormDetailsRequest.fromJson(dynamic json) {
    _applicationId = json['applicationId'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _fatherHusbandName = json['fatherHusbandName'];
    _dob = json['dob'];
    _mobileNo = json['mobileNo'];
    _address = json['address'] != null ? RequestAddress.fromJson(json['address']) : null;
    _insuranceName = json['insuranceName'];
    _emailAddress = json['emailAddress'];
    _kycId1 = json['kycId1'];
    _kycId1number = json['kycId1number'];
    _kycId2 = json['kycId2'];
    _kycId2number = json['kycId2number'];
    _isSameApplicantAddress = json['isSameApplicantAddress'];
    _isNomineeDeatilsSameEnroll = json['isNomineeDeatilsSameEnroll'];
    _dedupErrorMsg = json['dedupErrorMsg'];
    if (json['nominee'] != null) {
      _nominee = [];
      json['nominee'].forEach((v) {
        _nominee?.add(RequestNominee.fromJson(v));
      });
    }
    _isNomineeUpdate = json['isNomineeUpdate'];
  }

  num? _applicationId;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _fatherHusbandName;
  String? _dob;
  String? _mobileNo;
  RequestAddress? _address;
  String? _insuranceName;
  String? _emailAddress;
  String? _kycId1;
  String? _kycId1number;
  dynamic _kycId2;
  dynamic _kycId2number;
  bool? _isSameApplicantAddress;
  bool? _isNomineeDeatilsSameEnroll;
  dynamic _dedupErrorMsg;
  List<RequestNominee>? _nominee;
  bool? _isNomineeUpdate;

  SaveFormDetailsRequest copyWith({
    num? applicationId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? fatherHusbandName,
    String? dob,
    String? mobileNo,
    RequestAddress? address,
    String? insuranceName,
    String? emailAddress,
    String? kycId1,
    String? kycId1number,
    dynamic kycId2,
    dynamic kycId2number,
    bool? isSameApplicantAddress,
    bool? isNomineeDeatilsSameEnroll,
    dynamic dedupErrorMsg,
    List<RequestNominee>? nominee,
    bool? isNomineeUpdate,
  }) =>
      SaveFormDetailsRequest(
        applicationId: applicationId ?? _applicationId,
        firstName: firstName ?? _firstName,
        middleName: middleName ?? _middleName,
        lastName: lastName ?? _lastName,
        fatherHusbandName: fatherHusbandName ?? _fatherHusbandName,
        dob: dob ?? _dob,
        mobileNo: mobileNo ?? _mobileNo,
        address: address ?? _address,
        insuranceName: insuranceName ?? _insuranceName,
        emailAddress: emailAddress ?? _emailAddress,
        kycId1: kycId1 ?? _kycId1,
        kycId1number: kycId1number ?? _kycId1number,
        kycId2: kycId2 ?? _kycId2,
        kycId2number: kycId2number ?? _kycId2number,
        isSameApplicantAddress: isSameApplicantAddress ?? _isSameApplicantAddress,
        isNomineeDeatilsSameEnroll: isNomineeDeatilsSameEnroll ?? _isNomineeDeatilsSameEnroll,
        dedupErrorMsg: dedupErrorMsg ?? _dedupErrorMsg,
        nominee: nominee ?? _nominee,
        isNomineeUpdate: isNomineeUpdate ?? _isNomineeUpdate,
      );

  num? get applicationId => _applicationId;

  String? get firstName => _firstName;

  String? get middleName => _middleName;

  String? get lastName => _lastName;

  String? get fatherHusbandName => _fatherHusbandName;

  String? get dob => _dob;

  String? get mobileNo => _mobileNo;

  RequestAddress? get address => _address;

  String? get insuranceName => _insuranceName;

  String? get emailAddress => _emailAddress;

  String? get kycId1 => _kycId1;

  String? get kycId1number => _kycId1number;

  dynamic get kycId2 => _kycId2;

  dynamic get kycId2number => _kycId2number;

  bool? get isSameApplicantAddress => _isSameApplicantAddress;

  bool? get isNomineeDeatilsSameEnroll => _isNomineeDeatilsSameEnroll;

  dynamic get dedupErrorMsg => _dedupErrorMsg;

  List<RequestNominee>? get nominee => _nominee;

  bool? get isNomineeUpdate => _isNomineeUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationId'] = _applicationId;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['fatherHusbandName'] = _fatherHusbandName;
    map['dob'] = _dob;
    map['mobileNo'] = _mobileNo;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['insuranceName'] = _insuranceName;
    map['emailAddress'] = _emailAddress;
    map['kycId1'] = _kycId1;
    map['kycId1number'] = _kycId1number;
    map['kycId2'] = _kycId2;
    map['kycId2number'] = _kycId2number;
    map['isSameApplicantAddress'] = _isSameApplicantAddress;
    map['isNomineeDeatilsSameEnroll'] = _isNomineeDeatilsSameEnroll;
    map['dedupErrorMsg'] = _dedupErrorMsg;
    if (_nominee != null) {
      map['nominee'] = _nominee?.map((v) => v.toJson()).toList();
    }
    map['isNomineeUpdate'] = _isNomineeUpdate;
    return map;
  }
}

RequestNominee nomineeFromJson(String str) => RequestNominee.fromJson(json.decode(str));

String nomineeToJson(RequestNominee data) => json.encode(data.toJson());

class RequestNominee {
  RequestNominee({
    num? id,
    String? firstName,
    dynamic middleName,
    dynamic lastName,
    String? dateOfBirth,
    dynamic mobileNumber,
    dynamic emailIdOfNominee,
    num? relationOfNomineeApplicant,
    RequestAddress? address,
    bool? isActive,
    String? nameOfGuardian,
    num? relationShipOfGuardian,
    String? addressOfGuardian,
    String? mobileNumberOfGuardian,
    String? emailIdOfGuardian,
  }) {
    _id = id;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _dateOfBirth = dateOfBirth;
    _mobileNumber = mobileNumber;
    _emailIdOfNominee = emailIdOfNominee;
    _relationOfNomineeApplicant = relationOfNomineeApplicant;
    _address = address;
    _isActive = isActive;
    _nameOfGuardian = nameOfGuardian;
    _relationShipOfGuardian = relationShipOfGuardian;
    _addressOfGuardian = addressOfGuardian;
    _mobileNumberOfGuardian = mobileNumberOfGuardian;
    _emailIdOfGuardian = emailIdOfGuardian;
  }

  set nameOfGuardian(String? value) {
    _nameOfGuardian = value;
  }

  RequestNominee.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _dateOfBirth = json['dateOfBirth'];
    _mobileNumber = json['mobileNumber'];
    _emailIdOfNominee = json['emailIdOfNominee'];
    _relationOfNomineeApplicant = json['relationOfNomineeApplicant'];
    _address = json['address'] != null ? RequestAddress.fromJson(json['address']) : null;
    _isActive = json['isActive'];
    _nameOfGuardian = json['nameOfGuardian'];
    _relationShipOfGuardian = json['relationShipOfGuardian'];
    _addressOfGuardian = json['addressOfGuardian'];
    _mobileNumberOfGuardian = json['mobileNumberOfGuardian'];
    _emailIdOfGuardian = json['emailIdOfGuardian'];
  }

  num? _id;
  String? _firstName;
  dynamic _middleName;
  dynamic _lastName;
  String? _dateOfBirth;
  dynamic _mobileNumber;
  dynamic _emailIdOfNominee;
  num? _relationOfNomineeApplicant;
  RequestAddress? _address;
  bool? _isActive;
  String? _nameOfGuardian;
  num? _relationShipOfGuardian;
  String? _addressOfGuardian;
  String? _mobileNumberOfGuardian;
  String? _emailIdOfGuardian;

  RequestNominee copyWith({
    num? id,
    String? firstName,
    dynamic middleName,
    dynamic lastName,
    String? dateOfBirth,
    dynamic mobileNumber,
    dynamic emailIdOfNominee,
    num? relationOfNomineeApplicant,
    RequestAddress? address,
    bool? isActive,
    String? nameOfGuardian,
    num? relationShipOfGuardian,
    String? addressOfGuardian,
    String? mobileNumberOfGuardian,
    String? emailIdOfGuardian,
  }) =>
      RequestNominee(
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        middleName: middleName ?? _middleName,
        lastName: lastName ?? _lastName,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        mobileNumber: mobileNumber ?? _mobileNumber,
        emailIdOfNominee: emailIdOfNominee ?? _emailIdOfNominee,
        relationOfNomineeApplicant: relationOfNomineeApplicant ?? _relationOfNomineeApplicant,
        address: address ?? _address,
        isActive: isActive ?? _isActive,
        nameOfGuardian: nameOfGuardian ?? _nameOfGuardian,
        relationShipOfGuardian: relationShipOfGuardian ?? _relationShipOfGuardian,
        addressOfGuardian: addressOfGuardian ?? _addressOfGuardian,
        mobileNumberOfGuardian: mobileNumberOfGuardian ?? _mobileNumberOfGuardian,
        emailIdOfGuardian: emailIdOfGuardian ?? _emailIdOfGuardian,
      );

  num? get id => _id;

  String? get firstName => _firstName;

  dynamic get middleName => _middleName;

  dynamic get lastName => _lastName;

  String? get dateOfBirth => _dateOfBirth;

  dynamic get mobileNumber => _mobileNumber;

  dynamic get emailIdOfNominee => _emailIdOfNominee;

  num? get relationOfNomineeApplicant => _relationOfNomineeApplicant;

  RequestAddress? get address => _address;

  bool? get isActive => _isActive;

  String? get nameOfGuardian => _nameOfGuardian;

  num? get relationShipOfGuardian => _relationShipOfGuardian;

  String? get addressOfGuardian => _addressOfGuardian;

  String? get mobileNumberOfGuardian => _mobileNumberOfGuardian;

  String? get emailIdOfGuardian => _emailIdOfGuardian;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['dateOfBirth'] = _dateOfBirth;
    map['mobileNumber'] = _mobileNumber;
    map['emailIdOfNominee'] = _emailIdOfNominee;
    map['relationOfNomineeApplicant'] = _relationOfNomineeApplicant;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['isActive'] = _isActive;
    map['nameOfGuardian'] = _nameOfGuardian;
    map['relationShipOfGuardian'] = _relationShipOfGuardian;
    map['addressOfGuardian'] = _addressOfGuardian;
    map['mobileNumberOfGuardian'] = _mobileNumberOfGuardian;
    map['emailIdOfGuardian'] = _emailIdOfGuardian;
    return map;
  }

  set relationShipOfGuardian(num? value) {
    _relationShipOfGuardian = value;
  }

  set addressOfGuardian(String? value) {
    _addressOfGuardian = value;
  }

  set mobileNumberOfGuardian(String? value) {
    _mobileNumberOfGuardian = value;
  }

  set emailIdOfGuardian(String? value) {
    _emailIdOfGuardian = value;
  }
}

RequestAddress addressFromJson(String str) => RequestAddress.fromJson(json.decode(str));

String addressToJson(RequestAddress data) => json.encode(data.toJson());

class RequestAddress {
  RequestAddress({
    num? id,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? district,
    num? pincode,
    bool? isActive,
  }) {
    _id = id;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _city = city;
    _state = state;
    _district = district;
    _pincode = pincode;
    _isActive = isActive;
  }

  RequestAddress.fromJson(dynamic json) {
    _id = json['id'];
    _addressLine1 = json['addressLine1'];
    _addressLine2 = json['addressLine2'];
    _city = json['city'];
    _state = json['state'];
    _district = json['district'];
    _pincode = json['pincode'];
    _isActive = json['isActive'];
  }

  num? _id;
  String? _addressLine1;
  String? _addressLine2;
  String? _city;
  String? _state;
  String? _district;
  num? _pincode;
  bool? _isActive;

  RequestAddress copyWith({
    num? id,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? district,
    num? pincode,
    bool? isActive,
  }) =>
      RequestAddress(
        id: id ?? _id,
        addressLine1: addressLine1 ?? _addressLine1,
        addressLine2: addressLine2 ?? _addressLine2,
        city: city ?? _city,
        state: state ?? _state,
        district: district ?? _district,
        pincode: pincode ?? _pincode,
        isActive: isActive ?? _isActive,
      );

  num? get id => _id;

  String? get addressLine1 => _addressLine1;

  String? get addressLine2 => _addressLine2;

  String? get city => _city;

  String? get state => _state;

  String? get district => _district;

  num? get pincode => _pincode;

  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['addressLine1'] = _addressLine1;
    map['addressLine2'] = _addressLine2;
    map['city'] = _city;
    map['state'] = _state;
    map['district'] = _district;
    map['pincode'] = _pincode;
    map['isActive'] = _isActive;
    return map;
  }
}

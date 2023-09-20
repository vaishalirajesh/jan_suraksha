import 'dart:convert';

/// id : null
/// message : "Succefully fetch COI details"
/// data : {"nameOfMember":"sayyed sahin shabnam","address":"room no 503 bldg no 3 c patthar nagar apna, MUMBAI, Mumbai Suburban, MAHARASHTRA, 400051","aadharNo":null,"nameOfNominee":"md tarik  ","accountNo":"789456123","dateOfComOfCover":"2023-08-09T04:56:08.165+00:00","sumAssured":"Rs. 2,00,000*","premAmtPaid":20,"mstPolicyNo":"lic-ib-56464532","logoUrl":"https://jns-images.s3.ap-south-1.amazonaws.com/Jansuraksha/lic-life-insurance.png","bankLogoUrl":"https://jns-images.s3.ap-south-1.amazonaws.com/Jansuraksha/Indian+Bank+49x49.png","nameOfInsurer":"Life Insurance Corporation of India","nameOfInsurerId":null,"urnNo":"JNS-PMJJBY-2023-24-104753270-4070","mobileNo":"8115197664","dob":"2000-06-10","nameOfBank":"Indian Bank","nameOfGuardian":null,"relationShipOfGuardian":null,"ageOfNominee":"26","coverEndDate":"31/05/2024","lienPeriod":"30 Days From The Date Of Enrolment / Re-Joining","annuRenDate":"1st June of every Year","coiStorageId":6671,"schemeId":2,"kycName":"Pan Number","kycValue":"fmskk9089a"}
/// status : 200
/// flag : true

GenerateCoiResponseMain generateCoiResponseMainFromJson(String str) =>
    GenerateCoiResponseMain.fromJson(json.decode(str));
String generateCoiResponseMainToJson(GenerateCoiResponseMain data) => json.encode(data.toJson());

class GenerateCoiResponseMain {
  GenerateCoiResponseMain({
    dynamic id,
    String? message,
    Data? data,
    int? status,
    bool? flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  GenerateCoiResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _flag = json['flag'];
  }
  dynamic _id;
  String? _message;
  Data? _data;
  int? _status;
  bool? _flag;
  GenerateCoiResponseMain copyWith({
    dynamic id,
    String? message,
    Data? data,
    int? status,
    bool? flag,
  }) =>
      GenerateCoiResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );
  dynamic get id => _id;
  String? get message => _message;
  Data? get data => _data;
  int? get status => _status;
  bool? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['flag'] = _flag;
    return map;
  }
}

/// nameOfMember : "sayyed sahin shabnam"
/// address : "room no 503 bldg no 3 c patthar nagar apna, MUMBAI, Mumbai Suburban, MAHARASHTRA, 400051"
/// aadharNo : null
/// nameOfNominee : "md tarik  "
/// accountNo : "789456123"
/// dateOfComOfCover : "2023-08-09T04:56:08.165+00:00"
/// sumAssured : "Rs. 2,00,000*"
/// premAmtPaid : 20
/// mstPolicyNo : "lic-ib-56464532"
/// logoUrl : "https://jns-images.s3.ap-south-1.amazonaws.com/Jansuraksha/lic-life-insurance.png"
/// bankLogoUrl : "https://jns-images.s3.ap-south-1.amazonaws.com/Jansuraksha/Indian+Bank+49x49.png"
/// nameOfInsurer : "Life Insurance Corporation of India"
/// nameOfInsurerId : null
/// urnNo : "JNS-PMJJBY-2023-24-104753270-4070"
/// mobileNo : "8115197664"
/// dob : "2000-06-10"
/// nameOfBank : "Indian Bank"
/// nameOfGuardian : null
/// relationShipOfGuardian : null
/// ageOfNominee : "26"
/// coverEndDate : "31/05/2024"
/// lienPeriod : "30 Days From The Date Of Enrolment / Re-Joining"
/// annuRenDate : "1st June of every Year"
/// coiStorageId : 6671
/// schemeId : 2
/// kycName : "Pan Number"
/// kycValue : "fmskk9089a"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? nameOfMember,
    String? address,
    dynamic aadharNo,
    String? nameOfNominee,
    String? accountNo,
    String? dateOfComOfCover,
    String? sumAssured,
    num? premAmtPaid,
    String? mstPolicyNo,
    String? logoUrl,
    String? bankLogoUrl,
    String? nameOfInsurer,
    dynamic nameOfInsurerId,
    String? urnNo,
    String? mobileNo,
    String? dob,
    String? nameOfBank,
    dynamic nameOfGuardian,
    dynamic relationShipOfGuardian,
    String? ageOfNominee,
    String? coverEndDate,
    String? lienPeriod,
    String? annuRenDate,
    num? coiStorageId,
    num? schemeId,
    String? kycName,
    String? kycValue,
  }) {
    _nameOfMember = nameOfMember;
    _address = address;
    _aadharNo = aadharNo;
    _nameOfNominee = nameOfNominee;
    _accountNo = accountNo;
    _dateOfComOfCover = dateOfComOfCover;
    _sumAssured = sumAssured;
    _premAmtPaid = premAmtPaid;
    _mstPolicyNo = mstPolicyNo;
    _logoUrl = logoUrl;
    _bankLogoUrl = bankLogoUrl;
    _nameOfInsurer = nameOfInsurer;
    _nameOfInsurerId = nameOfInsurerId;
    _urnNo = urnNo;
    _mobileNo = mobileNo;
    _dob = dob;
    _nameOfBank = nameOfBank;
    _nameOfGuardian = nameOfGuardian;
    _relationShipOfGuardian = relationShipOfGuardian;
    _ageOfNominee = ageOfNominee;
    _coverEndDate = coverEndDate;
    _lienPeriod = lienPeriod;
    _annuRenDate = annuRenDate;
    _coiStorageId = coiStorageId;
    _schemeId = schemeId;
    _kycName = kycName;
    _kycValue = kycValue;
  }

  Data.fromJson(dynamic json) {
    _nameOfMember = json['nameOfMember'];
    _address = json['address'];
    _aadharNo = json['aadharNo'];
    _nameOfNominee = json['nameOfNominee'];
    _accountNo = json['accountNo'];
    _dateOfComOfCover = json['dateOfComOfCover'];
    _sumAssured = json['sumAssured'];
    _premAmtPaid = json['premAmtPaid'];
    _mstPolicyNo = json['mstPolicyNo'];
    _logoUrl = json['logoUrl'];
    _bankLogoUrl = json['bankLogoUrl'];
    _nameOfInsurer = json['nameOfInsurer'];
    _nameOfInsurerId = json['nameOfInsurerId'];
    _urnNo = json['urnNo'];
    _mobileNo = json['mobileNo'];
    _dob = json['dob'];
    _nameOfBank = json['nameOfBank'];
    _nameOfGuardian = json['nameOfGuardian'];
    _relationShipOfGuardian = json['relationShipOfGuardian'];
    _ageOfNominee = json['ageOfNominee'];
    _coverEndDate = json['coverEndDate'];
    _lienPeriod = json['lienPeriod'];
    _annuRenDate = json['annuRenDate'];
    _coiStorageId = json['coiStorageId'];
    _schemeId = json['schemeId'];
    _kycName = json['kycName'];
    _kycValue = json['kycValue'];
  }
  String? _nameOfMember;
  String? _address;
  dynamic _aadharNo;
  String? _nameOfNominee;
  String? _accountNo;
  String? _dateOfComOfCover;
  String? _sumAssured;
  num? _premAmtPaid;
  String? _mstPolicyNo;
  String? _logoUrl;
  String? _bankLogoUrl;
  String? _nameOfInsurer;
  dynamic _nameOfInsurerId;
  String? _urnNo;
  String? _mobileNo;
  String? _dob;
  String? _nameOfBank;
  dynamic _nameOfGuardian;
  dynamic _relationShipOfGuardian;
  String? _ageOfNominee;
  String? _coverEndDate;
  String? _lienPeriod;
  String? _annuRenDate;
  num? _coiStorageId;
  num? _schemeId;
  String? _kycName;
  String? _kycValue;
  Data copyWith({
    String? nameOfMember,
    String? address,
    dynamic aadharNo,
    String? nameOfNominee,
    String? accountNo,
    String? dateOfComOfCover,
    String? sumAssured,
    num? premAmtPaid,
    String? mstPolicyNo,
    String? logoUrl,
    String? bankLogoUrl,
    String? nameOfInsurer,
    dynamic nameOfInsurerId,
    String? urnNo,
    String? mobileNo,
    String? dob,
    String? nameOfBank,
    dynamic nameOfGuardian,
    dynamic relationShipOfGuardian,
    String? ageOfNominee,
    String? coverEndDate,
    String? lienPeriod,
    String? annuRenDate,
    num? coiStorageId,
    num? schemeId,
    String? kycName,
    String? kycValue,
  }) =>
      Data(
        nameOfMember: nameOfMember ?? _nameOfMember,
        address: address ?? _address,
        aadharNo: aadharNo ?? _aadharNo,
        nameOfNominee: nameOfNominee ?? _nameOfNominee,
        accountNo: accountNo ?? _accountNo,
        dateOfComOfCover: dateOfComOfCover ?? _dateOfComOfCover,
        sumAssured: sumAssured ?? _sumAssured,
        premAmtPaid: premAmtPaid ?? _premAmtPaid,
        mstPolicyNo: mstPolicyNo ?? _mstPolicyNo,
        logoUrl: logoUrl ?? _logoUrl,
        bankLogoUrl: bankLogoUrl ?? _bankLogoUrl,
        nameOfInsurer: nameOfInsurer ?? _nameOfInsurer,
        nameOfInsurerId: nameOfInsurerId ?? _nameOfInsurerId,
        urnNo: urnNo ?? _urnNo,
        mobileNo: mobileNo ?? _mobileNo,
        dob: dob ?? _dob,
        nameOfBank: nameOfBank ?? _nameOfBank,
        nameOfGuardian: nameOfGuardian ?? _nameOfGuardian,
        relationShipOfGuardian: relationShipOfGuardian ?? _relationShipOfGuardian,
        ageOfNominee: ageOfNominee ?? _ageOfNominee,
        coverEndDate: coverEndDate ?? _coverEndDate,
        lienPeriod: lienPeriod ?? _lienPeriod,
        annuRenDate: annuRenDate ?? _annuRenDate,
        coiStorageId: coiStorageId ?? _coiStorageId,
        schemeId: schemeId ?? _schemeId,
        kycName: kycName ?? _kycName,
        kycValue: kycValue ?? _kycValue,
      );
  String? get nameOfMember => _nameOfMember;
  String? get address => _address;
  dynamic get aadharNo => _aadharNo;
  String? get nameOfNominee => _nameOfNominee;
  String? get accountNo => _accountNo;
  String? get dateOfComOfCover => _dateOfComOfCover;
  String? get sumAssured => _sumAssured;
  num? get premAmtPaid => _premAmtPaid;
  String? get mstPolicyNo => _mstPolicyNo;
  String? get logoUrl => _logoUrl;
  String? get bankLogoUrl => _bankLogoUrl;
  String? get nameOfInsurer => _nameOfInsurer;
  dynamic get nameOfInsurerId => _nameOfInsurerId;
  String? get urnNo => _urnNo;
  String? get mobileNo => _mobileNo;
  String? get dob => _dob;
  String? get nameOfBank => _nameOfBank;
  dynamic get nameOfGuardian => _nameOfGuardian;
  dynamic get relationShipOfGuardian => _relationShipOfGuardian;
  String? get ageOfNominee => _ageOfNominee;
  String? get coverEndDate => _coverEndDate;
  String? get lienPeriod => _lienPeriod;
  String? get annuRenDate => _annuRenDate;
  num? get coiStorageId => _coiStorageId;
  num? get schemeId => _schemeId;
  String? get kycName => _kycName;
  String? get kycValue => _kycValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nameOfMember'] = _nameOfMember;
    map['address'] = _address;
    map['aadharNo'] = _aadharNo;
    map['nameOfNominee'] = _nameOfNominee;
    map['accountNo'] = _accountNo;
    map['dateOfComOfCover'] = _dateOfComOfCover;
    map['sumAssured'] = _sumAssured;
    map['premAmtPaid'] = _premAmtPaid;
    map['mstPolicyNo'] = _mstPolicyNo;
    map['logoUrl'] = _logoUrl;
    map['bankLogoUrl'] = _bankLogoUrl;
    map['nameOfInsurer'] = _nameOfInsurer;
    map['nameOfInsurerId'] = _nameOfInsurerId;
    map['urnNo'] = _urnNo;
    map['mobileNo'] = _mobileNo;
    map['dob'] = _dob;
    map['nameOfBank'] = _nameOfBank;
    map['nameOfGuardian'] = _nameOfGuardian;
    map['relationShipOfGuardian'] = _relationShipOfGuardian;
    map['ageOfNominee'] = _ageOfNominee;
    map['coverEndDate'] = _coverEndDate;
    map['lienPeriod'] = _lienPeriod;
    map['annuRenDate'] = _annuRenDate;
    map['coiStorageId'] = _coiStorageId;
    map['schemeId'] = _schemeId;
    map['kycName'] = _kycName;
    map['kycValue'] = _kycValue;
    return map;
  }
}

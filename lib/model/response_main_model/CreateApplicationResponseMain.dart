import 'dart:convert';

CreateApplicationResponseMain createApplicationResponseMainFromJson(String str) =>
    CreateApplicationResponseMain.fromJson(json.decode(str));
String createApplicationResponseMainToJson(CreateApplicationResponseMain data) => json.encode(data.toJson());

class CreateApplicationResponseMain {
  CreateApplicationResponseMain({
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

  CreateApplicationResponseMain.fromJson(dynamic json) {
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
  CreateApplicationResponseMain copyWith({
    dynamic id,
    String? message,
    Data? data,
    int? status,
    bool? flag,
  }) =>
      CreateApplicationResponseMain(
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

/// id : 101212404
/// createdDate : "2023-08-08T12:25:22.019+00:00"
/// createdBy : 22
/// modifiedDate : null
/// modifiedBy : null
/// isActive : true
/// applicationId : null
/// urn : null
/// userId : 22
/// schemeId : null
/// orgId : 13
/// stageId : 1
/// enrollDate : null
/// applicationStatus : 1
/// claimStageId : null
/// claimDate : null
/// insurerMasterId : null
/// isPushed : null
/// accountNo : null
/// firstName : null
/// middleName : null
/// lastName : null
/// fatherHusbandName : null
/// insuranceName : null
/// scheme : null
/// dob : "2001-06-12T18:30:00.000+00:00"
/// mobileNo : null
/// emailAddress : null
/// verifyOTP : null
/// kyc : null
/// kycId1 : null
/// kycId1number : null
/// kycId2 : null
/// kycId2number : null
/// kycId3Id : null
/// kycId3 : null
/// kycId3number : null
/// isSameApplicantAddress : false
/// isNomineeDeatilsSameEnroll : null
/// address : null
/// nominee : null
/// holderId : null
/// amount : null
/// premiumAmount : null
/// coverEndDate : null
/// maxTransactionDate : null
/// branchName : null
/// ifscCode : null
/// accountHolderName : null
/// savingType : null
/// bankName : null
/// nameOfBank : null
/// nameOfInsurer : null
/// disabilityDetails : null
/// disabilityStatus : null
/// cif : null
/// gender : null
/// ckyc : null
/// ckycNumber : null
/// masterPolicyNo : null
/// insurerCode : null
/// transUtr : null
/// transTimeStamp : null
/// transAmount : null
/// transactionType : null
/// transComment : null
/// userId1 : null
/// userId2 : null
/// ruralUrbanSemi : null
/// channelId : null
/// source : null
/// consentForAutoDebit : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    num? id,
    String? createdDate,
    num? createdBy,
    dynamic modifiedDate,
    dynamic modifiedBy,
    bool? isActive,
    dynamic applicationId,
    dynamic urn,
    num? userId,
    dynamic schemeId,
    num? orgId,
    num? stageId,
    dynamic enrollDate,
    num? applicationStatus,
    dynamic claimStageId,
    dynamic claimDate,
    dynamic insurerMasterId,
    dynamic isPushed,
    dynamic accountNo,
    dynamic firstName,
    dynamic middleName,
    dynamic lastName,
    dynamic fatherHusbandName,
    dynamic insuranceName,
    dynamic scheme,
    String? dob,
    dynamic mobileNo,
    dynamic emailAddress,
    dynamic verifyOTP,
    dynamic kyc,
    dynamic kycId1,
    dynamic kycId1number,
    dynamic kycId2,
    dynamic kycId2number,
    dynamic kycId3Id,
    dynamic kycId3,
    dynamic kycId3number,
    bool? isSameApplicantAddress,
    dynamic isNomineeDeatilsSameEnroll,
    dynamic address,
    dynamic nominee,
    dynamic holderId,
    dynamic amount,
    dynamic premiumAmount,
    dynamic coverEndDate,
    dynamic maxTransactionDate,
    dynamic branchName,
    dynamic ifscCode,
    dynamic accountHolderName,
    dynamic savingType,
    dynamic bankName,
    dynamic nameOfBank,
    dynamic nameOfInsurer,
    dynamic disabilityDetails,
    dynamic disabilityStatus,
    dynamic cif,
    dynamic gender,
    dynamic ckyc,
    dynamic ckycNumber,
    dynamic masterPolicyNo,
    dynamic insurerCode,
    dynamic transUtr,
    dynamic transTimeStamp,
    dynamic transAmount,
    dynamic transactionType,
    dynamic transComment,
    dynamic userId1,
    dynamic userId2,
    dynamic ruralUrbanSemi,
    dynamic channelId,
    dynamic source,
    dynamic consentForAutoDebit,
  }) {
    _id = id;
    _createdDate = createdDate;
    _createdBy = createdBy;
    _modifiedDate = modifiedDate;
    _modifiedBy = modifiedBy;
    _isActive = isActive;
    _applicationId = applicationId;
    _urn = urn;
    _userId = userId;
    _schemeId = schemeId;
    _orgId = orgId;
    _stageId = stageId;
    _enrollDate = enrollDate;
    _applicationStatus = applicationStatus;
    _claimStageId = claimStageId;
    _claimDate = claimDate;
    _insurerMasterId = insurerMasterId;
    _isPushed = isPushed;
    _accountNo = accountNo;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _fatherHusbandName = fatherHusbandName;
    _insuranceName = insuranceName;
    _scheme = scheme;
    _dob = dob;
    _mobileNo = mobileNo;
    _emailAddress = emailAddress;
    _verifyOTP = verifyOTP;
    _kyc = kyc;
    _kycId1 = kycId1;
    _kycId1number = kycId1number;
    _kycId2 = kycId2;
    _kycId2number = kycId2number;
    _kycId3Id = kycId3Id;
    _kycId3 = kycId3;
    _kycId3number = kycId3number;
    _isSameApplicantAddress = isSameApplicantAddress;
    _isNomineeDeatilsSameEnroll = isNomineeDeatilsSameEnroll;
    _address = address;
    _nominee = nominee;
    _holderId = holderId;
    _amount = amount;
    _premiumAmount = premiumAmount;
    _coverEndDate = coverEndDate;
    _maxTransactionDate = maxTransactionDate;
    _branchName = branchName;
    _ifscCode = ifscCode;
    _accountHolderName = accountHolderName;
    _savingType = savingType;
    _bankName = bankName;
    _nameOfBank = nameOfBank;
    _nameOfInsurer = nameOfInsurer;
    _disabilityDetails = disabilityDetails;
    _disabilityStatus = disabilityStatus;
    _cif = cif;
    _gender = gender;
    _ckyc = ckyc;
    _ckycNumber = ckycNumber;
    _masterPolicyNo = masterPolicyNo;
    _insurerCode = insurerCode;
    _transUtr = transUtr;
    _transTimeStamp = transTimeStamp;
    _transAmount = transAmount;
    _transactionType = transactionType;
    _transComment = transComment;
    _userId1 = userId1;
    _userId2 = userId2;
    _ruralUrbanSemi = ruralUrbanSemi;
    _channelId = channelId;
    _source = source;
    _consentForAutoDebit = consentForAutoDebit;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createdDate = json['createdDate'];
    _createdBy = json['createdBy'];
    _modifiedDate = json['modifiedDate'];
    _modifiedBy = json['modifiedBy'];
    _isActive = json['isActive'];
    _applicationId = json['applicationId'];
    _urn = json['urn'];
    _userId = json['userId'];
    _schemeId = json['schemeId'];
    _orgId = json['orgId'];
    _stageId = json['stageId'];
    _enrollDate = json['enrollDate'];
    _applicationStatus = json['applicationStatus'];
    _claimStageId = json['claimStageId'];
    _claimDate = json['claimDate'];
    _insurerMasterId = json['insurerMasterId'];
    _isPushed = json['isPushed'];
    _accountNo = json['accountNo'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _fatherHusbandName = json['fatherHusbandName'];
    _insuranceName = json['insuranceName'];
    _scheme = json['scheme'];
    _dob = json['dob'];
    _mobileNo = json['mobileNo'];
    _emailAddress = json['emailAddress'];
    _verifyOTP = json['verifyOTP'];
    _kyc = json['kyc'];
    _kycId1 = json['kycId1'];
    _kycId1number = json['kycId1number'];
    _kycId2 = json['kycId2'];
    _kycId2number = json['kycId2number'];
    _kycId3Id = json['kycId3Id'];
    _kycId3 = json['kycId3'];
    _kycId3number = json['kycId3number'];
    _isSameApplicantAddress = json['isSameApplicantAddress'];
    _isNomineeDeatilsSameEnroll = json['isNomineeDeatilsSameEnroll'];
    _address = json['address'];
    _nominee = json['nominee'];
    _holderId = json['holderId'];
    _amount = json['amount'];
    _premiumAmount = json['premiumAmount'];
    _coverEndDate = json['coverEndDate'];
    _maxTransactionDate = json['maxTransactionDate'];
    _branchName = json['branchName'];
    _ifscCode = json['ifscCode'];
    _accountHolderName = json['accountHolderName'];
    _savingType = json['savingType'];
    _bankName = json['bankName'];
    _nameOfBank = json['nameOfBank'];
    _nameOfInsurer = json['nameOfInsurer'];
    _disabilityDetails = json['disabilityDetails'];
    _disabilityStatus = json['disabilityStatus'];
    _cif = json['cif'];
    _gender = json['gender'];
    _ckyc = json['ckyc'];
    _ckycNumber = json['ckycNumber'];
    _masterPolicyNo = json['masterPolicyNo'];
    _insurerCode = json['insurerCode'];
    _transUtr = json['transUtr'];
    _transTimeStamp = json['transTimeStamp'];
    _transAmount = json['transAmount'];
    _transactionType = json['transactionType'];
    _transComment = json['transComment'];
    _userId1 = json['userId1'];
    _userId2 = json['userId2'];
    _ruralUrbanSemi = json['ruralUrbanSemi'];
    _channelId = json['channelId'];
    _source = json['source'];
    _consentForAutoDebit = json['consentForAutoDebit'];
  }
  num? _id;
  String? _createdDate;
  num? _createdBy;
  dynamic _modifiedDate;
  dynamic _modifiedBy;
  bool? _isActive;
  dynamic _applicationId;
  dynamic _urn;
  num? _userId;
  dynamic _schemeId;
  num? _orgId;
  num? _stageId;
  dynamic _enrollDate;
  num? _applicationStatus;
  dynamic _claimStageId;
  dynamic _claimDate;
  dynamic _insurerMasterId;
  dynamic _isPushed;
  dynamic _accountNo;
  dynamic _firstName;
  dynamic _middleName;
  dynamic _lastName;
  dynamic _fatherHusbandName;
  dynamic _insuranceName;
  dynamic _scheme;
  String? _dob;
  dynamic _mobileNo;
  dynamic _emailAddress;
  dynamic _verifyOTP;
  dynamic _kyc;
  dynamic _kycId1;
  dynamic _kycId1number;
  dynamic _kycId2;
  dynamic _kycId2number;
  dynamic _kycId3Id;
  dynamic _kycId3;
  dynamic _kycId3number;
  bool? _isSameApplicantAddress;
  dynamic _isNomineeDeatilsSameEnroll;
  dynamic _address;
  dynamic _nominee;
  dynamic _holderId;
  dynamic _amount;
  dynamic _premiumAmount;
  dynamic _coverEndDate;
  dynamic _maxTransactionDate;
  dynamic _branchName;
  dynamic _ifscCode;
  dynamic _accountHolderName;
  dynamic _savingType;
  dynamic _bankName;
  dynamic _nameOfBank;
  dynamic _nameOfInsurer;
  dynamic _disabilityDetails;
  dynamic _disabilityStatus;
  dynamic _cif;
  dynamic _gender;
  dynamic _ckyc;
  dynamic _ckycNumber;
  dynamic _masterPolicyNo;
  dynamic _insurerCode;
  dynamic _transUtr;
  dynamic _transTimeStamp;
  dynamic _transAmount;
  dynamic _transactionType;
  dynamic _transComment;
  dynamic _userId1;
  dynamic _userId2;
  dynamic _ruralUrbanSemi;
  dynamic _channelId;
  dynamic _source;
  dynamic _consentForAutoDebit;
  Data copyWith({
    num? id,
    String? createdDate,
    num? createdBy,
    dynamic modifiedDate,
    dynamic modifiedBy,
    bool? isActive,
    dynamic applicationId,
    dynamic urn,
    num? userId,
    dynamic schemeId,
    num? orgId,
    num? stageId,
    dynamic enrollDate,
    num? applicationStatus,
    dynamic claimStageId,
    dynamic claimDate,
    dynamic insurerMasterId,
    dynamic isPushed,
    dynamic accountNo,
    dynamic firstName,
    dynamic middleName,
    dynamic lastName,
    dynamic fatherHusbandName,
    dynamic insuranceName,
    dynamic scheme,
    String? dob,
    dynamic mobileNo,
    dynamic emailAddress,
    dynamic verifyOTP,
    dynamic kyc,
    dynamic kycId1,
    dynamic kycId1number,
    dynamic kycId2,
    dynamic kycId2number,
    dynamic kycId3Id,
    dynamic kycId3,
    dynamic kycId3number,
    bool? isSameApplicantAddress,
    dynamic isNomineeDeatilsSameEnroll,
    dynamic address,
    dynamic nominee,
    dynamic holderId,
    dynamic amount,
    dynamic premiumAmount,
    dynamic coverEndDate,
    dynamic maxTransactionDate,
    dynamic branchName,
    dynamic ifscCode,
    dynamic accountHolderName,
    dynamic savingType,
    dynamic bankName,
    dynamic nameOfBank,
    dynamic nameOfInsurer,
    dynamic disabilityDetails,
    dynamic disabilityStatus,
    dynamic cif,
    dynamic gender,
    dynamic ckyc,
    dynamic ckycNumber,
    dynamic masterPolicyNo,
    dynamic insurerCode,
    dynamic transUtr,
    dynamic transTimeStamp,
    dynamic transAmount,
    dynamic transactionType,
    dynamic transComment,
    dynamic userId1,
    dynamic userId2,
    dynamic ruralUrbanSemi,
    dynamic channelId,
    dynamic source,
    dynamic consentForAutoDebit,
  }) =>
      Data(
        id: id ?? _id,
        createdDate: createdDate ?? _createdDate,
        createdBy: createdBy ?? _createdBy,
        modifiedDate: modifiedDate ?? _modifiedDate,
        modifiedBy: modifiedBy ?? _modifiedBy,
        isActive: isActive ?? _isActive,
        applicationId: applicationId ?? _applicationId,
        urn: urn ?? _urn,
        userId: userId ?? _userId,
        schemeId: schemeId ?? _schemeId,
        orgId: orgId ?? _orgId,
        stageId: stageId ?? _stageId,
        enrollDate: enrollDate ?? _enrollDate,
        applicationStatus: applicationStatus ?? _applicationStatus,
        claimStageId: claimStageId ?? _claimStageId,
        claimDate: claimDate ?? _claimDate,
        insurerMasterId: insurerMasterId ?? _insurerMasterId,
        isPushed: isPushed ?? _isPushed,
        accountNo: accountNo ?? _accountNo,
        firstName: firstName ?? _firstName,
        middleName: middleName ?? _middleName,
        lastName: lastName ?? _lastName,
        fatherHusbandName: fatherHusbandName ?? _fatherHusbandName,
        insuranceName: insuranceName ?? _insuranceName,
        scheme: scheme ?? _scheme,
        dob: dob ?? _dob,
        mobileNo: mobileNo ?? _mobileNo,
        emailAddress: emailAddress ?? _emailAddress,
        verifyOTP: verifyOTP ?? _verifyOTP,
        kyc: kyc ?? _kyc,
        kycId1: kycId1 ?? _kycId1,
        kycId1number: kycId1number ?? _kycId1number,
        kycId2: kycId2 ?? _kycId2,
        kycId2number: kycId2number ?? _kycId2number,
        kycId3Id: kycId3Id ?? _kycId3Id,
        kycId3: kycId3 ?? _kycId3,
        kycId3number: kycId3number ?? _kycId3number,
        isSameApplicantAddress: isSameApplicantAddress ?? _isSameApplicantAddress,
        isNomineeDeatilsSameEnroll: isNomineeDeatilsSameEnroll ?? _isNomineeDeatilsSameEnroll,
        address: address ?? _address,
        nominee: nominee ?? _nominee,
        holderId: holderId ?? _holderId,
        amount: amount ?? _amount,
        premiumAmount: premiumAmount ?? _premiumAmount,
        coverEndDate: coverEndDate ?? _coverEndDate,
        maxTransactionDate: maxTransactionDate ?? _maxTransactionDate,
        branchName: branchName ?? _branchName,
        ifscCode: ifscCode ?? _ifscCode,
        accountHolderName: accountHolderName ?? _accountHolderName,
        savingType: savingType ?? _savingType,
        bankName: bankName ?? _bankName,
        nameOfBank: nameOfBank ?? _nameOfBank,
        nameOfInsurer: nameOfInsurer ?? _nameOfInsurer,
        disabilityDetails: disabilityDetails ?? _disabilityDetails,
        disabilityStatus: disabilityStatus ?? _disabilityStatus,
        cif: cif ?? _cif,
        gender: gender ?? _gender,
        ckyc: ckyc ?? _ckyc,
        ckycNumber: ckycNumber ?? _ckycNumber,
        masterPolicyNo: masterPolicyNo ?? _masterPolicyNo,
        insurerCode: insurerCode ?? _insurerCode,
        transUtr: transUtr ?? _transUtr,
        transTimeStamp: transTimeStamp ?? _transTimeStamp,
        transAmount: transAmount ?? _transAmount,
        transactionType: transactionType ?? _transactionType,
        transComment: transComment ?? _transComment,
        userId1: userId1 ?? _userId1,
        userId2: userId2 ?? _userId2,
        ruralUrbanSemi: ruralUrbanSemi ?? _ruralUrbanSemi,
        channelId: channelId ?? _channelId,
        source: source ?? _source,
        consentForAutoDebit: consentForAutoDebit ?? _consentForAutoDebit,
      );
  num? get id => _id;
  String? get createdDate => _createdDate;
  num? get createdBy => _createdBy;
  dynamic get modifiedDate => _modifiedDate;
  dynamic get modifiedBy => _modifiedBy;
  bool? get isActive => _isActive;
  dynamic get applicationId => _applicationId;
  dynamic get urn => _urn;
  num? get userId => _userId;
  dynamic get schemeId => _schemeId;
  num? get orgId => _orgId;
  num? get stageId => _stageId;
  dynamic get enrollDate => _enrollDate;
  num? get applicationStatus => _applicationStatus;
  dynamic get claimStageId => _claimStageId;
  dynamic get claimDate => _claimDate;
  dynamic get insurerMasterId => _insurerMasterId;
  dynamic get isPushed => _isPushed;
  dynamic get accountNo => _accountNo;
  dynamic get firstName => _firstName;
  dynamic get middleName => _middleName;
  dynamic get lastName => _lastName;
  dynamic get fatherHusbandName => _fatherHusbandName;
  dynamic get insuranceName => _insuranceName;
  dynamic get scheme => _scheme;
  String? get dob => _dob;
  dynamic get mobileNo => _mobileNo;
  dynamic get emailAddress => _emailAddress;
  dynamic get verifyOTP => _verifyOTP;
  dynamic get kyc => _kyc;
  dynamic get kycId1 => _kycId1;
  dynamic get kycId1number => _kycId1number;
  dynamic get kycId2 => _kycId2;
  dynamic get kycId2number => _kycId2number;
  dynamic get kycId3Id => _kycId3Id;
  dynamic get kycId3 => _kycId3;
  dynamic get kycId3number => _kycId3number;
  bool? get isSameApplicantAddress => _isSameApplicantAddress;
  dynamic get isNomineeDeatilsSameEnroll => _isNomineeDeatilsSameEnroll;
  dynamic get address => _address;
  dynamic get nominee => _nominee;
  dynamic get holderId => _holderId;
  dynamic get amount => _amount;
  dynamic get premiumAmount => _premiumAmount;
  dynamic get coverEndDate => _coverEndDate;
  dynamic get maxTransactionDate => _maxTransactionDate;
  dynamic get branchName => _branchName;
  dynamic get ifscCode => _ifscCode;
  dynamic get accountHolderName => _accountHolderName;
  dynamic get savingType => _savingType;
  dynamic get bankName => _bankName;
  dynamic get nameOfBank => _nameOfBank;
  dynamic get nameOfInsurer => _nameOfInsurer;
  dynamic get disabilityDetails => _disabilityDetails;
  dynamic get disabilityStatus => _disabilityStatus;
  dynamic get cif => _cif;
  dynamic get gender => _gender;
  dynamic get ckyc => _ckyc;
  dynamic get ckycNumber => _ckycNumber;
  dynamic get masterPolicyNo => _masterPolicyNo;
  dynamic get insurerCode => _insurerCode;
  dynamic get transUtr => _transUtr;
  dynamic get transTimeStamp => _transTimeStamp;
  dynamic get transAmount => _transAmount;
  dynamic get transactionType => _transactionType;
  dynamic get transComment => _transComment;
  dynamic get userId1 => _userId1;
  dynamic get userId2 => _userId2;
  dynamic get ruralUrbanSemi => _ruralUrbanSemi;
  dynamic get channelId => _channelId;
  dynamic get source => _source;
  dynamic get consentForAutoDebit => _consentForAutoDebit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdDate'] = _createdDate;
    map['createdBy'] = _createdBy;
    map['modifiedDate'] = _modifiedDate;
    map['modifiedBy'] = _modifiedBy;
    map['isActive'] = _isActive;
    map['applicationId'] = _applicationId;
    map['urn'] = _urn;
    map['userId'] = _userId;
    map['schemeId'] = _schemeId;
    map['orgId'] = _orgId;
    map['stageId'] = _stageId;
    map['enrollDate'] = _enrollDate;
    map['applicationStatus'] = _applicationStatus;
    map['claimStageId'] = _claimStageId;
    map['claimDate'] = _claimDate;
    map['insurerMasterId'] = _insurerMasterId;
    map['isPushed'] = _isPushed;
    map['accountNo'] = _accountNo;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['fatherHusbandName'] = _fatherHusbandName;
    map['insuranceName'] = _insuranceName;
    map['scheme'] = _scheme;
    map['dob'] = _dob;
    map['mobileNo'] = _mobileNo;
    map['emailAddress'] = _emailAddress;
    map['verifyOTP'] = _verifyOTP;
    map['kyc'] = _kyc;
    map['kycId1'] = _kycId1;
    map['kycId1number'] = _kycId1number;
    map['kycId2'] = _kycId2;
    map['kycId2number'] = _kycId2number;
    map['kycId3Id'] = _kycId3Id;
    map['kycId3'] = _kycId3;
    map['kycId3number'] = _kycId3number;
    map['isSameApplicantAddress'] = _isSameApplicantAddress;
    map['isNomineeDeatilsSameEnroll'] = _isNomineeDeatilsSameEnroll;
    map['address'] = _address;
    map['nominee'] = _nominee;
    map['holderId'] = _holderId;
    map['amount'] = _amount;
    map['premiumAmount'] = _premiumAmount;
    map['coverEndDate'] = _coverEndDate;
    map['maxTransactionDate'] = _maxTransactionDate;
    map['branchName'] = _branchName;
    map['ifscCode'] = _ifscCode;
    map['accountHolderName'] = _accountHolderName;
    map['savingType'] = _savingType;
    map['bankName'] = _bankName;
    map['nameOfBank'] = _nameOfBank;
    map['nameOfInsurer'] = _nameOfInsurer;
    map['disabilityDetails'] = _disabilityDetails;
    map['disabilityStatus'] = _disabilityStatus;
    map['cif'] = _cif;
    map['gender'] = _gender;
    map['ckyc'] = _ckyc;
    map['ckycNumber'] = _ckycNumber;
    map['masterPolicyNo'] = _masterPolicyNo;
    map['insurerCode'] = _insurerCode;
    map['transUtr'] = _transUtr;
    map['transTimeStamp'] = _transTimeStamp;
    map['transAmount'] = _transAmount;
    map['transactionType'] = _transactionType;
    map['transComment'] = _transComment;
    map['userId1'] = _userId1;
    map['userId2'] = _userId2;
    map['ruralUrbanSemi'] = _ruralUrbanSemi;
    map['channelId'] = _channelId;
    map['source'] = _source;
    map['consentForAutoDebit'] = _consentForAutoDebit;
    return map;
  }
}

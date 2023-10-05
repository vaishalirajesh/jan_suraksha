import 'dart:convert';

/// id : null
/// message : "Successfully get Account Holder Details!!"
/// data : {"id":104753270,"createdDate":"2023-08-09T04:44:58.648+00:00","createdBy":22,"modifiedDate":"2023-08-09T04:44:58.648+00:00","modifiedBy":22,"isActive":true,"applicationId":null,"urn":"JNS-PMJJBY-2023-24-104753270-4070","userId":22,"schemeId":null,"orgId":13,"stageId":4,"enrollDate":null,"applicationStatus":1,"claimStageId":null,"claimDate":null,"insurerMasterId":null,"isPushed":null,"accountNo":"789456123","firstName":"sayyed","middleName":"sahin","lastName":"shabnam","fatherHusbandName":"nimesh","insuranceName":"Life Insurance Corporation of India","scheme":"PMJJBY","dob":"2000-06-09T18:30:00.000+00:00","mobileNo":"8115197664","emailAddress":"nimesh@opl.com","verifyOTP":null,"kyc":"Yes","kycId1":"pan","kycId1number":"fmskk9089a","kycId2":null,"kycId2number":null,"kycId3Id":null,"kycId3":null,"kycId3number":null,"isSameApplicantAddress":null,"isNomineeDeatilsSameEnroll":null,"address":{"id":314025197,"createdDate":null,"createdBy":null,"modifiedDate":null,"modifiedBy":null,"isActive":null,"addressLine1":"room no 503 bldg no 3 c patthar nagar apna","addressLine2":null,"district":"Mumbai Suburban","districtLgdCode":null,"city":"MUMBAI","cityLgdCode":null,"cityId":41242312,"state":"MAHARASHTRA","stateLgdCode":null,"stateId":null,"pincode":400051,"isOtherClaimant":null},"nominee":[{"id":209365237,"createdDate":"2023-08-09T04:44:58.029+00:00","createdBy":22,"modifiedDate":null,"modifiedBy":null,"isActive":true,"applicationId":null,"addressId":null,"firstName":"md tarik","middleName":null,"lastName":null,"correctNomineeFirstName":null,"correctNomineeMiddleName":null,"correctNomineeLastName":null,"dateOfBirth":"1997-05-20T18:30:00.000+00:00","pan":null,"panNumber":null,"aadhaar":null,"aadhaarNumber":null,"mobileNumber":null,"emailIdOfNominee":null,"relationOfNomineeApplicant":13,"relationOfNomineeApplicantStr":"Husband","age":26,"nameOfGuardian":null,"addressOfGuardian":null,"relationShipOfGuardian":null,"relationShipOfGuardianStr":null,"mobileNumberOfGuardian":null,"emailIdOfGuardian":null,"claimId":null,"address":{"id":314037364,"createdDate":null,"createdBy":null,"modifiedDate":null,"modifiedBy":null,"isActive":null,"addressLine1":"ahmedabad","addressLine2":"majhagawaan amethi","district":"UP","districtLgdCode":null,"city":"AMETHI JADID, UP","cityLgdCode":null,"cityId":null,"state":"UTTAR PRADESH","stateLgdCode":null,"stateId":null,"pincode":227805,"isOtherClaimant":null}}],"holderId":null,"amount":null,"premiumAmount":436,"coverEndDate":null,"maxTransactionDate":"2023-05-31T18:30:00.000+00:00","branchName":"Ahmedabad Main","ifscCode":"IDIB000D089","accountHolderName":"ankit varshney","savingType":null,"bankName":"Indian Bank","nameOfBank":"Indian Bank","nameOfInsurer":null,"disabilityDetails":null,"disabilityStatus":null,"cif":"30228825114","gender":null,"ckyc":null,"ckycNumber":null,"masterPolicyNo":null,"insurerCode":null,"transUtr":null,"transTimeStamp":null,"transAmount":null,"transactionType":null,"transComment":null,"userId1":null,"userId2":null,"ruralUrbanSemi":null,"channelId":null,"source":null,"consentForAutoDebit":null}
/// status : 200
/// flag : true

GetApplicationFormDetailsResponseMain getApplicationFormDetailsResponseMainFromJson(String str) =>
    GetApplicationFormDetailsResponseMain.fromJson(json.decode(str));

String getApplicationFormDetailsResponseMainToJson(GetApplicationFormDetailsResponseMain data) =>
    json.encode(data.toJson());

class GetApplicationFormDetailsResponseMain {
  GetApplicationFormDetailsResponseMain({
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

  set data(Data? value) {
    _data = value;
  }

  GetApplicationFormDetailsResponseMain.fromJson(dynamic json) {
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

  GetApplicationFormDetailsResponseMain copyWith({
    dynamic id,
    String? message,
    Data? data,
    int? status,
    bool? flag,
  }) =>
      GetApplicationFormDetailsResponseMain(
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

/// id : 104753270
/// createdDate : "2023-08-09T04:44:58.648+00:00"
/// createdBy : 22
/// modifiedDate : "2023-08-09T04:44:58.648+00:00"
/// modifiedBy : 22
/// isActive : true
/// applicationId : null
/// urn : "JNS-PMJJBY-2023-24-104753270-4070"
/// userId : 22
/// schemeId : null
/// orgId : 13
/// stageId : 4
/// enrollDate : null
/// applicationStatus : 1
/// claimStageId : null
/// claimDate : null
/// insurerMasterId : null
/// isPushed : null
/// accountNo : "789456123"
/// firstName : "sayyed"
/// middleName : "sahin"
/// lastName : "shabnam"
/// fatherHusbandName : "nimesh"
/// insuranceName : "Life Insurance Corporation of India"
/// scheme : "PMJJBY"
/// dob : "2000-06-09T18:30:00.000+00:00"
/// mobileNo : "8115197664"
/// emailAddress : "nimesh@opl.com"
/// verifyOTP : null
/// kyc : "Yes"
/// kycId1 : "pan"
/// kycId1number : "fmskk9089a"
/// kycId2 : null
/// kycId2number : null
/// kycId3Id : null
/// kycId3 : null
/// kycId3number : null
/// isSameApplicantAddress : null
/// isNomineeDeatilsSameEnroll : null
/// address : {"id":314025197,"createdDate":null,"createdBy":null,"modifiedDate":null,"modifiedBy":null,"isActive":null,"addressLine1":"room no 503 bldg no 3 c patthar nagar apna","addressLine2":null,"district":"Mumbai Suburban","districtLgdCode":null,"city":"MUMBAI","cityLgdCode":null,"cityId":41242312,"state":"MAHARASHTRA","stateLgdCode":null,"stateId":null,"pincode":400051,"isOtherClaimant":null}
/// nominee : [{"id":209365237,"createdDate":"2023-08-09T04:44:58.029+00:00","createdBy":22,"modifiedDate":null,"modifiedBy":null,"isActive":true,"applicationId":null,"addressId":null,"firstName":"md tarik","middleName":null,"lastName":null,"correctNomineeFirstName":null,"correctNomineeMiddleName":null,"correctNomineeLastName":null,"dateOfBirth":"1997-05-20T18:30:00.000+00:00","pan":null,"panNumber":null,"aadhaar":null,"aadhaarNumber":null,"mobileNumber":null,"emailIdOfNominee":null,"relationOfNomineeApplicant":13,"relationOfNomineeApplicantStr":"Husband","age":26,"nameOfGuardian":null,"addressOfGuardian":null,"relationShipOfGuardian":null,"relationShipOfGuardianStr":null,"mobileNumberOfGuardian":null,"emailIdOfGuardian":null,"claimId":null,"address":{"id":314037364,"createdDate":null,"createdBy":null,"modifiedDate":null,"modifiedBy":null,"isActive":null,"addressLine1":"ahmedabad","addressLine2":"majhagawaan amethi","district":"UP","districtLgdCode":null,"city":"AMETHI JADID, UP","cityLgdCode":null,"cityId":null,"state":"UTTAR PRADESH","stateLgdCode":null,"stateId":null,"pincode":227805,"isOtherClaimant":null}}]
/// holderId : null
/// amount : null
/// premiumAmount : 436
/// coverEndDate : null
/// maxTransactionDate : "2023-05-31T18:30:00.000+00:00"
/// branchName : "Ahmedabad Main"
/// ifscCode : "IDIB000D089"
/// accountHolderName : "ankit varshney"
/// savingType : null
/// bankName : "Indian Bank"
/// nameOfBank : "Indian Bank"
/// nameOfInsurer : null
/// disabilityDetails : null
/// disabilityStatus : null
/// cif : "30228825114"
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
    String? modifiedDate,
    num? modifiedBy,
    bool? isActive,
    dynamic applicationId,
    String? urn,
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
    String? accountNo,
    String? firstName,
    String? middleName,
    String? lastName,
    String? fatherHusbandName,
    String? insuranceName,
    String? scheme,
    String? dob,
    String? mobileNo,
    String? emailAddress,
    dynamic verifyOTP,
    String? kyc,
    String? kycId1,
    String? kycId1number,
    dynamic kycId2,
    dynamic kycId2number,
    dynamic kycId3Id,
    dynamic kycId3,
    dynamic kycId3number,
    dynamic isSameApplicantAddress,
    dynamic isNomineeDeatilsSameEnroll,
    Address? address,
    List<Nominee>? nominee,
    dynamic holderId,
    dynamic amount,
    num? premiumAmount,
    dynamic coverEndDate,
    String? maxTransactionDate,
    String? branchName,
    String? ifscCode,
    String? accountHolderName,
    dynamic savingType,
    String? bankName,
    String? nameOfBank,
    dynamic nameOfInsurer,
    dynamic disabilityDetails,
    dynamic disabilityStatus,
    String? cif,
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

  set isSameApplicantAddress(dynamic value) {
    _isSameApplicantAddress = value;
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
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['nominee'] != null) {
      _nominee = [];
      json['nominee'].forEach((v) {
        _nominee?.add(Nominee.fromJson(v));
      });
    }
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
  String? _modifiedDate;
  num? _modifiedBy;
  bool? _isActive;
  dynamic _applicationId;
  String? _urn;
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
  String? _accountNo;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _fatherHusbandName;
  String? _insuranceName;
  String? _scheme;
  String? _dob;
  String? _mobileNo;
  String? _emailAddress;
  dynamic _verifyOTP;
  String? _kyc;
  String? _kycId1;
  String? _kycId1number;
  dynamic _kycId2;
  dynamic _kycId2number;
  dynamic _kycId3Id;
  dynamic _kycId3;
  dynamic _kycId3number;
  dynamic _isSameApplicantAddress;
  dynamic _isNomineeDeatilsSameEnroll;
  Address? _address;
  List<Nominee>? _nominee;
  dynamic _holderId;
  dynamic _amount;
  num? _premiumAmount;
  dynamic _coverEndDate;
  String? _maxTransactionDate;
  String? _branchName;
  String? _ifscCode;
  String? _accountHolderName;
  dynamic _savingType;
  String? _bankName;
  String? _nameOfBank;
  dynamic _nameOfInsurer;
  dynamic _disabilityDetails;
  dynamic _disabilityStatus;
  String? _cif;
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
    String? modifiedDate,
    num? modifiedBy,
    bool? isActive,
    dynamic applicationId,
    String? urn,
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
    String? accountNo,
    String? firstName,
    String? middleName,
    String? lastName,
    String? fatherHusbandName,
    String? insuranceName,
    String? scheme,
    String? dob,
    String? mobileNo,
    String? emailAddress,
    dynamic verifyOTP,
    String? kyc,
    String? kycId1,
    String? kycId1number,
    dynamic kycId2,
    dynamic kycId2number,
    dynamic kycId3Id,
    dynamic kycId3,
    dynamic kycId3number,
    dynamic isSameApplicantAddress,
    dynamic isNomineeDeatilsSameEnroll,
    Address? address,
    List<Nominee>? nominee,
    dynamic holderId,
    dynamic amount,
    num? premiumAmount,
    dynamic coverEndDate,
    String? maxTransactionDate,
    String? branchName,
    String? ifscCode,
    String? accountHolderName,
    dynamic savingType,
    String? bankName,
    String? nameOfBank,
    dynamic nameOfInsurer,
    dynamic disabilityDetails,
    dynamic disabilityStatus,
    String? cif,
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

  set nominee(List<Nominee>? value) {
    _nominee = value;
  }

  num? get id => _id;

  String? get createdDate => _createdDate;

  num? get createdBy => _createdBy;

  String? get modifiedDate => _modifiedDate;

  num? get modifiedBy => _modifiedBy;

  bool? get isActive => _isActive;

  dynamic get applicationId => _applicationId;

  String? get urn => _urn;

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

  String? get accountNo => _accountNo;

  String? get firstName => _firstName;

  String? get middleName => _middleName;

  String? get lastName => _lastName;

  String? get fatherHusbandName => _fatherHusbandName;

  String? get insuranceName => _insuranceName;

  String? get scheme => _scheme;

  String? get dob => _dob;

  String? get mobileNo => _mobileNo;

  String? get emailAddress => _emailAddress;

  dynamic get verifyOTP => _verifyOTP;

  String? get kyc => _kyc;

  String? get kycId1 => _kycId1;

  String? get kycId1number => _kycId1number;

  dynamic get kycId2 => _kycId2;

  dynamic get kycId2number => _kycId2number;

  dynamic get kycId3Id => _kycId3Id;

  dynamic get kycId3 => _kycId3;

  dynamic get kycId3number => _kycId3number;

  dynamic get isSameApplicantAddress => _isSameApplicantAddress;

  dynamic get isNomineeDeatilsSameEnroll => _isNomineeDeatilsSameEnroll;

  Address? get address => _address;

  List<Nominee>? get nominee => _nominee;

  dynamic get holderId => _holderId;

  dynamic get amount => _amount;

  num? get premiumAmount => _premiumAmount;

  dynamic get coverEndDate => _coverEndDate;

  String? get maxTransactionDate => _maxTransactionDate;

  String? get branchName => _branchName;

  String? get ifscCode => _ifscCode;

  String? get accountHolderName => _accountHolderName;

  dynamic get savingType => _savingType;

  String? get bankName => _bankName;

  String? get nameOfBank => _nameOfBank;

  dynamic get nameOfInsurer => _nameOfInsurer;

  dynamic get disabilityDetails => _disabilityDetails;

  dynamic get disabilityStatus => _disabilityStatus;

  String? get cif => _cif;

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
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_nominee != null) {
      map['nominee'] = _nominee?.map((v) => v.toJson()).toList();
    }
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

/// id : 209365237
/// createdDate : "2023-08-09T04:44:58.029+00:00"
/// createdBy : 22
/// modifiedDate : null
/// modifiedBy : null
/// isActive : true
/// applicationId : null
/// addressId : null
/// firstName : "md tarik"
/// middleName : null
/// lastName : null
/// correctNomineeFirstName : null
/// correctNomineeMiddleName : null
/// correctNomineeLastName : null
/// dateOfBirth : "1997-05-20T18:30:00.000+00:00"
/// pan : null
/// panNumber : null
/// aadhaar : null
/// aadhaarNumber : null
/// mobileNumber : null
/// emailIdOfNominee : null
/// relationOfNomineeApplicant : 13
/// relationOfNomineeApplicantStr : "Husband"
/// age : 26
/// nameOfGuardian : null
/// addressOfGuardian : null
/// relationShipOfGuardian : null
/// relationShipOfGuardianStr : null
/// mobileNumberOfGuardian : null
/// emailIdOfGuardian : null
/// claimId : null
/// address : {"id":314037364,"createdDate":null,"createdBy":null,"modifiedDate":null,"modifiedBy":null,"isActive":null,"addressLine1":"ahmedabad","addressLine2":"majhagawaan amethi","district":"UP","districtLgdCode":null,"city":"AMETHI JADID, UP","cityLgdCode":null,"cityId":null,"state":"UTTAR PRADESH","stateLgdCode":null,"stateId":null,"pincode":227805,"isOtherClaimant":null}

Nominee nomineeFromJson(String str) => Nominee.fromJson(json.decode(str));

String nomineeToJson(Nominee data) => json.encode(data.toJson());

class Nominee {
  Nominee({
    num? id,
    String? createdDate,
    num? createdBy,
    dynamic modifiedDate,
    dynamic modifiedBy,
    bool? isActive,
    dynamic applicationId,
    dynamic addressId,
    String? firstName,
    dynamic middleName,
    dynamic lastName,
    dynamic correctNomineeFirstName,
    dynamic correctNomineeMiddleName,
    dynamic correctNomineeLastName,
    String? dateOfBirth,
    dynamic pan,
    dynamic panNumber,
    dynamic aadhaar,
    dynamic aadhaarNumber,
    dynamic mobileNumber,
    dynamic emailIdOfNominee,
    num? relationOfNomineeApplicant,
    String? relationOfNomineeApplicantStr,
    num? age,
    dynamic nameOfGuardian,
    dynamic addressOfGuardian,
    dynamic relationShipOfGuardian,
    dynamic relationShipOfGuardianStr,
    dynamic mobileNumberOfGuardian,
    dynamic emailIdOfGuardian,
    dynamic claimId,
    Address? address,
  }) {
    _id = id;
    _createdDate = createdDate;
    _createdBy = createdBy;
    _modifiedDate = modifiedDate;
    _modifiedBy = modifiedBy;
    _isActive = isActive;
    _applicationId = applicationId;
    _addressId = addressId;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _correctNomineeFirstName = correctNomineeFirstName;
    _correctNomineeMiddleName = correctNomineeMiddleName;
    _correctNomineeLastName = correctNomineeLastName;
    _dateOfBirth = dateOfBirth;
    _pan = pan;
    _panNumber = panNumber;
    _aadhaar = aadhaar;
    _aadhaarNumber = aadhaarNumber;
    _mobileNumber = mobileNumber;
    _emailIdOfNominee = emailIdOfNominee;
    _relationOfNomineeApplicant = relationOfNomineeApplicant;
    _relationOfNomineeApplicantStr = relationOfNomineeApplicantStr;
    _age = age;
    _nameOfGuardian = nameOfGuardian;
    _addressOfGuardian = addressOfGuardian;
    _relationShipOfGuardian = relationShipOfGuardian;
    _relationShipOfGuardianStr = relationShipOfGuardianStr;
    _mobileNumberOfGuardian = mobileNumberOfGuardian;
    _emailIdOfGuardian = emailIdOfGuardian;
    _claimId = claimId;
    _address = address;
  }

  Nominee.fromJson(dynamic json) {
    _id = json['id'];
    _createdDate = json['createdDate'];
    _createdBy = json['createdBy'];
    _modifiedDate = json['modifiedDate'];
    _modifiedBy = json['modifiedBy'];
    _isActive = json['isActive'];
    _applicationId = json['applicationId'];
    _addressId = json['addressId'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _correctNomineeFirstName = json['correctNomineeFirstName'];
    _correctNomineeMiddleName = json['correctNomineeMiddleName'];
    _correctNomineeLastName = json['correctNomineeLastName'];
    _dateOfBirth = json['dateOfBirth'];
    _pan = json['pan'];
    _panNumber = json['panNumber'];
    _aadhaar = json['aadhaar'];
    _aadhaarNumber = json['aadhaarNumber'];
    _mobileNumber = json['mobileNumber'];
    _emailIdOfNominee = json['emailIdOfNominee'];
    _relationOfNomineeApplicant = json['relationOfNomineeApplicant'];
    _relationOfNomineeApplicantStr = json['relationOfNomineeApplicantStr'];
    _age = json['age'];
    _nameOfGuardian = json['nameOfGuardian'];
    _addressOfGuardian = json['addressOfGuardian'];
    _relationShipOfGuardian = json['relationShipOfGuardian'];
    _relationShipOfGuardianStr = json['relationShipOfGuardianStr'];
    _mobileNumberOfGuardian = json['mobileNumberOfGuardian'];
    _emailIdOfGuardian = json['emailIdOfGuardian'];
    _claimId = json['claimId'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  num? _id;
  String? _createdDate;
  num? _createdBy;
  dynamic _modifiedDate;
  dynamic _modifiedBy;
  bool? _isActive;
  dynamic _applicationId;
  dynamic _addressId;
  String? _firstName;
  dynamic _middleName;
  dynamic _lastName;
  dynamic _correctNomineeFirstName;
  dynamic _correctNomineeMiddleName;
  dynamic _correctNomineeLastName;
  String? _dateOfBirth;
  dynamic _pan;
  dynamic _panNumber;
  dynamic _aadhaar;
  dynamic _aadhaarNumber;
  dynamic _mobileNumber;
  dynamic _emailIdOfNominee;
  num? _relationOfNomineeApplicant;
  String? _relationOfNomineeApplicantStr;
  num? _age;
  dynamic _nameOfGuardian;
  dynamic _addressOfGuardian;
  dynamic _relationShipOfGuardian;
  dynamic _relationShipOfGuardianStr;
  dynamic _mobileNumberOfGuardian;
  dynamic _emailIdOfGuardian;
  dynamic _claimId;
  Address? _address;

  Nominee copyWith({
    num? id,
    String? createdDate,
    num? createdBy,
    dynamic modifiedDate,
    dynamic modifiedBy,
    bool? isActive,
    dynamic applicationId,
    dynamic addressId,
    String? firstName,
    dynamic middleName,
    dynamic lastName,
    dynamic correctNomineeFirstName,
    dynamic correctNomineeMiddleName,
    dynamic correctNomineeLastName,
    String? dateOfBirth,
    dynamic pan,
    dynamic panNumber,
    dynamic aadhaar,
    dynamic aadhaarNumber,
    dynamic mobileNumber,
    dynamic emailIdOfNominee,
    num? relationOfNomineeApplicant,
    String? relationOfNomineeApplicantStr,
    num? age,
    dynamic nameOfGuardian,
    dynamic addressOfGuardian,
    dynamic relationShipOfGuardian,
    dynamic relationShipOfGuardianStr,
    dynamic mobileNumberOfGuardian,
    dynamic emailIdOfGuardian,
    dynamic claimId,
    Address? address,
  }) =>
      Nominee(
        id: id ?? _id,
        createdDate: createdDate ?? _createdDate,
        createdBy: createdBy ?? _createdBy,
        modifiedDate: modifiedDate ?? _modifiedDate,
        modifiedBy: modifiedBy ?? _modifiedBy,
        isActive: isActive ?? _isActive,
        applicationId: applicationId ?? _applicationId,
        addressId: addressId ?? _addressId,
        firstName: firstName ?? _firstName,
        middleName: middleName ?? _middleName,
        lastName: lastName ?? _lastName,
        correctNomineeFirstName: correctNomineeFirstName ?? _correctNomineeFirstName,
        correctNomineeMiddleName: correctNomineeMiddleName ?? _correctNomineeMiddleName,
        correctNomineeLastName: correctNomineeLastName ?? _correctNomineeLastName,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        pan: pan ?? _pan,
        panNumber: panNumber ?? _panNumber,
        aadhaar: aadhaar ?? _aadhaar,
        aadhaarNumber: aadhaarNumber ?? _aadhaarNumber,
        mobileNumber: mobileNumber ?? _mobileNumber,
        emailIdOfNominee: emailIdOfNominee ?? _emailIdOfNominee,
        relationOfNomineeApplicant: relationOfNomineeApplicant ?? _relationOfNomineeApplicant,
        relationOfNomineeApplicantStr: relationOfNomineeApplicantStr ?? _relationOfNomineeApplicantStr,
        age: age ?? _age,
        nameOfGuardian: nameOfGuardian ?? _nameOfGuardian,
        addressOfGuardian: addressOfGuardian ?? _addressOfGuardian,
        relationShipOfGuardian: relationShipOfGuardian ?? _relationShipOfGuardian,
        relationShipOfGuardianStr: relationShipOfGuardianStr ?? _relationShipOfGuardianStr,
        mobileNumberOfGuardian: mobileNumberOfGuardian ?? _mobileNumberOfGuardian,
        emailIdOfGuardian: emailIdOfGuardian ?? _emailIdOfGuardian,
        claimId: claimId ?? _claimId,
        address: address ?? _address,
      );

  num? get id => _id;

  String? get createdDate => _createdDate;

  num? get createdBy => _createdBy;

  dynamic get modifiedDate => _modifiedDate;

  dynamic get modifiedBy => _modifiedBy;

  bool? get isActive => _isActive;

  dynamic get applicationId => _applicationId;

  dynamic get addressId => _addressId;

  String? get firstName => _firstName;

  dynamic get middleName => _middleName;

  dynamic get lastName => _lastName;

  dynamic get correctNomineeFirstName => _correctNomineeFirstName;

  dynamic get correctNomineeMiddleName => _correctNomineeMiddleName;

  dynamic get correctNomineeLastName => _correctNomineeLastName;

  String? get dateOfBirth => _dateOfBirth;

  dynamic get pan => _pan;

  dynamic get panNumber => _panNumber;

  dynamic get aadhaar => _aadhaar;

  dynamic get aadhaarNumber => _aadhaarNumber;

  dynamic get mobileNumber => _mobileNumber;

  dynamic get emailIdOfNominee => _emailIdOfNominee;

  num? get relationOfNomineeApplicant => _relationOfNomineeApplicant;

  String? get relationOfNomineeApplicantStr => _relationOfNomineeApplicantStr;

  num? get age => _age;

  dynamic get nameOfGuardian => _nameOfGuardian;

  dynamic get addressOfGuardian => _addressOfGuardian;

  dynamic get relationShipOfGuardian => _relationShipOfGuardian;

  dynamic get relationShipOfGuardianStr => _relationShipOfGuardianStr;

  dynamic get mobileNumberOfGuardian => _mobileNumberOfGuardian;

  dynamic get emailIdOfGuardian => _emailIdOfGuardian;

  dynamic get claimId => _claimId;

  Address? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdDate'] = _createdDate;
    map['createdBy'] = _createdBy;
    map['modifiedDate'] = _modifiedDate;
    map['modifiedBy'] = _modifiedBy;
    map['isActive'] = _isActive;
    map['applicationId'] = _applicationId;
    map['addressId'] = _addressId;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['correctNomineeFirstName'] = _correctNomineeFirstName;
    map['correctNomineeMiddleName'] = _correctNomineeMiddleName;
    map['correctNomineeLastName'] = _correctNomineeLastName;
    map['dateOfBirth'] = _dateOfBirth;
    map['pan'] = _pan;
    map['panNumber'] = _panNumber;
    map['aadhaar'] = _aadhaar;
    map['aadhaarNumber'] = _aadhaarNumber;
    map['mobileNumber'] = _mobileNumber;
    map['emailIdOfNominee'] = _emailIdOfNominee;
    map['relationOfNomineeApplicant'] = _relationOfNomineeApplicant;
    map['relationOfNomineeApplicantStr'] = _relationOfNomineeApplicantStr;
    map['age'] = _age;
    map['nameOfGuardian'] = _nameOfGuardian;
    map['addressOfGuardian'] = _addressOfGuardian;
    map['relationShipOfGuardian'] = _relationShipOfGuardian;
    map['relationShipOfGuardianStr'] = _relationShipOfGuardianStr;
    map['mobileNumberOfGuardian'] = _mobileNumberOfGuardian;
    map['emailIdOfGuardian'] = _emailIdOfGuardian;
    map['claimId'] = _claimId;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    return map;
  }

  set firstName(String? value) {
    _firstName = value;
  }

  set middleName(dynamic value) {
    _middleName = value;
  }

  set lastName(dynamic value) {
    _lastName = value;
  }

  set dateOfBirth(String? value) {
    _dateOfBirth = value;
  }

  set mobileNumber(dynamic value) {
    _mobileNumber = value;
  }

  set emailIdOfNominee(dynamic value) {
    _emailIdOfNominee = value;
  }

  set relationOfNomineeApplicant(num? value) {
    _relationOfNomineeApplicant = value;
  }

  set relationOfNomineeApplicantStr(String? value) {
    _relationOfNomineeApplicantStr = value;
  }

  set nameOfGuardian(dynamic value) {
    _nameOfGuardian = value;
  }

  set addressOfGuardian(dynamic value) {
    _addressOfGuardian = value;
  }

  set relationShipOfGuardian(dynamic value) {
    _relationShipOfGuardian = value;
  }

  set relationShipOfGuardianStr(dynamic value) {
    _relationShipOfGuardianStr = value;
  }

  set mobileNumberOfGuardian(dynamic value) {
    _mobileNumberOfGuardian = value;
  }

  set emailIdOfGuardian(dynamic value) {
    _emailIdOfGuardian = value;
  }
}

/// id : 314037364
/// createdDate : null
/// createdBy : null
/// modifiedDate : null
/// modifiedBy : null
/// isActive : null
/// addressLine1 : "ahmedabad"
/// addressLine2 : "majhagawaan amethi"
/// district : "UP"
/// districtLgdCode : null
/// city : "AMETHI JADID, UP"
/// cityLgdCode : null
/// cityId : null
/// state : "UTTAR PRADESH"
/// stateLgdCode : null
/// stateId : null
/// pincode : 227805
/// isOtherClaimant : null

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    num? id,
    dynamic createdDate,
    dynamic createdBy,
    dynamic modifiedDate,
    dynamic modifiedBy,
    dynamic isActive,
    String? addressLine1,
    String? addressLine2,
    String? district,
    dynamic districtLgdCode,
    String? city,
    dynamic cityLgdCode,
    dynamic cityId,
    String? state,
    dynamic stateLgdCode,
    dynamic stateId,
    num? pincode,
    dynamic isOtherClaimant,
  }) {
    _id = id;
    _createdDate = createdDate;
    _createdBy = createdBy;
    _modifiedDate = modifiedDate;
    _modifiedBy = modifiedBy;
    _isActive = isActive;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _district = district;
    _districtLgdCode = districtLgdCode;
    _city = city;
    _cityLgdCode = cityLgdCode;
    _cityId = cityId;
    _state = state;
    _stateLgdCode = stateLgdCode;
    _stateId = stateId;
    _pincode = pincode;
    _isOtherClaimant = isOtherClaimant;
  }

  Address.fromJson(dynamic json) {
    _id = json['id'];
    _createdDate = json['createdDate'];
    _createdBy = json['createdBy'];
    _modifiedDate = json['modifiedDate'];
    _modifiedBy = json['modifiedBy'];
    _isActive = json['isActive'];
    _addressLine1 = json['addressLine1'];
    _addressLine2 = json['addressLine2'];
    _district = json['district'];
    _districtLgdCode = json['districtLgdCode'];
    _city = json['city'];
    _cityLgdCode = json['cityLgdCode'];
    _cityId = json['cityId'];
    _state = json['state'];
    _stateLgdCode = json['stateLgdCode'];
    _stateId = json['stateId'];
    _pincode = json['pincode'];
    _isOtherClaimant = json['isOtherClaimant'];
  }

  num? _id;
  dynamic _createdDate;
  dynamic _createdBy;
  dynamic _modifiedDate;
  dynamic _modifiedBy;
  dynamic _isActive;
  String? _addressLine1;
  String? _addressLine2;
  String? _district;
  dynamic _districtLgdCode;
  String? _city;
  dynamic _cityLgdCode;
  dynamic _cityId;
  String? _state;
  dynamic _stateLgdCode;
  dynamic _stateId;
  num? _pincode;
  dynamic _isOtherClaimant;

  Address copyWith({
    num? id,
    dynamic createdDate,
    dynamic createdBy,
    dynamic modifiedDate,
    dynamic modifiedBy,
    dynamic isActive,
    String? addressLine1,
    String? addressLine2,
    String? district,
    dynamic districtLgdCode,
    String? city,
    dynamic cityLgdCode,
    dynamic cityId,
    String? state,
    dynamic stateLgdCode,
    dynamic stateId,
    num? pincode,
    dynamic isOtherClaimant,
  }) =>
      Address(
        id: id ?? _id,
        createdDate: createdDate ?? _createdDate,
        createdBy: createdBy ?? _createdBy,
        modifiedDate: modifiedDate ?? _modifiedDate,
        modifiedBy: modifiedBy ?? _modifiedBy,
        isActive: isActive ?? _isActive,
        addressLine1: addressLine1 ?? _addressLine1,
        addressLine2: addressLine2 ?? _addressLine2,
        district: district ?? _district,
        districtLgdCode: districtLgdCode ?? _districtLgdCode,
        city: city ?? _city,
        cityLgdCode: cityLgdCode ?? _cityLgdCode,
        cityId: cityId ?? _cityId,
        state: state ?? _state,
        stateLgdCode: stateLgdCode ?? _stateLgdCode,
        stateId: stateId ?? _stateId,
        pincode: pincode ?? _pincode,
        isOtherClaimant: isOtherClaimant ?? _isOtherClaimant,
      );

  num? get id => _id;

  dynamic get createdDate => _createdDate;

  dynamic get createdBy => _createdBy;

  dynamic get modifiedDate => _modifiedDate;

  dynamic get modifiedBy => _modifiedBy;

  dynamic get isActive => _isActive;

  String? get addressLine1 => _addressLine1;

  String? get addressLine2 => _addressLine2;

  String? get district => _district;

  dynamic get districtLgdCode => _districtLgdCode;

  String? get city => _city;

  dynamic get cityLgdCode => _cityLgdCode;

  dynamic get cityId => _cityId;

  String? get state => _state;

  dynamic get stateLgdCode => _stateLgdCode;

  dynamic get stateId => _stateId;

  num? get pincode => _pincode;

  dynamic get isOtherClaimant => _isOtherClaimant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdDate'] = _createdDate;
    map['createdBy'] = _createdBy;
    map['modifiedDate'] = _modifiedDate;
    map['modifiedBy'] = _modifiedBy;
    map['isActive'] = _isActive;
    map['addressLine1'] = _addressLine1;
    map['addressLine2'] = _addressLine2;
    map['district'] = _district;
    map['districtLgdCode'] = _districtLgdCode;
    map['city'] = _city;
    map['cityLgdCode'] = _cityLgdCode;
    map['cityId'] = _cityId;
    map['state'] = _state;
    map['stateLgdCode'] = _stateLgdCode;
    map['stateId'] = _stateId;
    map['pincode'] = _pincode;
    map['isOtherClaimant'] = _isOtherClaimant;
    return map;
  }

  set addressLine1(String? value) {
    _addressLine1 = value;
  }

  set addressLine2(String? value) {
    _addressLine2 = value;
  }

  set district(String? value) {
    _district = value;
  }

  set city(String? value) {
    _city = value;
  }

  set state(String? value) {
    _state = value;
  }

  set pincode(num? value) {
    _pincode = value;
  }
}

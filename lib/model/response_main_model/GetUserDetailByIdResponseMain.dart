import 'dart:convert';

GetUserDetailByIdResponseMain getUserDetailByIdResponseMainFromJson(String str) =>
    GetUserDetailByIdResponseMain.fromJson(json.decode(str));
String getUserDetailByIdResponseMainToJson(GetUserDetailByIdResponseMain data) => json.encode(data.toJson());

class GetUserDetailByIdResponseMain {
  GetUserDetailByIdResponseMain({
    dynamic id,
    String? message,
    num? status,
    Data? data,
    bool? flag,
    dynamic branchList,
    List<String>? listData,
    dynamic lastBusinessTypeId,
    dynamic file,
    dynamic fromCSC,
  }) {
    _id = id;
    _message = message;
    _status = status;
    _data = data;
    _flag = flag;
    _branchList = branchList;
    _listData = listData;
    _lastBusinessTypeId = lastBusinessTypeId;
    _file = file;
    _fromCSC = fromCSC;
  }

  GetUserDetailByIdResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _flag = json['flag'];
    _branchList = json['branchList'];
    if (json['listData'] != null) {
      _listData = [];
      json['listData'].forEach((v) {
        _listData?.add(v);
      });
    }
    _lastBusinessTypeId = json['lastBusinessTypeId'];
    _file = json['file'];
    _fromCSC = json['fromCSC'];
  }
  dynamic _id;
  String? _message;
  num? _status;
  Data? _data;
  bool? _flag;
  dynamic _branchList;
  List<String>? _listData;
  dynamic _lastBusinessTypeId;
  dynamic _file;
  dynamic _fromCSC;
  GetUserDetailByIdResponseMain copyWith({
    dynamic id,
    String? message,
    num? status,
    Data? data,
    bool? flag,
    dynamic branchList,
    List<String>? listData,
    dynamic lastBusinessTypeId,
    dynamic file,
    dynamic fromCSC,
  }) =>
      GetUserDetailByIdResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        status: status ?? _status,
        data: data ?? _data,
        flag: flag ?? _flag,
        branchList: branchList ?? _branchList,
        listData: listData ?? _listData,
        lastBusinessTypeId: lastBusinessTypeId ?? _lastBusinessTypeId,
        file: file ?? _file,
        fromCSC: fromCSC ?? _fromCSC,
      );
  dynamic get id => _id;
  String? get message => _message;
  num? get status => _status;
  Data? get data => _data;
  bool? get flag => _flag;
  dynamic get branchList => _branchList;
  List<dynamic>? get listData => _listData;
  dynamic get lastBusinessTypeId => _lastBusinessTypeId;
  dynamic get file => _file;
  dynamic get fromCSC => _fromCSC;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['flag'] = _flag;
    map['branchList'] = _branchList;
    if (_listData != null) {
      map['listData'] = _listData?.map((v) => v).toList();
    }
    map['lastBusinessTypeId'] = _lastBusinessTypeId;
    map['file'] = _file;
    map['fromCSC'] = _fromCSC;
    return map;
  }
}

/// termsAccepted : true
/// otpVerified : true
/// emailVerified : true
/// email : "paresh.ibo@opl.com"
/// isPasswordSet : true
/// mobile : "9016191077"
/// firstName : "paresh"
/// middleName : "m"
/// lastName : "radadiya"
/// modifiedDate : "2023-07-28T13:32:57.124+00:00"
/// signUpDate : "2023-03-17T05:18:42.000+00:00"
/// userId : 22
/// userRoleId : 9
/// isLocked : false
/// userRoleIdString : "Bank Officer"
/// userOrgName : "Indian Bank"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    bool? termsAccepted,
    bool? otpVerified,
    bool? emailVerified,
    String? email,
    bool? isPasswordSet,
    String? mobile,
    String? firstName,
    String? middleName,
    String? lastName,
    String? modifiedDate,
    String? signUpDate,
    num? userId,
    num? userRoleId,
    bool? isLocked,
    String? userRoleIdString,
    String? userOrgName,
  }) {
    _termsAccepted = termsAccepted;
    _otpVerified = otpVerified;
    _emailVerified = emailVerified;
    _email = email;
    _isPasswordSet = isPasswordSet;
    _mobile = mobile;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _modifiedDate = modifiedDate;
    _signUpDate = signUpDate;
    _userId = userId;
    _userRoleId = userRoleId;
    _isLocked = isLocked;
    _userRoleIdString = userRoleIdString;
    _userOrgName = userOrgName;
  }

  Data.fromJson(dynamic json) {
    _termsAccepted = json['termsAccepted'];
    _otpVerified = json['otpVerified'];
    _emailVerified = json['emailVerified'];
    _email = json['email'];
    _isPasswordSet = json['isPasswordSet'];
    _mobile = json['mobile'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _modifiedDate = json['modifiedDate'];
    _signUpDate = json['signUpDate'];
    _userId = json['userId'];
    _userRoleId = json['userRoleId'];
    _isLocked = json['isLocked'];
    _userRoleIdString = json['userRoleIdString'];
    _userOrgName = json['userOrgName'];
  }
  bool? _termsAccepted;
  bool? _otpVerified;
  bool? _emailVerified;
  String? _email;
  bool? _isPasswordSet;
  String? _mobile;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _modifiedDate;
  String? _signUpDate;
  num? _userId;
  num? _userRoleId;
  bool? _isLocked;
  String? _userRoleIdString;
  String? _userOrgName;
  Data copyWith({
    bool? termsAccepted,
    bool? otpVerified,
    bool? emailVerified,
    String? email,
    bool? isPasswordSet,
    String? mobile,
    String? firstName,
    String? middleName,
    String? lastName,
    String? modifiedDate,
    String? signUpDate,
    num? userId,
    num? userRoleId,
    bool? isLocked,
    String? userRoleIdString,
    String? userOrgName,
  }) =>
      Data(
        termsAccepted: termsAccepted ?? _termsAccepted,
        otpVerified: otpVerified ?? _otpVerified,
        emailVerified: emailVerified ?? _emailVerified,
        email: email ?? _email,
        isPasswordSet: isPasswordSet ?? _isPasswordSet,
        mobile: mobile ?? _mobile,
        firstName: firstName ?? _firstName,
        middleName: middleName ?? _middleName,
        lastName: lastName ?? _lastName,
        modifiedDate: modifiedDate ?? _modifiedDate,
        signUpDate: signUpDate ?? _signUpDate,
        userId: userId ?? _userId,
        userRoleId: userRoleId ?? _userRoleId,
        isLocked: isLocked ?? _isLocked,
        userRoleIdString: userRoleIdString ?? _userRoleIdString,
        userOrgName: userOrgName ?? _userOrgName,
      );
  bool? get termsAccepted => _termsAccepted;
  bool? get otpVerified => _otpVerified;
  bool? get emailVerified => _emailVerified;
  String? get email => _email;
  bool? get isPasswordSet => _isPasswordSet;
  String? get mobile => _mobile;
  String? get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String? get modifiedDate => _modifiedDate;
  String? get signUpDate => _signUpDate;
  num? get userId => _userId;
  num? get userRoleId => _userRoleId;
  bool? get isLocked => _isLocked;
  String? get userRoleIdString => _userRoleIdString;
  String? get userOrgName => _userOrgName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['termsAccepted'] = _termsAccepted;
    map['otpVerified'] = _otpVerified;
    map['emailVerified'] = _emailVerified;
    map['email'] = _email;
    map['isPasswordSet'] = _isPasswordSet;
    map['mobile'] = _mobile;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['modifiedDate'] = _modifiedDate;
    map['signUpDate'] = _signUpDate;
    map['userId'] = _userId;
    map['userRoleId'] = _userRoleId;
    map['isLocked'] = _isLocked;
    map['userRoleIdString'] = _userRoleIdString;
    map['userOrgName'] = _userOrgName;
    return map;
  }
}

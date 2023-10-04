import 'dart:convert';

/// id : null
/// message : "Password reset instructions have been e-mailed to you. Please check in your registered e-mail"
/// status : 200
/// data : {"mobileNo":"9851532102","requestId":null,"requestType":2,"masterId":9701,"emailId":"hello23@opl.com","otp":null,"notificationAlias":null,"notificationMasterId":7,"otpOn":null,"name":"gsyfdghcv"}
/// flag : true
/// branchList : null
/// listData : []
/// lastBusinessTypeId : null
/// file : null
/// fromCSC : null

ForgotPasswordResponseMain forgotPasswordResponseMainFromJson(String str) =>
    ForgotPasswordResponseMain.fromJson(json.decode(str));

String forgotPasswordResponseMainToJson(ForgotPasswordResponseMain data) => json.encode(data.toJson());

class ForgotPasswordResponseMain {
  ForgotPasswordResponseMain({
    dynamic id,
    String? message,
    int? status,
    Data? data,
    bool? flag,
    dynamic branchList,
    List<dynamic>? listData,
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

  ForgotPasswordResponseMain.fromJson(dynamic json) {
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
  int? _status;
  Data? _data;
  bool? _flag;
  dynamic _branchList;
  List<dynamic>? _listData;
  dynamic _lastBusinessTypeId;
  dynamic _file;
  dynamic _fromCSC;

  ForgotPasswordResponseMain copyWith({
    dynamic id,
    String? message,
    int? status,
    Data? data,
    bool? flag,
    dynamic branchList,
    List<dynamic>? listData,
    dynamic lastBusinessTypeId,
    dynamic file,
    dynamic fromCSC,
  }) =>
      ForgotPasswordResponseMain(
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

  int? get status => _status;

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
      map['listData'] = _listData?.map((v) => v.toJson()).toList();
    }
    map['lastBusinessTypeId'] = _lastBusinessTypeId;
    map['file'] = _file;
    map['fromCSC'] = _fromCSC;
    return map;
  }
}

/// mobileNo : "9851532102"
/// requestId : null
/// requestType : 2
/// masterId : 9701
/// emailId : "hello23@opl.com"
/// otp : null
/// notificationAlias : null
/// notificationMasterId : 7
/// otpOn : null
/// name : "gsyfdghcv"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? mobileNo,
    dynamic requestId,
    num? requestType,
    num? masterId,
    String? emailId,
    dynamic otp,
    dynamic notificationAlias,
    num? notificationMasterId,
    dynamic otpOn,
    String? name,
  }) {
    _mobileNo = mobileNo;
    _requestId = requestId;
    _requestType = requestType;
    _masterId = masterId;
    _emailId = emailId;
    _otp = otp;
    _notificationAlias = notificationAlias;
    _notificationMasterId = notificationMasterId;
    _otpOn = otpOn;
    _name = name;
  }

  Data.fromJson(dynamic json) {
    _mobileNo = json['mobileNo'];
    _requestId = json['requestId'];
    _requestType = json['requestType'];
    _masterId = json['masterId'];
    _emailId = json['emailId'];
    _otp = json['otp'];
    _notificationAlias = json['notificationAlias'];
    _notificationMasterId = json['notificationMasterId'];
    _otpOn = json['otpOn'];
    _name = json['name'];
  }

  String? _mobileNo;
  dynamic _requestId;
  num? _requestType;
  num? _masterId;
  String? _emailId;
  dynamic _otp;
  dynamic _notificationAlias;
  num? _notificationMasterId;
  dynamic _otpOn;
  String? _name;

  Data copyWith({
    String? mobileNo,
    dynamic requestId,
    num? requestType,
    num? masterId,
    String? emailId,
    dynamic otp,
    dynamic notificationAlias,
    num? notificationMasterId,
    dynamic otpOn,
    String? name,
  }) =>
      Data(
        mobileNo: mobileNo ?? _mobileNo,
        requestId: requestId ?? _requestId,
        requestType: requestType ?? _requestType,
        masterId: masterId ?? _masterId,
        emailId: emailId ?? _emailId,
        otp: otp ?? _otp,
        notificationAlias: notificationAlias ?? _notificationAlias,
        notificationMasterId: notificationMasterId ?? _notificationMasterId,
        otpOn: otpOn ?? _otpOn,
        name: name ?? _name,
      );

  String? get mobileNo => _mobileNo;

  dynamic get requestId => _requestId;

  num? get requestType => _requestType;

  num? get masterId => _masterId;

  String? get emailId => _emailId;

  dynamic get otp => _otp;

  dynamic get notificationAlias => _notificationAlias;

  num? get notificationMasterId => _notificationMasterId;

  dynamic get otpOn => _otpOn;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobileNo'] = _mobileNo;
    map['requestId'] = _requestId;
    map['requestType'] = _requestType;
    map['masterId'] = _masterId;
    map['emailId'] = _emailId;
    map['otp'] = _otp;
    map['notificationAlias'] = _notificationAlias;
    map['notificationMasterId'] = _notificationMasterId;
    map['otpOn'] = _otpOn;
    map['name'] = _name;
    return map;
  }
}

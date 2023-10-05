import '../../services/response/tg_response.dart';

class FetchProfileInfoMain extends TGResponse {
  FetchProfileInfo _verifyLoginOtpResponseMain = FetchProfileInfo();

  FetchProfileInfoMain();

  FetchProfileInfoMain.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _verifyLoginOtpResponseMain = FetchProfileInfo.fromJson(json);
  }

  FetchProfileInfo getprofileinfo() {
    return _verifyLoginOtpResponseMain;
  }
}

class FetchProfileInfo {
  Null? id;
  String? message;
  int? status;
  Data? data;
  bool? flag;
  Null? branchList;
  List<Null>? listData;
  Null? lastBusinessTypeId;
  Null? file;
  Null? fromCSC;

  FetchProfileInfo({this.id, this.message, this.status, this.data, this.flag, this.branchList, this.listData, this.lastBusinessTypeId, this.file, this.fromCSC});

  FetchProfileInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    flag = json['flag'];
    branchList = json['branchList'];
    if (json['listData'] != null) {
      listData = <Null>[];
    }
    lastBusinessTypeId = json['lastBusinessTypeId'];
    file = json['file'];
    fromCSC = json['fromCSC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['flag'] = this.flag;
    data['branchList'] = this.branchList;
    data['lastBusinessTypeId'] = this.lastBusinessTypeId;
    data['file'] = this.file;
    data['fromCSC'] = this.fromCSC;
    return data;
  }
}

class Data {
  bool? termsAccepted;
  bool? otpVerified;
  bool? emailVerified;
  String? email;
  bool? isPasswordSet;
  String? mobile;
  String? firstName;
  String? middleName;
  String? lastName;
  String? modifiedDate;
  String? signUpDate;
  int? userId;
  int? userRoleId;
  bool? isLocked;
  String? userRoleIdString;
  String? userOrgName;
  String? userName;

  Data(
      {this.termsAccepted,
      this.otpVerified,
      this.emailVerified,
      this.email,
      this.isPasswordSet,
      this.mobile,
      this.firstName,
      this.middleName,
      this.lastName,
      this.modifiedDate,
      this.signUpDate,
      this.userId,
      this.userName,
      this.userRoleId,
      this.isLocked,
      this.userRoleIdString,
      this.userOrgName});

  Data.fromJson(Map<String, dynamic> json) {
    termsAccepted = json['termsAccepted'];
    otpVerified = json['otpVerified'];
    emailVerified = json['emailVerified'];
    email = json['email'];
    isPasswordSet = json['isPasswordSet'];
    mobile = json['mobile'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    modifiedDate = json['modifiedDate'];
    signUpDate = json['signUpDate'];
    userId = json['userId'];
    userRoleId = json['userRoleId'];
    isLocked = json['isLocked'];
    userRoleIdString = json['userRoleIdString'];
    userOrgName = json['userOrgName'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['termsAccepted'] = this.termsAccepted;
    data['otpVerified'] = this.otpVerified;
    data['emailVerified'] = this.emailVerified;
    data['email'] = this.email;
    data['isPasswordSet'] = this.isPasswordSet;
    data['mobile'] = this.mobile;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    data['modifiedDate'] = this.modifiedDate;
    data['signUpDate'] = this.signUpDate;
    data['userId'] = this.userId;
    data['userRoleId'] = this.userRoleId;
    data['isLocked'] = this.isLocked;
    data['userRoleIdString'] = this.userRoleIdString;
    data['userOrgName'] = this.userOrgName;
    data['userName'] = this.userName;
    return data;
  }
}

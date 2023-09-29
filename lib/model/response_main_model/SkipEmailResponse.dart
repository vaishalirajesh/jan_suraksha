class GetResponseForSkipEmail {
  Null? id;
  String? message;
  Data? data;
  int? status;
  bool? flag;

  GetResponseForSkipEmail({this.id, this.message, this.data, this.status, this.flag});

  GetResponseForSkipEmail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['flag'] = this.flag;
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  String? expiresIn;
  String? refreshToken;
  String? scope;
  int? userType;
  int? userId;
  String? message;
  int? status;
  Null? email;
  int? loginToken;
  Null? userOrgId;
  int? userRoleId;
  Null? userBranchId;
  List<Null>? campaignCode;
  Null? isFromDealerUser;
  String? userName;

  Data(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.refreshToken,
      this.scope,
      this.userType,
      this.userId,
      this.message,
      this.status,
      this.email,
      this.loginToken,
      this.userOrgId,
      this.userRoleId,
      this.userBranchId,
      this.campaignCode,
      this.isFromDealerUser,
      this.userName});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    scope = json['scope'];
    userType = json['userType'];
    userId = json['userId'];
    message = json['message'];
    status = json['status'];
    email = json['email'];
    loginToken = json['loginToken'];
    userOrgId = json['userOrgId'];
    userRoleId = json['userRoleId'];
    userBranchId = json['userBranchId'];
    isFromDealerUser = json['isFromDealerUser'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['userType'] = this.userType;
    data['userId'] = this.userId;
    data['message'] = this.message;
    data['status'] = this.status;
    data['email'] = this.email;
    data['loginToken'] = this.loginToken;
    data['userOrgId'] = this.userOrgId;
    data['userRoleId'] = this.userRoleId;
    data['userBranchId'] = this.userBranchId;

    data['isFromDealerUser'] = this.isFromDealerUser;
    data['userName'] = this.userName;
    return data;
  }
}

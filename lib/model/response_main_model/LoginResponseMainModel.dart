import 'dart:convert';

LoginResponseMainModel loginResponseModelFromJson(String str) => LoginResponseMainModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseMainModel data) => json.encode(data.toJson());

class LoginResponseMainModel {
  LoginResponseMainModel({
    String? accessToken,
    String? tokenType,
    String? expiresIn,
    String? refreshToken,
    dynamic generateChangePass,
    String? message,
    String? email,
    String? mobile,
    List<String>? campaignCode,
    num? loginToken,
    int? status,
    dynamic userUrlType,
    dynamic businessType,
    num? userId,
    num? userType,
    dynamic applicationId,
    num? userOrgId,
    String? userOrgName,
    num? userRoleId,
    num? userBranchId,
    dynamic isEmailVerified,
    dynamic loginCounter,
    String? userName,
    bool? isPasswordChanged,
  }) {
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _refreshToken = refreshToken;
    _generateChangePass = generateChangePass;
    _message = message;
    _email = email;
    _mobile = mobile;
    _campaignCode = campaignCode;
    _loginToken = loginToken;
    _status = status;
    _userUrlType = userUrlType;
    _businessType = businessType;
    _userId = userId;
    _userType = userType;
    _applicationId = applicationId;
    _userOrgId = userOrgId;
    _userOrgName = userOrgName;
    _userRoleId = userRoleId;
    _userBranchId = userBranchId;
    _isEmailVerified = isEmailVerified;
    _loginCounter = loginCounter;
    _userName = userName;
    _isPasswordChanged = isPasswordChanged;
  }

  LoginResponseMainModel.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _refreshToken = json['refresh_token'];
    _generateChangePass = json['generateChangePass'];
    _message = json['message'];
    _email = json['email'];
    _mobile = json['mobile'];
    if (json['campaignCode'] != null) {
      _campaignCode = [];
      json['campaignCode'].forEach((v) {
        _campaignCode?.add(v);
      });
    }
    _loginToken = json['loginToken'];
    _status = json['status'];
    _userUrlType = json['userUrlType'];
    _businessType = json['businessType'];
    _userId = json['userId'];
    _userType = json['userType'];
    _applicationId = json['applicationId'];
    _userOrgId = json['userOrgId'];
    _userOrgName = json['userOrgName'];
    _userRoleId = json['userRoleId'];
    _userBranchId = json['userBranchId'];
    _isEmailVerified = json['isEmailVerified'];
    _loginCounter = json['loginCounter'];
    _userName = json['userName'];
    _isPasswordChanged = json['isPasswordChanged'];
  }

  String? _accessToken;
  String? _tokenType;
  String? _expiresIn;
  String? _refreshToken;
  dynamic _generateChangePass;
  String? _message;
  String? _email;
  String? _mobile;
  List<String>? _campaignCode;
  num? _loginToken;
  int? _status;
  dynamic _userUrlType;
  dynamic _businessType;
  num? _userId;
  num? _userType;
  dynamic _applicationId;
  num? _userOrgId;
  String? _userOrgName;
  num? _userRoleId;
  num? _userBranchId;
  dynamic _isEmailVerified;
  dynamic _loginCounter;
  String? _userName;
  bool? _isPasswordChanged;

  LoginResponseMainModel copyWith({
    String? accessToken,
    String? tokenType,
    String? expiresIn,
    String? refreshToken,
    dynamic generateChangePass,
    String? message,
    String? email,
    String? mobile,
    List<String>? campaignCode,
    num? loginToken,
    int? status,
    dynamic userUrlType,
    dynamic businessType,
    num? userId,
    num? userType,
    dynamic applicationId,
    num? userOrgId,
    String? userOrgName,
    num? userRoleId,
    num? userBranchId,
    dynamic isEmailVerified,
    dynamic loginCounter,
    String? userName,
    bool? isPasswordChanged,
  }) =>
      LoginResponseMainModel(
        accessToken: accessToken ?? _accessToken,
        tokenType: tokenType ?? _tokenType,
        expiresIn: expiresIn ?? _expiresIn,
        refreshToken: refreshToken ?? _refreshToken,
        generateChangePass: generateChangePass ?? _generateChangePass,
        message: message ?? _message,
        email: email ?? _email,
        mobile: mobile ?? _mobile,
        campaignCode: campaignCode ?? _campaignCode,
        loginToken: loginToken ?? _loginToken,
        status: status ?? _status,
        userUrlType: userUrlType ?? _userUrlType,
        businessType: businessType ?? _businessType,
        userId: userId ?? _userId,
        userType: userType ?? _userType,
        applicationId: applicationId ?? _applicationId,
        userOrgId: userOrgId ?? _userOrgId,
        userOrgName: userOrgName ?? _userOrgName,
        userRoleId: userRoleId ?? _userRoleId,
        userBranchId: userBranchId ?? _userBranchId,
        isEmailVerified: isEmailVerified ?? _isEmailVerified,
        loginCounter: loginCounter ?? _loginCounter,
        userName: userName ?? _userName,
        isPasswordChanged: isPasswordChanged ?? _isPasswordChanged,
      );

  String? get accessToken => _accessToken;

  String? get tokenType => _tokenType;

  String? get expiresIn => _expiresIn;

  String? get refreshToken => _refreshToken;

  dynamic get generateChangePass => _generateChangePass;

  String? get message => _message;

  String? get email => _email;

  String? get mobile => _mobile;

  List<dynamic>? get campaignCode => _campaignCode;

  num? get loginToken => _loginToken;

  int? get status => _status;

  dynamic get userUrlType => _userUrlType;

  dynamic get businessType => _businessType;

  num? get userId => _userId;

  num? get userType => _userType;

  dynamic get applicationId => _applicationId;

  num? get userOrgId => _userOrgId;

  String? get userOrgName => _userOrgName;

  num? get userRoleId => _userRoleId;

  num? get userBranchId => _userBranchId;

  dynamic get isEmailVerified => _isEmailVerified;

  dynamic get loginCounter => _loginCounter;

  String? get userName => _userName;

  bool? get isPasswordChanged => _isPasswordChanged;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    map['refresh_token'] = _refreshToken;
    map['generateChangePass'] = _generateChangePass;
    map['message'] = _message;
    map['email'] = _email;
    map['mobile'] = _mobile;
    if (_campaignCode != null) {
      map['campaignCode'] = _campaignCode?.map((v) => v).toList();
    }
    map['loginToken'] = _loginToken;
    map['status'] = _status;
    map['userUrlType'] = _userUrlType;
    map['businessType'] = _businessType;
    map['userId'] = _userId;
    map['userType'] = _userType;
    map['applicationId'] = _applicationId;
    map['userOrgId'] = _userOrgId;
    map['userOrgName'] = _userOrgName;
    map['userRoleId'] = _userRoleId;
    map['userBranchId'] = _userBranchId;
    map['isEmailVerified'] = _isEmailVerified;
    map['loginCounter'] = _loginCounter;
    map['userName'] = _userName;
    map['isPasswordChanged'] = _isPasswordChanged;
    return map;
  }
}

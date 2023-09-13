import 'dart:convert';

VerifyLoginOtpResponseMain verifyLoginOtpResponseMainFromJson(String str) =>
    VerifyLoginOtpResponseMain.fromJson(json.decode(str));
String verifyLoginOtpResponseMainToJson(VerifyLoginOtpResponseMain data) => json.encode(data.toJson());

class VerifyLoginOtpResponseMain {
  VerifyLoginOtpResponseMain({
    dynamic accessToken,
    dynamic tokenType,
    dynamic expiresIn,
    dynamic refreshToken,
    dynamic generateChangePass,
    String? message,
    dynamic email,
    dynamic mobile,
    dynamic campaignCode,
    dynamic loginToken,
    num? status,
    dynamic userUrlType,
    dynamic businessType,
    dynamic userId,
    dynamic userType,
    dynamic applicationId,
    dynamic userOrgId,
    dynamic userOrgName,
    dynamic userRoleId,
    dynamic userBranchId,
    dynamic isEmailVerified,
    dynamic loginCounter,
    dynamic userName,
    dynamic isPasswordChanged,
    dynamic passwordResetDate,
    dynamic configFlag,
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
    _passwordResetDate = passwordResetDate;
    _configFlag = configFlag;
  }

  VerifyLoginOtpResponseMain.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _refreshToken = json['refresh_token'];
    _generateChangePass = json['generateChangePass'];
    _message = json['message'];
    _email = json['email'];
    _mobile = json['mobile'];
    _campaignCode = json['campaignCode'];
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
    _passwordResetDate = json['passwordResetDate'];
    _configFlag = json['configFlag'];
  }
  dynamic _accessToken;
  dynamic _tokenType;
  dynamic _expiresIn;
  dynamic _refreshToken;
  dynamic _generateChangePass;
  String? _message;
  dynamic _email;
  dynamic _mobile;
  dynamic _campaignCode;
  dynamic _loginToken;
  num? _status;
  dynamic _userUrlType;
  dynamic _businessType;
  dynamic _userId;
  dynamic _userType;
  dynamic _applicationId;
  dynamic _userOrgId;
  dynamic _userOrgName;
  dynamic _userRoleId;
  dynamic _userBranchId;
  dynamic _isEmailVerified;
  dynamic _loginCounter;
  dynamic _userName;
  dynamic _isPasswordChanged;
  dynamic _passwordResetDate;
  dynamic _configFlag;
  VerifyLoginOtpResponseMain copyWith({
    dynamic accessToken,
    dynamic tokenType,
    dynamic expiresIn,
    dynamic refreshToken,
    dynamic generateChangePass,
    String? message,
    dynamic email,
    dynamic mobile,
    dynamic campaignCode,
    dynamic loginToken,
    num? status,
    dynamic userUrlType,
    dynamic businessType,
    dynamic userId,
    dynamic userType,
    dynamic applicationId,
    dynamic userOrgId,
    dynamic userOrgName,
    dynamic userRoleId,
    dynamic userBranchId,
    dynamic isEmailVerified,
    dynamic loginCounter,
    dynamic userName,
    dynamic isPasswordChanged,
    dynamic passwordResetDate,
    dynamic configFlag,
  }) =>
      VerifyLoginOtpResponseMain(
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
        passwordResetDate: passwordResetDate ?? _passwordResetDate,
        configFlag: configFlag ?? _configFlag,
      );
  dynamic get accessToken => _accessToken;
  dynamic get tokenType => _tokenType;
  dynamic get expiresIn => _expiresIn;
  dynamic get refreshToken => _refreshToken;
  dynamic get generateChangePass => _generateChangePass;
  String? get message => _message;
  dynamic get email => _email;
  dynamic get mobile => _mobile;
  dynamic get campaignCode => _campaignCode;
  dynamic get loginToken => _loginToken;
  num? get status => _status;
  dynamic get userUrlType => _userUrlType;
  dynamic get businessType => _businessType;
  dynamic get userId => _userId;
  dynamic get userType => _userType;
  dynamic get applicationId => _applicationId;
  dynamic get userOrgId => _userOrgId;
  dynamic get userOrgName => _userOrgName;
  dynamic get userRoleId => _userRoleId;
  dynamic get userBranchId => _userBranchId;
  dynamic get isEmailVerified => _isEmailVerified;
  dynamic get loginCounter => _loginCounter;
  dynamic get userName => _userName;
  dynamic get isPasswordChanged => _isPasswordChanged;
  dynamic get passwordResetDate => _passwordResetDate;
  dynamic get configFlag => _configFlag;

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
    map['campaignCode'] = _campaignCode;
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
    map['passwordResetDate'] = _passwordResetDate;
    map['configFlag'] = _configFlag;
    return map;
  }
}

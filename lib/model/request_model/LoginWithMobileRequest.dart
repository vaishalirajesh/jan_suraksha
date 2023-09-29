import 'dart:convert';

/// mobile : "9104661798"
/// email : "9104661798"
/// userType : 1
/// domain : "https://uat-jns.instantmseloans.in"
/// platform : "sidbi"
/// termsAccepted : "true"
/// captchaEnter : "xD3gh9"
/// captchaOriginal : "xD3gh9"

LoginWithMobileRequest loginWithMobileRequestFromJson(String str) => LoginWithMobileRequest.fromJson(json.decode(str));
String loginWithMobileRequestToJson(LoginWithMobileRequest data) => json.encode(data.toJson());

class LoginWithMobileRequest {
  LoginWithMobileRequest({
    String? mobile,
    String? email,
    num? userType,
    String? domain,
    String? platform,
    String? termsAccepted,
    String? password,
    String? captchaEnter,
    String? captchaOriginal,
  }) {
    _mobile = mobile;
    _email = email;
    _userType = userType;
    _domain = domain;
    _platform = platform;
    _termsAccepted = termsAccepted;
    _captchaEnter = captchaEnter;
    _captchaOriginal = captchaOriginal;
    _password = password;
  }

  LoginWithMobileRequest.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _email = json['email'];
    _userType = json['userType'];
    _domain = json['domain'];
    _platform = json['platform'];
    _termsAccepted = json['termsAccepted'];
    _captchaEnter = json['captchaEnter'];
    _captchaOriginal = json['captchaOriginal'];
    _password = json['password'];
  }
  String? _mobile;
  String? _email;
  num? _userType;
  String? _domain;
  String? _platform;
  String? _termsAccepted;
  String? _captchaEnter;
  String? _captchaOriginal;
  String? _password;
  LoginWithMobileRequest copyWith({
    String? mobile,
    String? email,
    num? userType,
    String? domain,
    String? platform,
    String? termsAccepted,
    String? captchaEnter,
    String? captchaOriginal,
    String? password,
  }) =>
      LoginWithMobileRequest(
        mobile: mobile ?? _mobile,
        email: email ?? _email,
        userType: userType ?? _userType,
        domain: domain ?? _domain,
        platform: platform ?? _platform,
        termsAccepted: termsAccepted ?? _termsAccepted,
        captchaEnter: captchaEnter ?? _captchaEnter,
        captchaOriginal: captchaOriginal ?? _captchaOriginal,
        password: password ?? _password,
      );
  String? get mobile => _mobile;
  String? get email => _email;
  num? get userType => _userType;
  String? get domain => _domain;
  String? get platform => _platform;
  String? get termsAccepted => _termsAccepted;
  String? get captchaEnter => _captchaEnter;
  String? get captchaOriginal => _captchaOriginal;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['userType'] = _userType;
    map['domain'] = _domain;
    map['platform'] = _platform;
    map['termsAccepted'] = _termsAccepted;
    map['captchaEnter'] = _captchaEnter;
    map['captchaOriginal'] = _captchaOriginal;
    map['password'] = _password;
    return map;
  }
}

import 'dart:convert';

/// mobile : "9104661798"
/// email : ""
/// otp : "121227"
/// password : ""
/// userType : 1
/// browserName : "Chrome"
/// browserVersion : "116.0.0.0"
/// device : "Unknown"
/// deviceType : "desktop"
/// deviceOs : "Windows"
/// deviceOsVersion : "windows-10"
/// userAgent : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"

LoginRequest loginFromJson(String str) => LoginRequest.fromJson(json.decode(str));
String loginToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest(
      {String? mobile,
      String? email,
      String? otp,
      String? password,
      num? userType,
      String? browserName,
      String? browserVersion,
      String? device,
      String? deviceType,
      String? deviceOs,
      String? deviceOsVersion,
      String? userAgent,
      num? notificationMasterId}) {
    _mobile = mobile;
    _email = email;
    _otp = otp;
    _password = password;
    _userType = userType;
    _browserName = browserName;
    _browserVersion = browserVersion;
    _device = device;
    _deviceType = deviceType;
    _deviceOs = deviceOs;
    _deviceOsVersion = deviceOsVersion;
    _userAgent = userAgent;
    _notificationMasterId = notificationMasterId;
  }

  LoginRequest.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _email = json['email'];
    _otp = json['otp'];
    _password = json['password'];
    _userType = json['userType'];
    _browserName = json['browserName'];
    _browserVersion = json['browserVersion'];
    _device = json['device'];
    _deviceType = json['deviceType'];
    _deviceOs = json['deviceOs'];
    _deviceOsVersion = json['deviceOsVersion'];
    _userAgent = json['userAgent'];
    _notificationMasterId = json['notificationMasterId'];
  }
  String? _mobile;
  String? _email;
  String? _otp;
  String? _password;
  num? _userType;
  String? _browserName;
  String? _browserVersion;
  String? _device;
  String? _deviceType;
  String? _deviceOs;
  num? _notificationMasterId;
  String? _deviceOsVersion;
  String? _userAgent;
  LoginRequest copyWith(
          {String? mobile,
          String? email,
          String? otp,
          String? password,
          num? userType,
          String? browserName,
          String? browserVersion,
          String? device,
          String? deviceType,
          String? deviceOs,
          String? deviceOsVersion,
          String? userAgent,
          num? notificationMasterId}) =>
      LoginRequest(
          mobile: mobile ?? _mobile,
          email: email ?? _email,
          otp: otp ?? _otp,
          password: password ?? _password,
          userType: userType ?? _userType,
          browserName: browserName ?? _browserName,
          browserVersion: browserVersion ?? _browserVersion,
          device: device ?? _device,
          deviceType: deviceType ?? _deviceType,
          deviceOs: deviceOs ?? _deviceOs,
          deviceOsVersion: deviceOsVersion ?? _deviceOsVersion,
          userAgent: userAgent ?? _userAgent,
          notificationMasterId: notificationMasterId ?? _notificationMasterId);
  String? get mobile => _mobile;
  String? get email => _email;
  String? get otp => _otp;
  String? get password => _password;
  num? get userType => _userType;
  String? get browserName => _browserName;
  String? get browserVersion => _browserVersion;
  String? get device => _device;
  String? get deviceType => _deviceType;
  String? get deviceOs => _deviceOs;
  String? get deviceOsVersion => _deviceOsVersion;
  String? get userAgent => _userAgent;
  num? get notificationMasterId => _notificationMasterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['otp'] = _otp;
    map['password'] = _password;
    map['userType'] = _userType;
    map['browserName'] = _browserName;
    map['browserVersion'] = _browserVersion;
    map['device'] = _device;
    map['deviceType'] = _deviceType;
    map['deviceOs'] = _deviceOs;
    map['deviceOsVersion'] = _deviceOsVersion;
    map['userAgent'] = _userAgent;
    map['notificationMasterId'] = _notificationMasterId;
    return map;
  }
}

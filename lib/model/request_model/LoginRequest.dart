import 'dart:convert';

LoginRequest loginRequestModelFromJson(String str) => LoginRequest.fromJson(json.decode(str));
String loginRequestModelToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    String? email,
    String? password,
    String? userType,
    String? browserName,
    String? browserVersion,
    String? device,
    String? deviceType,
    String? deviceOs,
    String? deviceOsVersion,
    String? userAgent,
  }) {
    _email = email;
    _password = password;
    _userType = userType;
    _browserName = browserName;
    _browserVersion = browserVersion;
    _device = device;
    _deviceType = deviceType;
    _deviceOs = deviceOs;
    _deviceOsVersion = deviceOsVersion;
    _userAgent = userAgent;
  }

  LoginRequest.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _userType = json['userType'];
    _browserName = json['browserName'];
    _browserVersion = json['browserVersion'];
    _device = json['device'];
    _deviceType = json['deviceType'];
    _deviceOs = json['deviceOs'];
    _deviceOsVersion = json['deviceOsVersion'];
    _userAgent = json['userAgent'];
  }
  String? _email;
  String? _password;
  String? _userType;
  String? _browserName;
  String? _browserVersion;
  String? _device;
  String? _deviceType;
  String? _deviceOs;
  String? _deviceOsVersion;
  String? _userAgent;
  LoginRequest copyWith({
    String? email,
    String? password,
    String? userType,
    String? browserName,
    String? browserVersion,
    String? device,
    String? deviceType,
    String? deviceOs,
    String? deviceOsVersion,
    String? userAgent,
  }) =>
      LoginRequest(
        email: email ?? _email,
        password: password ?? _password,
        userType: userType ?? _userType,
        browserName: browserName ?? _browserName,
        browserVersion: browserVersion ?? _browserVersion,
        device: device ?? _device,
        deviceType: deviceType ?? _deviceType,
        deviceOs: deviceOs ?? _deviceOs,
        deviceOsVersion: deviceOsVersion ?? _deviceOsVersion,
        userAgent: userAgent ?? _userAgent,
      );
  String? get email => _email;
  String? get password => _password;
  String? get userType => _userType;
  String? get browserName => _browserName;
  String? get browserVersion => _browserVersion;
  String? get device => _device;
  String? get deviceType => _deviceType;
  String? get deviceOs => _deviceOs;
  String? get deviceOsVersion => _deviceOsVersion;
  String? get userAgent => _userAgent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['userType'] = _userType;
    map['browserName'] = _browserName;
    map['browserVersion'] = _browserVersion;
    map['device'] = _device;
    map['deviceType'] = _deviceType;
    map['deviceOs'] = _deviceOs;
    map['deviceOsVersion'] = _deviceOsVersion;
    map['userAgent'] = _userAgent;
    return map;
  }
}

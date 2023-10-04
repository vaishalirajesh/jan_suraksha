import 'dart:convert';

/// email : "hello23@opl.com"
/// userType : "1"
/// domain : "https://qa-jns.instantmseloans.in"
/// notificationMasterId : 1

ForgotPasswordRequest forgotPasswordRequestFromJson(String str) => ForgotPasswordRequest.fromJson(json.decode(str));
String forgotPasswordRequestToJson(ForgotPasswordRequest data) => json.encode(data.toJson());

class ForgotPasswordRequest {
  ForgotPasswordRequest({
    String? email,
    String? userType,
    String? domain,
    num? notificationMasterId,
  }) {
    _email = email;
    _userType = userType;
    _domain = domain;
    _notificationMasterId = notificationMasterId;
  }

  ForgotPasswordRequest.fromJson(dynamic json) {
    _email = json['email'];
    _userType = json['userType'];
    _domain = json['domain'];
    _notificationMasterId = json['notificationMasterId'];
  }
  String? _email;
  String? _userType;
  String? _domain;
  num? _notificationMasterId;
  ForgotPasswordRequest copyWith({
    String? email,
    String? userType,
    String? domain,
    num? notificationMasterId,
  }) =>
      ForgotPasswordRequest(
        email: email ?? _email,
        userType: userType ?? _userType,
        domain: domain ?? _domain,
        notificationMasterId: notificationMasterId ?? _notificationMasterId,
      );
  String? get email => _email;
  String? get userType => _userType;
  String? get domain => _domain;
  num? get notificationMasterId => _notificationMasterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['userType'] = _userType;
    map['domain'] = _domain;
    map['notificationMasterId'] = _notificationMasterId;
    return map;
  }
}

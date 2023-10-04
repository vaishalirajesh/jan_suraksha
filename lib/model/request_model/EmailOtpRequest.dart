import 'dart:convert';

/// email : "kp@onlinepsbloans.com"
/// userId : 9492
/// otpType : 2
/// notificationMasterId : 1

EmailOtpRequest emailOtpRequestFromJson(String str) => EmailOtpRequest.fromJson(json.decode(str));
String emailOtpRequestToJson(EmailOtpRequest data) => json.encode(data.toJson());

class EmailOtpRequest {
  EmailOtpRequest({
    String? email,
    num? userId,
    num? otpType,
    num? notificationMasterId,
  }) {
    _email = email;
    _userId = userId;
    _otpType = otpType;
    _notificationMasterId = notificationMasterId;
  }

  EmailOtpRequest.fromJson(dynamic json) {
    _email = json['email'];
    _userId = json['userId'];
    _otpType = json['otpType'];
    _notificationMasterId = json['notificationMasterId'];
  }
  String? _email;
  num? _userId;
  num? _otpType;
  num? _notificationMasterId;
  EmailOtpRequest copyWith({
    String? email,
    num? userId,
    num? otpType,
    num? notificationMasterId,
  }) =>
      EmailOtpRequest(
        email: email ?? _email,
        userId: userId ?? _userId,
        otpType: otpType ?? _otpType,
        notificationMasterId: notificationMasterId ?? _notificationMasterId,
      );
  String? get email => _email;
  num? get userId => _userId;
  num? get otpType => _otpType;
  num? get notificationMasterId => _notificationMasterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['userId'] = _userId;
    map['otpType'] = _otpType;
    map['notificationMasterId'] = _notificationMasterId;
    return map;
  }
}

import 'dart:convert';

/// email : "kp@onlinepsbloans.com"
/// userId : 9492

EmailOtpRequest emailOtpRequestFromJson(String str) => EmailOtpRequest.fromJson(json.decode(str));
String emailOtpRequestToJson(EmailOtpRequest data) => json.encode(data.toJson());

class EmailOtpRequest {
  EmailOtpRequest({String? email, num? userId, num? otptype, num? notificationMasterId}) {
    _email = email;
    _userId = userId;
    _otptype = otptype;
    _notificationMasterId = notificationMasterId;
  }

  EmailOtpRequest.fromJson(dynamic json) {
    _email = json['email'];
    _userId = json['userId'];
    _otptype = json['otpType'];
    _notificationMasterId = json['notificationMasterId'];
  }
  String? _email;
  num? _userId;
  num? _otptype;
  num? _notificationMasterId;
  EmailOtpRequest copyWith({
    String? email,
    num? userId,
    num? otptype,
    num? notificationMasterId,
  }) =>
      EmailOtpRequest(
        email: email ?? _email,
        userId: userId ?? _userId,
        otptype: otptype ?? _otptype,
        notificationMasterId: notificationMasterId ?? _notificationMasterId,
      );
  String? get email => _email;
  num? get userId => _userId;
  num? get otptype => _otptype;
  num? get notificationMasterId => _notificationMasterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['userId'] = _userId;
    map['otpType'] = _otptype;
    map['notificationMasterId'] = _notificationMasterId;
    return map;
  }
}

import 'dart:convert';

/// email : "kp@onlinepsbloans.com"
/// userId : 9492

EmailOtpRequest emailOtpRequestFromJson(String str) => EmailOtpRequest.fromJson(json.decode(str));
String emailOtpRequestToJson(EmailOtpRequest data) => json.encode(data.toJson());

class EmailOtpRequest {
  EmailOtpRequest({String? email, num? userId, num? otptype}) {
    _email = email;
    _userId = userId;
    _otptype = otptype;
  }

  EmailOtpRequest.fromJson(dynamic json) {
    _email = json['email'];
    _userId = json['userId'];
    _otptype = json['otpType'];
  }
  String? _email;
  num? _userId;
  num? _otptype;
  EmailOtpRequest copyWith({
    String? email,
    num? userId,
    num? otptype,
  }) =>
      EmailOtpRequest(
        email: email ?? _email,
        userId: userId ?? _userId,
        otptype: otptype ?? _otptype,
      );
  String? get email => _email;
  num? get userId => _userId;
  num? get otptype => _otptype;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['userId'] = _userId;
    map['otpType'] = _otptype;
    return map;
  }
}

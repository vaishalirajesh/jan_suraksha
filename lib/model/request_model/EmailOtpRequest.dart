import 'dart:convert';

/// email : "kp@onlinepsbloans.com"
/// userId : 9492

EmailOtpRequest emailOtpRequestFromJson(String str) => EmailOtpRequest.fromJson(json.decode(str));
String emailOtpRequestToJson(EmailOtpRequest data) => json.encode(data.toJson());

class EmailOtpRequest {
  EmailOtpRequest({
    String? email,
    num? userId,
  }) {
    _email = email;
    _userId = userId;
  }

  EmailOtpRequest.fromJson(dynamic json) {
    _email = json['email'];
    _userId = json['userId'];
  }
  String? _email;
  num? _userId;
  EmailOtpRequest copyWith({
    String? email,
    num? userId,
  }) =>
      EmailOtpRequest(
        email: email ?? _email,
        userId: userId ?? _userId,
      );
  String? get email => _email;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['userId'] = _userId;
    return map;
  }
}

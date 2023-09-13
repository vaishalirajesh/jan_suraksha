import 'dart:convert';

VerifyLoginOtpRequest verifyLoginOtpRequestFromJson(String str) => VerifyLoginOtpRequest.fromJson(json.decode(str));
String verifyLoginOtpRequestToJson(VerifyLoginOtpRequest data) => json.encode(data.toJson());

class VerifyLoginOtpRequest {
  VerifyLoginOtpRequest({
    String? otp,
    String? email,
    num? userType,
  }) {
    _otp = otp;
    _email = email;
    _userType = userType;
  }

  VerifyLoginOtpRequest.fromJson(dynamic json) {
    _otp = json['otp'];
    _email = json['email'];
    _userType = json['userType'];
  }
  String? _otp;
  String? _email;
  num? _userType;
  VerifyLoginOtpRequest copyWith({
    String? otp,
    String? email,
    num? userType,
  }) =>
      VerifyLoginOtpRequest(
        otp: otp ?? _otp,
        email: email ?? _email,
        userType: userType ?? _userType,
      );
  String? get otp => _otp;
  String? get email => _email;
  num? get userType => _userType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = _otp;
    map['email'] = _email;
    map['userType'] = _userType;
    return map;
  }
}

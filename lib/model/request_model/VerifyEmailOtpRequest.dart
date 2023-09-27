import 'dart:convert';

/// otpType : 2
/// otp : "411336"
/// userId : 9492
/// email : "kp@onlinepsbloans.com"

VerifyEmailOtpRequest verifyEmailOtpRequestFromJson(String str) => VerifyEmailOtpRequest.fromJson(json.decode(str));
String verifyEmailOtpRequestToJson(VerifyEmailOtpRequest data) => json.encode(data.toJson());

class VerifyEmailOtpRequest {
  VerifyEmailOtpRequest({
    num? otpType,
    String? otp,
    num? userId,
    String? email,
  }) {
    _otpType = otpType;
    _otp = otp;
    _userId = userId;
    _email = email;
  }

  VerifyEmailOtpRequest.fromJson(dynamic json) {
    _otpType = json['otpType'];
    _otp = json['otp'];
    _userId = json['userId'];
    _email = json['email'];
  }
  num? _otpType;
  String? _otp;
  num? _userId;
  String? _email;
  VerifyEmailOtpRequest copyWith({
    num? otpType,
    String? otp,
    num? userId,
    String? email,
  }) =>
      VerifyEmailOtpRequest(
        otpType: otpType ?? _otpType,
        otp: otp ?? _otp,
        userId: userId ?? _userId,
        email: email ?? _email,
      );
  num? get otpType => _otpType;
  String? get otp => _otp;
  num? get userId => _userId;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otpType'] = _otpType;
    map['otp'] = _otp;
    map['userId'] = _userId;
    map['email'] = _email;
    return map;
  }
}

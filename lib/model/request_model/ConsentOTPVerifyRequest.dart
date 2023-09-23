import 'dart:convert';

/// otpRequestType : 5
/// email : "opl@opl.com"
/// otp : "428451"
/// userType : 2

ConsentOtpVerifyRequest consentOtpVerifyRequestFromJson(String str) =>
    ConsentOtpVerifyRequest.fromJson(json.decode(str));
String consentOtpVerifyRequestToJson(ConsentOtpVerifyRequest data) => json.encode(data.toJson());

class ConsentOtpVerifyRequest {
  ConsentOtpVerifyRequest({
    num? otpRequestType,
    String? email,
    String? otp,
    num? userType,
  }) {
    _otpRequestType = otpRequestType;
    _email = email;
    _otp = otp;
    _userType = userType;
  }

  ConsentOtpVerifyRequest.fromJson(dynamic json) {
    _otpRequestType = json['otpRequestType'];
    _email = json['email'];
    _otp = json['otp'];
    _userType = json['userType'];
  }
  num? _otpRequestType;
  String? _email;
  String? _otp;
  num? _userType;
  ConsentOtpVerifyRequest copyWith({
    num? otpRequestType,
    String? email,
    String? otp,
    num? userType,
  }) =>
      ConsentOtpVerifyRequest(
        otpRequestType: otpRequestType ?? _otpRequestType,
        email: email ?? _email,
        otp: otp ?? _otp,
        userType: userType ?? _userType,
      );
  num? get otpRequestType => _otpRequestType;
  String? get email => _email;
  String? get otp => _otp;
  num? get userType => _userType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otpRequestType'] = _otpRequestType;
    map['email'] = _email;
    map['otp'] = _otp;
    map['userType'] = _userType;
    return map;
  }
}

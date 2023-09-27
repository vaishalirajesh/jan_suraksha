import 'dart:convert';

/// otpType : 1
/// otp : "163337"
/// userId : 9492
/// mobile : "6454744948"

VerifySignupOtpRequest verifySignupOtpRequestFromJson(String str) => VerifySignupOtpRequest.fromJson(json.decode(str));
String verifySignupOtpRequestToJson(VerifySignupOtpRequest data) => json.encode(data.toJson());

class VerifySignupOtpRequest {
  VerifySignupOtpRequest({
    num? otpType,
    String? otp,
    num? userId,
    String? mobile,
  }) {
    _otpType = otpType;
    _otp = otp;
    _userId = userId;
    _mobile = mobile;
  }

  VerifySignupOtpRequest.fromJson(dynamic json) {
    _otpType = json['otpType'];
    _otp = json['otp'];
    _userId = json['userId'];
    _mobile = json['mobile'];
  }
  num? _otpType;
  String? _otp;
  num? _userId;
  String? _mobile;
  VerifySignupOtpRequest copyWith({
    num? otpType,
    String? otp,
    num? userId,
    String? mobile,
  }) =>
      VerifySignupOtpRequest(
        otpType: otpType ?? _otpType,
        otp: otp ?? _otp,
        userId: userId ?? _userId,
        mobile: mobile ?? _mobile,
      );
  num? get otpType => _otpType;
  String? get otp => _otp;
  num? get userId => _userId;
  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otpType'] = _otpType;
    map['otp'] = _otp;
    map['userId'] = _userId;
    map['mobile'] = _mobile;
    return map;
  }
}

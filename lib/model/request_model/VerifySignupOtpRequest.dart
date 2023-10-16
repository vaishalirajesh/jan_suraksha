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
    String? email,
  }) {
    _otpType = otpType;
    _otp = otp;
    _userId = userId;
    _mobile = mobile;
    _email = email;
  }

  VerifySignupOtpRequest.fromJson(dynamic json) {
    _otpType = json['otpType'];
    _otp = json['otp'];
    _userId = json['userId'];
    _mobile = json['mobile'];
    _email = json['email'];
  }
  num? _otpType;
  String? _otp;
  num? _userId;
  String? _mobile;
  String? _email;
  VerifySignupOtpRequest copyWith({
    num? otpType,
    String? otp,
    num? userId,
    String? mobile,
    String? email,
  }) =>
      VerifySignupOtpRequest(
        otpType: otpType ?? _otpType,
        otp: otp ?? _otp,
        userId: userId ?? _userId,
        mobile: mobile ?? _mobile,
        email: email ?? _email,
      );
  num? get otpType => _otpType;
  String? get otp => _otp;
  num? get userId => _userId;
  String? get mobile => _mobile;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otpType'] = _otpType;
    map['otp'] = _otp;
    map['userId'] = _userId;
    map['email'] = _email;
    map['mobile'] = _mobile;
    if (_email == null) {
    } else {
      map['email'] = _email;
    }
    return map;
  }
}

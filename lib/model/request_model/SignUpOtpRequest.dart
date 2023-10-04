import 'dart:convert';

/// mobile : "6454744948"
/// name : "Kp singh"
/// otpType : 1
/// userType : 1
/// captchaOriginal : "123123"
/// captchaEnter : "123123"
/// isTermsAccepted : true
/// notificationMasterId : 1

SignUpOtpRequest signUpOtpRequestFromJson(String str) => SignUpOtpRequest.fromJson(json.decode(str));
String signUpOtpRequestToJson(SignUpOtpRequest data) => json.encode(data.toJson());

class SignUpOtpRequest {
  SignUpOtpRequest({
    String? mobile,
    String? name,
    num? otpType,
    num? userType,
    String? captchaOriginal,
    String? captchaEnter,
    bool? isTermsAccepted,
    num? notificationMasterId,
  }) {
    _mobile = mobile;
    _name = name;
    _otpType = otpType;
    _userType = userType;
    _captchaOriginal = captchaOriginal;
    _captchaEnter = captchaEnter;
    _isTermsAccepted = isTermsAccepted;
    _notificationMasterId = notificationMasterId;
  }

  SignUpOtpRequest.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _name = json['name'];
    _otpType = json['otpType'];
    _userType = json['userType'];
    _captchaOriginal = json['captchaOriginal'];
    _captchaEnter = json['captchaEnter'];
    _isTermsAccepted = json['isTermsAccepted'];
    _notificationMasterId = json['notificationMasterId'];
  }
  String? _mobile;
  String? _name;
  num? _otpType;
  num? _userType;
  String? _captchaOriginal;
  String? _captchaEnter;
  bool? _isTermsAccepted;
  num? _notificationMasterId;
  SignUpOtpRequest copyWith({
    String? mobile,
    String? name,
    num? otpType,
    num? userType,
    String? captchaOriginal,
    String? captchaEnter,
    bool? isTermsAccepted,
    num? notificationMasterId,
  }) =>
      SignUpOtpRequest(
        mobile: mobile ?? _mobile,
        name: name ?? _name,
        otpType: otpType ?? _otpType,
        userType: userType ?? _userType,
        captchaOriginal: captchaOriginal ?? _captchaOriginal,
        captchaEnter: captchaEnter ?? _captchaEnter,
        isTermsAccepted: isTermsAccepted ?? _isTermsAccepted,
        notificationMasterId: notificationMasterId ?? _notificationMasterId,
      );
  String? get mobile => _mobile;
  String? get name => _name;
  num? get otpType => _otpType;
  num? get userType => _userType;
  String? get captchaOriginal => _captchaOriginal;
  String? get captchaEnter => _captchaEnter;
  bool? get isTermsAccepted => _isTermsAccepted;
  num? get notificationMasterId => _notificationMasterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['name'] = _name;
    map['otpType'] = _otpType;
    map['userType'] = _userType;
    map['captchaOriginal'] = _captchaOriginal;
    map['captchaEnter'] = _captchaEnter;
    map['isTermsAccepted'] = _isTermsAccepted;
    map['notificationMasterId'] = _notificationMasterId;
    return map;
  }
}

import 'dart:convert';

/// mobile : "6454744948"
/// userType : 1
/// isTermsAccepted : true
/// otpType : 3
/// userId : 9492

OtpConsentRequest otpConsentRequestFromJson(String str) => OtpConsentRequest.fromJson(json.decode(str));
String otpConsentRequestToJson(OtpConsentRequest data) => json.encode(data.toJson());

class OtpConsentRequest {
  OtpConsentRequest({
    String? mobile,
    num? userType,
    bool? isTermsAccepted,
    num? otpType,
    num? userId,
  }) {
    _mobile = mobile;
    _userType = userType;
    _isTermsAccepted = isTermsAccepted;
    _otpType = otpType;
    _userId = userId;
  }

  OtpConsentRequest.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _userType = json['userType'];
    _isTermsAccepted = json['isTermsAccepted'];
    _otpType = json['otpType'];
    _userId = json['userId'];
  }
  String? _mobile;
  num? _userType;
  bool? _isTermsAccepted;
  num? _otpType;
  num? _userId;
  OtpConsentRequest copyWith({
    String? mobile,
    num? userType,
    bool? isTermsAccepted,
    num? otpType,
    num? userId,
  }) =>
      OtpConsentRequest(
        mobile: mobile ?? _mobile,
        userType: userType ?? _userType,
        isTermsAccepted: isTermsAccepted ?? _isTermsAccepted,
        otpType: otpType ?? _otpType,
        userId: userId ?? _userId,
      );
  String? get mobile => _mobile;
  num? get userType => _userType;
  bool? get isTermsAccepted => _isTermsAccepted;
  num? get otpType => _otpType;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['userType'] = _userType;
    map['isTermsAccepted'] = _isTermsAccepted;
    map['otpType'] = _otpType;
    map['userId'] = _userId;
    return map;
  }
}

import 'dart:convert';

/// mobile : "9864654654"
/// userId : 9766
/// notificationMasterId : 18
/// userType : 1
/// otpType : 1

OtpConsentRequest otpConsentRequestFromJson(String str) => OtpConsentRequest.fromJson(json.decode(str));
String otpConsentRequestToJson(OtpConsentRequest data) => json.encode(data.toJson());

class OtpConsentRequest {
  OtpConsentRequest({
    String? mobile,
    num? userId,
    num? notificationMasterId,
    num? userType,
    num? otpType,
  }) {
    _mobile = mobile;
    _userId = userId;
    _notificationMasterId = notificationMasterId;
    _userType = userType;
    _otpType = otpType;
  }

  OtpConsentRequest.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _userId = json['userId'];
    _notificationMasterId = json['notificationMasterId'];
    _userType = json['userType'];
    _otpType = json['otpType'];
  }
  String? _mobile;
  num? _userId;
  num? _notificationMasterId;
  num? _userType;
  num? _otpType;
  OtpConsentRequest copyWith({
    String? mobile,
    num? userId,
    num? notificationMasterId,
    num? userType,
    num? otpType,
  }) =>
      OtpConsentRequest(
        mobile: mobile ?? _mobile,
        userId: userId ?? _userId,
        notificationMasterId: notificationMasterId ?? _notificationMasterId,
        userType: userType ?? _userType,
        otpType: otpType ?? _otpType,
      );
  String? get mobile => _mobile;
  num? get userId => _userId;
  num? get notificationMasterId => _notificationMasterId;
  num? get userType => _userType;
  num? get otpType => _otpType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['userId'] = _userId;
    map['notificationMasterId'] = _notificationMasterId;
    map['userType'] = _userType;
    map['otpType'] = _otpType;
    return map;
  }
}

import 'dart:convert';

/// email : "opl@opl.com"
/// userType : "1"
/// isTermsAccepted : true
/// firstName : "nimesh"
/// middleName : "nimesh"
/// lastName : "nimesh"
/// otpRequestType : 5

ConsentOtpSendRequest consentOtpSendRequestFromJson(String str) => ConsentOtpSendRequest.fromJson(json.decode(str));
String consentOtpSendRequestToJson(ConsentOtpSendRequest data) => json.encode(data.toJson());

class ConsentOtpSendRequest {
  ConsentOtpSendRequest({
    String? email,
    String? userType,
    bool? isTermsAccepted,
    String? firstName,
    String? middleName,
    String? lastName,
    num? otpRequestType,
  }) {
    _email = email;
    _userType = userType;
    _isTermsAccepted = isTermsAccepted;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _otpRequestType = otpRequestType;
  }

  ConsentOtpSendRequest.fromJson(dynamic json) {
    _email = json['email'];
    _userType = json['userType'];
    _isTermsAccepted = json['isTermsAccepted'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _otpRequestType = json['otpRequestType'];
  }
  String? _email;
  String? _userType;
  bool? _isTermsAccepted;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  num? _otpRequestType;
  ConsentOtpSendRequest copyWith({
    String? email,
    String? userType,
    bool? isTermsAccepted,
    String? firstName,
    String? middleName,
    String? lastName,
    num? otpRequestType,
  }) =>
      ConsentOtpSendRequest(
        email: email ?? _email,
        userType: userType ?? _userType,
        isTermsAccepted: isTermsAccepted ?? _isTermsAccepted,
        firstName: firstName ?? _firstName,
        middleName: middleName ?? _middleName,
        lastName: lastName ?? _lastName,
        otpRequestType: otpRequestType ?? _otpRequestType,
      );
  String? get email => _email;
  String? get userType => _userType;
  bool? get isTermsAccepted => _isTermsAccepted;
  String? get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  num? get otpRequestType => _otpRequestType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['userType'] = _userType;
    map['isTermsAccepted'] = _isTermsAccepted;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['otpRequestType'] = _otpRequestType;
    return map;
  }
}

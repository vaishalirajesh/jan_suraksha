import 'dart:convert';

/// email : "pp@opl.com"
/// mobile : "9624514111"
/// userId : 10512
/// schemeId : 1
/// emailNotiMasterId : 15
/// smsNotiMasterId : 20
/// otpType : 3

OptOUtConsentRequest optOUtConsentFromJson(String str) => OptOUtConsentRequest.fromJson(json.decode(str));
String optOUtConsentToJson(OptOUtConsentRequest data) => json.encode(data.toJson());

class OptOUtConsentRequest {
  OptOUtConsentRequest({
    String? email,
    String? mobile,
    num? userId,
    num? schemeId,
    num? emailNotiMasterId,
    num? smsNotiMasterId,
    num? otpType,
  }) {
    _email = email;
    _mobile = mobile;
    _userId = userId;
    _schemeId = schemeId;
    _emailNotiMasterId = emailNotiMasterId;
    _smsNotiMasterId = smsNotiMasterId;
    _otpType = otpType;
  }

  OptOUtConsentRequest.fromJson(dynamic json) {
    _email = json['email'];
    _mobile = json['mobile'];
    _userId = json['userId'];
    _schemeId = json['schemeId'];
    _emailNotiMasterId = json['emailNotiMasterId'];
    _smsNotiMasterId = json['smsNotiMasterId'];
    _otpType = json['otpType'];
  }
  String? _email;
  String? _mobile;
  num? _userId;
  num? _schemeId;
  num? _emailNotiMasterId;
  num? _smsNotiMasterId;
  num? _otpType;
  OptOUtConsentRequest copyWith({
    String? email,
    String? mobile,
    num? userId,
    num? schemeId,
    num? emailNotiMasterId,
    num? smsNotiMasterId,
    num? otpType,
  }) =>
      OptOUtConsentRequest(
        email: email ?? _email,
        mobile: mobile ?? _mobile,
        userId: userId ?? _userId,
        schemeId: schemeId ?? _schemeId,
        emailNotiMasterId: emailNotiMasterId ?? _emailNotiMasterId,
        smsNotiMasterId: smsNotiMasterId ?? _smsNotiMasterId,
        otpType: otpType ?? _otpType,
      );
  String? get email => _email;
  String? get mobile => _mobile;
  num? get userId => _userId;
  num? get schemeId => _schemeId;
  num? get emailNotiMasterId => _emailNotiMasterId;
  num? get smsNotiMasterId => _smsNotiMasterId;
  num? get otpType => _otpType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['userId'] = _userId;
    map['schemeId'] = _schemeId;
    map['emailNotiMasterId'] = _emailNotiMasterId;
    map['smsNotiMasterId'] = _smsNotiMasterId;
    map['otpType'] = _otpType;
    return map;
  }
}

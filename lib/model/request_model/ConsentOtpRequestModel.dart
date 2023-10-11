import 'dart:convert';

/// email : "pp@opl.com"
/// mobile : "9624514111"
/// userId : 10512
/// schemeId : 1

ConsentOtpRequestModel consentOtpRequestModelFromJson(String str) => ConsentOtpRequestModel.fromJson(json.decode(str));
String consentOtpRequestModelToJson(ConsentOtpRequestModel data) => json.encode(data.toJson());

class ConsentOtpRequestModel {
  ConsentOtpRequestModel({
    String? email,
    String? mobile,
    num? userId,
    num? schemeId,
  }) {
    _email = email;
    _mobile = mobile;
    _userId = userId;
    _schemeId = schemeId;
  }

  ConsentOtpRequestModel.fromJson(dynamic json) {
    _email = json['email'];
    _mobile = json['mobile'];
    _userId = json['userId'];
    _schemeId = json['schemeId'];
  }
  String? _email;
  String? _mobile;
  num? _userId;
  num? _schemeId;
  ConsentOtpRequestModel copyWith({
    String? email,
    String? mobile,
    num? userId,
    num? schemeId,
  }) =>
      ConsentOtpRequestModel(
        email: email ?? _email,
        mobile: mobile ?? _mobile,
        userId: userId ?? _userId,
        schemeId: schemeId ?? _schemeId,
      );
  String? get email => _email;
  String? get mobile => _mobile;
  num? get userId => _userId;
  num? get schemeId => _schemeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['userId'] = _userId;
    map['schemeId'] = _schemeId;
    return map;
  }
}

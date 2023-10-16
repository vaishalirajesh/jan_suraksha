import 'dart:convert';

/// id : null
/// message : "OTP sent successfully !!"
/// data : {"isSentMobile":true,"isSentEmail":true}
/// status : 200
/// flag : null

OptOutConsentResponseMain optOutConsentResponseMainFromJson(String str) =>
    OptOutConsentResponseMain.fromJson(json.decode(str));
String optOutConsentResponseMainToJson(OptOutConsentResponseMain data) => json.encode(data.toJson());

class OptOutConsentResponseMain {
  OptOutConsentResponseMain({
    dynamic id,
    String? message,
    Data? data,
    int? status,
    dynamic flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  OptOutConsentResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _flag = json['flag'];
  }
  dynamic _id;
  String? _message;
  Data? _data;
  int? _status;
  dynamic _flag;
  OptOutConsentResponseMain copyWith({
    dynamic id,
    String? message,
    Data? data,
    int? status,
    dynamic flag,
  }) =>
      OptOutConsentResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );
  dynamic get id => _id;
  String? get message => _message;
  Data? get data => _data;
  int? get status => _status;
  dynamic get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['flag'] = _flag;
    return map;
  }
}

/// isSentMobile : true
/// isSentEmail : true

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    bool? isSentMobile,
    bool? isSentEmail,
  }) {
    _isSentMobile = isSentMobile;
    _isSentEmail = isSentEmail;
  }

  Data.fromJson(dynamic json) {
    _isSentMobile = json['isSentMobile'];
    _isSentEmail = json['isSentEmail'];
  }
  bool? _isSentMobile;
  bool? _isSentEmail;
  Data copyWith({
    bool? isSentMobile,
    bool? isSentEmail,
  }) =>
      Data(
        isSentMobile: isSentMobile ?? _isSentMobile,
        isSentEmail: isSentEmail ?? _isSentEmail,
      );
  bool? get isSentMobile => _isSentMobile;
  bool? get isSentEmail => _isSentEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSentMobile'] = _isSentMobile;
    map['isSentEmail'] = _isSentEmail;
    return map;
  }
}

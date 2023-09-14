import 'dart:convert';

UpdateEnrollmentVerificationTypeResponseMain updateEnrollmentVerificationTypeResponseMainFromJson(String str) =>
    UpdateEnrollmentVerificationTypeResponseMain.fromJson(json.decode(str));
String updateEnrollmentVerificationTypeResponseMainToJson(UpdateEnrollmentVerificationTypeResponseMain data) =>
    json.encode(data.toJson());

class UpdateEnrollmentVerificationTypeResponseMain {
  UpdateEnrollmentVerificationTypeResponseMain({
    dynamic id,
    String? message,
    dynamic data,
    num? status,
    bool? flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  UpdateEnrollmentVerificationTypeResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _data = json['data'];
    _status = json['status'];
    _flag = json['flag'];
  }
  dynamic _id;
  String? _message;
  dynamic _data;
  num? _status;
  bool? _flag;
  UpdateEnrollmentVerificationTypeResponseMain copyWith({
    dynamic id,
    String? message,
    dynamic data,
    num? status,
    bool? flag,
  }) =>
      UpdateEnrollmentVerificationTypeResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );
  dynamic get id => _id;
  String? get message => _message;
  dynamic get data => _data;
  num? get status => _status;
  bool? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    map['data'] = _data;
    map['status'] = _status;
    map['flag'] = _flag;
    return map;
  }
}
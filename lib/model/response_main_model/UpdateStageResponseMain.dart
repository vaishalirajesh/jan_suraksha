import 'dart:convert';

UpdateStageResponseMain updateStageResponseMainFromJson(String str) =>
    UpdateStageResponseMain.fromJson(json.decode(str));
String updateStageResponseMainToJson(UpdateStageResponseMain data) => json.encode(data.toJson());

class UpdateStageResponseMain {
  UpdateStageResponseMain({
    dynamic id,
    String? message,
    num? data,
    num? status,
    bool? flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  UpdateStageResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _data = json['data'];
    _status = json['status'];
    _flag = json['flag'];
  }
  dynamic _id;
  String? _message;
  num? _data;
  num? _status;
  bool? _flag;
  UpdateStageResponseMain copyWith({
    dynamic id,
    String? message,
    num? data,
    num? status,
    bool? flag,
  }) =>
      UpdateStageResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );
  dynamic get id => _id;
  String? get message => _message;
  num? get data => _data;
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

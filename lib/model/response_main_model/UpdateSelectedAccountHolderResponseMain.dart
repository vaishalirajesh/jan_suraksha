import 'dart:convert';

UpdateSelectedAccountHolderResponseMain updateSelectedAccountHolderResponseMainFromJson(String str) =>
    UpdateSelectedAccountHolderResponseMain.fromJson(json.decode(str));
String updateSelectedAccountHolderResponseMainToJson(UpdateSelectedAccountHolderResponseMain data) =>
    json.encode(data.toJson());

class UpdateSelectedAccountHolderResponseMain {
  UpdateSelectedAccountHolderResponseMain({
    dynamic id,
    String? message,
    dynamic data,
    int? status,
    bool? flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  UpdateSelectedAccountHolderResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _data = json['data'];
    _status = json['status'];
    _flag = json['flag'];
  }
  dynamic _id;
  String? _message;
  dynamic _data;
  int? _status;
  bool? _flag;
  UpdateSelectedAccountHolderResponseMain copyWith({
    dynamic id,
    String? message,
    dynamic data,
    int? status,
    bool? flag,
  }) =>
      UpdateSelectedAccountHolderResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );
  dynamic get id => _id;
  String? get message => _message;
  dynamic get data => _data;
  int? get status => _status;
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

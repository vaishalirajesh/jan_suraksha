import 'dart:convert';

GetSchemaBYUserIdResponseMain getscheFromJson(String str) => GetSchemaBYUserIdResponseMain.fromJson(json.decode(str));

String getscheToJson(GetSchemaBYUserIdResponseMain data) => json.encode(data.toJson());

class GetSchemaBYUserIdResponseMain {
  GetSchemaBYUserIdResponseMain({
    dynamic id,
    String? message,
    int? status,
    String? data,
    dynamic flag,
    dynamic branchList,
    List<dynamic>? listData,
    dynamic lastBusinessTypeId,
    dynamic file,
    dynamic fromCSC,
  }) {
    _id = id;
    _message = message;
    _status = status;
    _data = data;
    _flag = flag;
    _branchList = branchList;
    _listData = listData;
    _lastBusinessTypeId = lastBusinessTypeId;
    _file = file;
    _fromCSC = fromCSC;
  }

  GetSchemaBYUserIdResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _status = json['status'];
    _data = json['data'];
    _flag = json['flag'];
    _branchList = json['branchList'];
    if (json['listData'] != null) {
      _listData = [];
      json['listData'].forEach((v) {
        _listData?.add(v);
      });
    }
    _lastBusinessTypeId = json['lastBusinessTypeId'];
    _file = json['file'];
    _fromCSC = json['fromCSC'];
  }

  dynamic _id;
  String? _message;
  int? _status;
  String? _data;
  dynamic _flag;
  dynamic _branchList;
  List<dynamic>? _listData;
  dynamic _lastBusinessTypeId;
  dynamic _file;
  dynamic _fromCSC;

  GetSchemaBYUserIdResponseMain copyWith({
    dynamic id,
    String? message,
    int? status,
    String? data,
    dynamic flag,
    dynamic branchList,
    List<dynamic>? listData,
    dynamic lastBusinessTypeId,
    dynamic file,
    dynamic fromCSC,
  }) =>
      GetSchemaBYUserIdResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        status: status ?? _status,
        data: data ?? _data,
        flag: flag ?? _flag,
        branchList: branchList ?? _branchList,
        listData: listData ?? _listData,
        lastBusinessTypeId: lastBusinessTypeId ?? _lastBusinessTypeId,
        file: file ?? _file,
        fromCSC: fromCSC ?? _fromCSC,
      );

  dynamic get id => _id;

  String? get message => _message;

  int? get status => _status;

  String? get data => _data;

  dynamic get flag => _flag;

  dynamic get branchList => _branchList;

  List<dynamic>? get listData => _listData;

  dynamic get lastBusinessTypeId => _lastBusinessTypeId;

  dynamic get file => _file;

  dynamic get fromCSC => _fromCSC;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    map['status'] = _status;
    map['data'] = _data;
    map['flag'] = _flag;
    map['branchList'] = _branchList;
    if (_listData != null) {
      map['listData'] = _listData?.map((v) => v.toJson()).toList();
    }
    map['lastBusinessTypeId'] = _lastBusinessTypeId;
    map['file'] = _file;
    map['fromCSC'] = _fromCSC;
    return map;
  }
}

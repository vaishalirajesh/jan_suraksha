import 'dart:convert';

/// id : null
/// message : "successfully get Data"
/// data : "[{\"totalCount\":1,\"applicationId\":7279,\"name\":\"manish ramesh jain\",\"accountNo\":\"34534534444444\",\"urn\":\"JNS-PMSBY-23-24-00000007279-792\",\"schemeId\":1,\"schemeName\":\"PMSBY\",\"enrollDate\":\"2023-10-05T18:23:05.999000\",\"dateOfEffective\":\"2023-10-05T00:00:00\",\"dateOfNomineeUpdation\":\"2023-10-05T18:43:42.912000\",\"dateOfRequest\":\"2023-10-05T18:43:03\",\"orgId\":13,\"orgName\":\"Indian Bank\"}]"
/// status : 200
/// flag : true

OptOutHistoryResponseMain optOutHistoryResponseMainFromJson(String str) =>
    OptOutHistoryResponseMain.fromJson(json.decode(str));

String optOutHistoryResponseMainToJson(OptOutHistoryResponseMain data) => json.encode(data.toJson());

class OptOutHistoryResponseMain {
  OptOutHistoryResponseMain({
    dynamic id,
    String? message,
    String? data,
    int? status,
    bool? flag,
  }) {
    _id = id;
    _message = message;
    _data = data;
    _status = status;
    _flag = flag;
  }

  OptOutHistoryResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _data = json['data'];
    _status = json['status'];
    _flag = json['flag'];
  }

  dynamic _id;
  String? _message;
  String? _data;
  int? _status;
  bool? _flag;

  OptOutHistoryResponseMain copyWith({
    dynamic id,
    String? message,
    String? data,
    int? status,
    bool? flag,
  }) =>
      OptOutHistoryResponseMain(
        id: id ?? _id,
        message: message ?? _message,
        data: data ?? _data,
        status: status ?? _status,
        flag: flag ?? _flag,
      );

  dynamic get id => _id;

  String? get message => _message;

  String? get data => _data;

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

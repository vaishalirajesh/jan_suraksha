import 'dart:convert';

/// id : null
/// message : "successfully get Data"
/// data : "[{\"id\":293962283,\"urn\":\"JNS-PMSBY-23-24-00293962283-453\",\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"krupal singh\"},{\"id\":174484324,\"urn\":null,\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":174484325,\"urn\":null,\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":293962284,\"urn\":\"JNS-PMSBY-23-24-00293962284-489\",\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"krupal singh\"},{\"id\":174484329,\"urn\":\"JNS-PMSBY-23-24-00174484329-668\",\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":174484326,\"urn\":null,\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":293962285,\"urn\":\"JNS-PMSBY-23-24-00293962285-717\",\"enrollDate\":null,\"scheme\":1,\"stageId\":4,\"schemeName\":\"PMSBY\",\"name\":\"krupal singh\"},{\"id\":293962260,\"urn\":\"JNS-PMSBY-23-24-00293962260-004\",\"enrollDate\":\"2023-09-14T02:00:54.446000\",\"scheme\":1,\"stageId\":6,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":174484323,\"urn\":null,\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":293962258,\"urn\":\"50,5,29-PMSBY-23-24-00293962258-067\",\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":293962259,\"urn\":\"JNS-PMSBY-23-24-00293962259-387\",\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":174484328,\"urn\":\"JNS-PMSBY-23-24-00174484328-603\",\"enrollDate\":\"2023-08-17T23:05:40.976000\",\"scheme\":1,\"stageId\":6,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":174484327,\"urn\":\"JNS-PMSBY-23-24-00174484327-682\",\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":100648762,\"urn\":\"JNS-PMSBY-2023-24-100648762-6151\",\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"shoaibkhazi\"},{\"id\":174484322,\"urn\":null,\"enrollDate\":null,\"scheme\":1,\"stageId\":7,\"schemeName\":\"PMSBY\",\"name\":\"virrajnale\"},{\"id\":221729216,\"urn\":\"JNS-PMJJBY-23-24-00221729216-236\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":221729217,\"urn\":\"JNS-PMJJBY-23-24-00221729217-252\",\"enrollDate\":\"2023-08-21T21:02:12.436000\",\"scheme\":2,\"stageId\":6,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":221729218,\"urn\":\"JNS-PMJJBY-23-24-00221729218-336\",\"enrollDate\":\"2023-08-21T22:31:12.213000\",\"scheme\":2,\"stageId\":6,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962448,\"urn\":\"JNS-PMJJBY-23-24-00293962448-198\",\"enrollDate\":null,\"scheme\":2,\"stageId\":4,\"schemeName\":\"PMJJBY\",\"name\":\"ankit versani\"},{\"id\":293962447,\"urn\":\"JNS-PMJJBY-23-24-00293962447-588\",\"enrollDate\":null,\"scheme\":2,\"stageId\":4,\"schemeName\":\"PMJJBY\",\"name\":\"ankit versani\"},{\"id\":293962254,\"urn\":\"50,5,29-PMJJBY-23-24-00293962254-395\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962256,\"urn\":\"50,5,29-PMJJBY-23-24-00293962256-432\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962252,\"urn\":\"OPL-PMJJBY-23-24-00293962252-684\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962449,\"urn\":\"JNS-PMJJBY-23-24-00293962449-056\",\"enrollDate\":\"2023-09-20T18:43:37.049000\",\"scheme\":2,\"stageId\":6,\"schemeName\":\"PMJJBY\",\"name\":\"ankit versani\"},{\"id\":293962251,\"urn\":\"TRUE-PMJJBY-23-24-00293962251-652\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962446,\"urn\":\"JNS-PMJJBY-23-24-00293962446-874\",\"enrollDate\":null,\"scheme\":2,\"stageId\":4,\"schemeName\":\"PMJJBY\",\"name\":\"ankit versani\"},{\"id\":293962261,\"urn\":\"JNS-PMJJBY-23-24-00293962261-285\",\"enrollDate\":\"2023-09-14T01:46:21.320000\",\"scheme\":2,\"stageId\":6,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962250,\"urn\":\"TRUE-PMJJBY-23-24-00293962250-734\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962253,\"urn\":\"50,5,29-PMJJBY-23-24-00293962253-849\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962257,\"urn\":\"50,5,29-PMJJBY-23-24-00293962257-456\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"},{\"id\":293962445,\"urn\":\"JNS-PMJJBY-23-24-00293962445-144\",\"enrollDate\":null,\"scheme\":2,\"stageId\":4,\"schemeName\":\"PMJJBY\",\"name\":\"ankit versani\"},{\"id\":293962255,\"urn\":\"50,5,29-PMJJBY-23-24-00293962255-485\",\"enrollDate\":null,\"scheme\":2,\"stageId\":7,\"schemeName\":\"PMJJBY\",\"name\":\"virrajnale\"}]"
/// status : 200
/// flag : true

GetEnrollmentListResponseMain getEnrollmentListResponseMainFromJson(String str) =>
    GetEnrollmentListResponseMain.fromJson(json.decode(str));
String getEnrollmentListResponseMainToJson(GetEnrollmentListResponseMain data) => json.encode(data.toJson());

class GetEnrollmentListResponseMain {
  GetEnrollmentListResponseMain({
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

  GetEnrollmentListResponseMain.fromJson(dynamic json) {
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
  GetEnrollmentListResponseMain copyWith({
    dynamic id,
    String? message,
    String? data,
    int? status,
    bool? flag,
  }) =>
      GetEnrollmentListResponseMain(
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

DataList getDataListFromJson(String str) => DataList.fromJson(json.decode(str));

class DataList {
  int? id;
  String? urn;
  String? enrollDate;
  int? scheme;
  int? stageId;
  String? schemeName;
  String? name;

  DataList({this.id, this.urn, this.enrollDate, this.scheme, this.stageId, this.schemeName, this.name});

  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urn = json['urn'];
    enrollDate = json['enrollDate'];
    scheme = json['scheme'];
    stageId = json['stageId'];
    schemeName = json['schemeName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['urn'] = this.urn;
    data['enrollDate'] = this.enrollDate;
    data['scheme'] = this.scheme;
    data['stageId'] = this.stageId;
    data['schemeName'] = this.schemeName;
    data['name'] = this.name;
    return data;
  }
}

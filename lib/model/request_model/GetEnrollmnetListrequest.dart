import 'dart:convert';

/// paginationFROM : 0
/// paginationTO : 10
/// type : 2

GetEnrollmnetListrequest getEnrollmnetListrequestFromJson(String str) =>
    GetEnrollmnetListrequest.fromJson(json.decode(str));
String getEnrollmnetListrequestToJson(GetEnrollmnetListrequest data) => json.encode(data.toJson());

class GetEnrollmnetListrequest {
  GetEnrollmnetListrequest({
    num? paginationFROM,
    num? paginationTO,
    num? type,
  }) {
    _paginationFROM = paginationFROM;
    _paginationTO = paginationTO;
    _type = type;
  }

  GetEnrollmnetListrequest.fromJson(dynamic json) {
    _paginationFROM = json['paginationFROM'];
    _paginationTO = json['paginationTO'];
    _type = json['type'];
  }
  num? _paginationFROM;
  num? _paginationTO;
  num? _type;
  GetEnrollmnetListrequest copyWith({
    num? paginationFROM,
    num? paginationTO,
    num? type,
  }) =>
      GetEnrollmnetListrequest(
        paginationFROM: paginationFROM ?? _paginationFROM,
        paginationTO: paginationTO ?? _paginationTO,
        type: type ?? _type,
      );
  num? get paginationFROM => _paginationFROM;
  num? get paginationTO => _paginationTO;
  num? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['paginationFROM'] = _paginationFROM;
    map['paginationTO'] = _paginationTO;
    map['type'] = _type;
    return map;
  }
}

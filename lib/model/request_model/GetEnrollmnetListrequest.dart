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
  }) {
    _paginationFROM = paginationFROM;
    _paginationTO = paginationTO;
  }

  GetEnrollmnetListrequest.fromJson(dynamic json) {
    _paginationFROM = json['paginationFROM'];
    _paginationTO = json['paginationTO'];
  }
  num? _paginationFROM;
  num? _paginationTO;
  GetEnrollmnetListrequest copyWith({
    num? paginationFROM,
    num? paginationTO,
  }) =>
      GetEnrollmnetListrequest(
        paginationFROM: paginationFROM ?? _paginationFROM,
        paginationTO: paginationTO ?? _paginationTO,
      );
  num? get paginationFROM => _paginationFROM;
  num? get paginationTO => _paginationTO;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['paginationFROM'] = _paginationFROM;
    map['paginationTO'] = _paginationTO;
    return map;
  }
}

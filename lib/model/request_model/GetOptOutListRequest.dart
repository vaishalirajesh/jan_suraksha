import 'dart:convert';

/// type : 1
/// paginationFROM : 0
/// paginationTO : 10

GetOptOutListRequest getOptOutListRequestFromJson(String str) => GetOptOutListRequest.fromJson(json.decode(str));
String getOptOutListRequestToJson(GetOptOutListRequest data) => json.encode(data.toJson());

class GetOptOutListRequest {
  GetOptOutListRequest({
    num? type,
    num? paginationFROM,
    num? paginationTO,
  }) {
    _type = type;
    _paginationFROM = paginationFROM;
    _paginationTO = paginationTO;
  }

  GetOptOutListRequest.fromJson(dynamic json) {
    _type = json['type'];
    _paginationFROM = json['paginationFROM'];
    _paginationTO = json['paginationTO'];
  }
  num? _type;
  num? _paginationFROM;
  num? _paginationTO;
  GetOptOutListRequest copyWith({
    num? type,
    num? paginationFROM,
    num? paginationTO,
  }) =>
      GetOptOutListRequest(
        type: type ?? _type,
        paginationFROM: paginationFROM ?? _paginationFROM,
        paginationTO: paginationTO ?? _paginationTO,
      );
  num? get type => _type;
  num? get paginationFROM => _paginationFROM;
  num? get paginationTO => _paginationTO;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['paginationFROM'] = _paginationFROM;
    map['paginationTO'] = _paginationTO;
    return map;
  }
}

import 'dart:convert';

/// type : 1
/// schemeId : 2
/// paginationFROM : 0
/// paginationTO : 10

GetNomineeListRequest getOptOutListRequestFromJson(String str) => GetNomineeListRequest.fromJson(json.decode(str));
String getOptOutListRequestToJson(GetNomineeListRequest data) => json.encode(data.toJson());

class GetNomineeListRequest {
  GetNomineeListRequest({
    num? type,
    num? schemeId,
    num? paginationFROM,
    num? paginationTO,
  }) {
    _type = type;
    _schemeId = schemeId;
    _paginationFROM = paginationFROM;
    _paginationTO = paginationTO;
  }

  GetNomineeListRequest.fromJson(dynamic json) {
    _type = json['type'];
    _schemeId = json['schemeId'];
    _paginationFROM = json['paginationFROM'];
    _paginationTO = json['paginationTO'];
  }
  num? _type;
  num? _schemeId;
  num? _paginationFROM;
  num? _paginationTO;
  GetNomineeListRequest copyWith({
    num? type,
    num? schemeId,
    num? paginationFROM,
    num? paginationTO,
  }) =>
      GetNomineeListRequest(
        type: type ?? _type,
        schemeId: schemeId ?? _schemeId,
        paginationFROM: paginationFROM ?? _paginationFROM,
        paginationTO: paginationTO ?? _paginationTO,
      );
  num? get type => _type;
  num? get schemeId => _schemeId;
  num? get paginationFROM => _paginationFROM;
  num? get paginationTO => _paginationTO;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['schemeId'] = _schemeId;
    map['paginationFROM'] = _paginationFROM;
    map['paginationTO'] = _paginationTO;
    return map;
  }
}

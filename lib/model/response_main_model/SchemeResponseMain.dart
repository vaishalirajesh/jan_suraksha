import 'dart:convert';

/// userId : 7
/// businessTypeId : 1
/// businessTypeName : "Insurance"
/// roleId : 5
/// imgPath : "fi fi-sr-file-spreadsheet PMSBY"
/// schemeId : 1
/// schemeName : "Pradhan Mantri Suraksha Bima Yojana"
/// shortName : "PMSBY"
/// routingPath : null
/// orderId : 3
/// premiumAmount : 20
/// defaultAmount : 20

SchemeResponseMain schemeResponseMainFromJson(String str) => SchemeResponseMain.fromJson(json.decode(str));
String schemeResponseMainToJson(SchemeResponseMain data) => json.encode(data.toJson());

class SchemeResponseMain {
  SchemeResponseMain({
    num? userId,
    num? businessTypeId,
    String? businessTypeName,
    num? roleId,
    String? imgPath,
    num? schemeId,
    String? schemeName,
    String? shortName,
    dynamic routingPath,
    num? orderId,
    num? premiumAmount,
    num? defaultAmount,
  }) {
    _userId = userId;
    _businessTypeId = businessTypeId;
    _businessTypeName = businessTypeName;
    _roleId = roleId;
    _imgPath = imgPath;
    _schemeId = schemeId;
    _schemeName = schemeName;
    _shortName = shortName;
    _routingPath = routingPath;
    _orderId = orderId;
    _premiumAmount = premiumAmount;
    _defaultAmount = defaultAmount;
  }

  SchemeResponseMain.fromJson(dynamic json) {
    _userId = json['userId'];
    _businessTypeId = json['businessTypeId'];
    _businessTypeName = json['businessTypeName'];
    _roleId = json['roleId'];
    _imgPath = json['imgPath'];
    _schemeId = json['schemeId'];
    _schemeName = json['schemeName'];
    _shortName = json['shortName'];
    _routingPath = json['routingPath'];
    _orderId = json['orderId'];
    _premiumAmount = json['premiumAmount'];
    _defaultAmount = json['defaultAmount'];
  }
  num? _userId;
  num? _businessTypeId;
  String? _businessTypeName;
  num? _roleId;
  String? _imgPath;
  num? _schemeId;
  String? _schemeName;
  String? _shortName;
  dynamic _routingPath;
  num? _orderId;
  num? _premiumAmount;
  num? _defaultAmount;
  SchemeResponseMain copyWith({
    num? userId,
    num? businessTypeId,
    String? businessTypeName,
    num? roleId,
    String? imgPath,
    num? schemeId,
    String? schemeName,
    String? shortName,
    dynamic routingPath,
    num? orderId,
    num? premiumAmount,
    num? defaultAmount,
  }) =>
      SchemeResponseMain(
        userId: userId ?? _userId,
        businessTypeId: businessTypeId ?? _businessTypeId,
        businessTypeName: businessTypeName ?? _businessTypeName,
        roleId: roleId ?? _roleId,
        imgPath: imgPath ?? _imgPath,
        schemeId: schemeId ?? _schemeId,
        schemeName: schemeName ?? _schemeName,
        shortName: shortName ?? _shortName,
        routingPath: routingPath ?? _routingPath,
        orderId: orderId ?? _orderId,
        premiumAmount: premiumAmount ?? _premiumAmount,
        defaultAmount: defaultAmount ?? _defaultAmount,
      );
  num? get userId => _userId;
  num? get businessTypeId => _businessTypeId;
  String? get businessTypeName => _businessTypeName;
  num? get roleId => _roleId;
  String? get imgPath => _imgPath;
  num? get schemeId => _schemeId;
  String? get schemeName => _schemeName;
  String? get shortName => _shortName;
  dynamic get routingPath => _routingPath;
  num? get orderId => _orderId;
  num? get premiumAmount => _premiumAmount;
  num? get defaultAmount => _defaultAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['businessTypeId'] = _businessTypeId;
    map['businessTypeName'] = _businessTypeName;
    map['roleId'] = _roleId;
    map['imgPath'] = _imgPath;
    map['schemeId'] = _schemeId;
    map['schemeName'] = _schemeName;
    map['shortName'] = _shortName;
    map['routingPath'] = _routingPath;
    map['orderId'] = _orderId;
    map['premiumAmount'] = _premiumAmount;
    map['defaultAmount'] = _defaultAmount;
    return map;
  }
}

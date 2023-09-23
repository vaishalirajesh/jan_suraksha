import 'dart:convert';

GetMasterListResponseMain getMasterListResponseMainFromJson(String str) =>
    GetMasterListResponseMain.fromJson(json.decode(str));

String getMasterListResponseMainToJson(GetMasterListResponseMain data) => json.encode(data.toJson());

class GetMasterListResponseMain {
  GetMasterListResponseMain({
    dynamic id,
    int? status,
    String? message,
    Data? data,
    List<String>? listData,
  }) {
    _id = id;
    _status = status;
    _message = message;
    _data = data;
    _listData = listData;
  }

  GetMasterListResponseMain.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['listData'] != null) {
      _listData = [];
      json['listData'].forEach((v) {
        _listData?.add(v);
      });
    }
  }

  dynamic _id;
  int? _status;
  String? _message;
  Data? _data;
  List<String>? _listData;

  GetMasterListResponseMain copyWith({
    dynamic id,
    int? status,
    String? message,
    Data? data,
    List<String>? listData,
  }) =>
      GetMasterListResponseMain(
        id: id ?? _id,
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
        listData: listData ?? _listData,
      );

  dynamic get id => _id;

  int? get status => _status;

  String? get message => _message;

  Data? get data => _data;

  List<dynamic>? get listData => _listData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_listData != null) {
      map['listData'] = _listData?.map((v) => v).toList();
    }
    return map;
  }
}

/// KYC_DOCUMENTS : [{"id":1,"value":"PAN"},{"id":3,"value":"PASSPORT"},{"id":4,"value":"DRIVING LICENCE"},{"id":5,"value":"MGNREGA CARD"},{"id":6,"value":"VOTER’S ID CARD"}]
/// CAUSE_OF_DEATH_DISABILITY : [{"id":3,"value":"Accidental"}]
/// NATURE_OF_LOSS : [{"id":1,"value":"Death"},{"id":2,"value":"Disability"}]
/// CAUSE_OF_DEATH : [{"id":1,"value":"Accidental death within 30 days of lien period"},{"id":2,"value":"Death"}]
/// RELEATION_SHIP : [{"id":13,"value":"Husband"},{"id":10,"value":"Wife"},{"id":1,"value":"Father"},{"id":2,"value":"Mother"},{"id":3,"value":"Son"},{"id":4,"value":"Daughter"},{"id":7,"value":"Brother"},{"id":8,"value":"Sister"},{"id":9,"value":"Grand father"},{"id":14,"value":"Grand mother"},{"id":15,"value":"Grand son"},{"id":16,"value":"Grand daughter"},{"id":17,"value":"Mother in law"},{"id":18,"value":"Father in law"},{"id":19,"value":"Brother in law"},{"id":20,"value":"Sister in law"},{"id":11,"value":"Nephew"},{"id":12,"value":"Niece"},{"id":5,"value":"Uncle"},{"id":6,"value":"Aunt"},{"id":21,"value":"Others"}]
/// TYPE_OF_DISABILITY : [{"id":1,"value":"Partial Disability"},{"id":2,"value":"Total Disability"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    List<KycDocuments>? kycdocuments,
    List<CauseOfDeathDisability>? causeofdeathdisability,
    List<NatureOfLoss>? natureofloss,
    List<CauseOfDeath>? causeofdeath,
    List<ReleationShip>? releationship,
    List<TypeOfDisability>? typeofdisability,
  }) {
    _kycdocuments = kycdocuments;
    _causeofdeathdisability = causeofdeathdisability;
    _natureofloss = natureofloss;
    _causeofdeath = causeofdeath;
    _releationship = releationship;
    _typeofdisability = typeofdisability;
  }

  Data.fromJson(dynamic json) {
    if (json['KYC_DOCUMENTS'] != null) {
      _kycdocuments = [];
      json['KYC_DOCUMENTS'].forEach((v) {
        _kycdocuments?.add(KycDocuments.fromJson(v));
      });
    }
    if (json['CAUSE_OF_DEATH_DISABILITY'] != null) {
      _causeofdeathdisability = [];
      json['CAUSE_OF_DEATH_DISABILITY'].forEach((v) {
        _causeofdeathdisability?.add(CauseOfDeathDisability.fromJson(v));
      });
    }
    if (json['NATURE_OF_LOSS'] != null) {
      _natureofloss = [];
      json['NATURE_OF_LOSS'].forEach((v) {
        _natureofloss?.add(NatureOfLoss.fromJson(v));
      });
    }
    if (json['CAUSE_OF_DEATH'] != null) {
      _causeofdeath = [];
      json['CAUSE_OF_DEATH'].forEach((v) {
        _causeofdeath?.add(CauseOfDeath.fromJson(v));
      });
    }
    if (json['RELEATION_SHIP'] != null) {
      _releationship = [];
      json['RELEATION_SHIP'].forEach((v) {
        _releationship?.add(ReleationShip.fromJson(v));
      });
    }
    if (json['TYPE_OF_DISABILITY'] != null) {
      _typeofdisability = [];
      json['TYPE_OF_DISABILITY'].forEach((v) {
        _typeofdisability?.add(TypeOfDisability.fromJson(v));
      });
    }
  }

  List<KycDocuments>? _kycdocuments;
  List<CauseOfDeathDisability>? _causeofdeathdisability;
  List<NatureOfLoss>? _natureofloss;
  List<CauseOfDeath>? _causeofdeath;
  List<ReleationShip>? _releationship;
  List<TypeOfDisability>? _typeofdisability;

  Data copyWith({
    List<KycDocuments>? kycdocuments,
    List<CauseOfDeathDisability>? causeofdeathdisability,
    List<NatureOfLoss>? natureofloss,
    List<CauseOfDeath>? causeofdeath,
    List<ReleationShip>? releationship,
    List<TypeOfDisability>? typeofdisability,
  }) =>
      Data(
        kycdocuments: kycdocuments ?? _kycdocuments,
        causeofdeathdisability: causeofdeathdisability ?? _causeofdeathdisability,
        natureofloss: natureofloss ?? _natureofloss,
        causeofdeath: causeofdeath ?? _causeofdeath,
        releationship: releationship ?? _releationship,
        typeofdisability: typeofdisability ?? _typeofdisability,
      );

  List<KycDocuments>? get kycdocuments => _kycdocuments;

  List<CauseOfDeathDisability>? get causeofdeathdisability => _causeofdeathdisability;

  List<NatureOfLoss>? get natureofloss => _natureofloss;

  List<CauseOfDeath>? get causeofdeath => _causeofdeath;

  List<ReleationShip>? get releationship => _releationship;

  List<TypeOfDisability>? get typeofdisability => _typeofdisability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_kycdocuments != null) {
      map['KYC_DOCUMENTS'] = _kycdocuments?.map((v) => v.toJson()).toList();
    }
    if (_causeofdeathdisability != null) {
      map['CAUSE_OF_DEATH_DISABILITY'] = _causeofdeathdisability?.map((v) => v.toJson()).toList();
    }
    if (_natureofloss != null) {
      map['NATURE_OF_LOSS'] = _natureofloss?.map((v) => v.toJson()).toList();
    }
    if (_causeofdeath != null) {
      map['CAUSE_OF_DEATH'] = _causeofdeath?.map((v) => v.toJson()).toList();
    }
    if (_releationship != null) {
      map['RELEATION_SHIP'] = _releationship?.map((v) => v.toJson()).toList();
    }
    if (_typeofdisability != null) {
      map['TYPE_OF_DISABILITY'] = _typeofdisability?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// value : "Partial Disability"

TypeOfDisability typeOfDisabilityFromJson(String str) => TypeOfDisability.fromJson(json.decode(str));

String typeOfDisabilityToJson(TypeOfDisability data) => json.encode(data.toJson());

class TypeOfDisability {
  TypeOfDisability({
    num? id,
    String? value,
  }) {
    _id = id;
    _value = value;
  }

  TypeOfDisability.fromJson(dynamic json) {
    _id = json['id'];
    _value = json['value'];
  }

  num? _id;
  String? _value;

  TypeOfDisability copyWith({
    num? id,
    String? value,
  }) =>
      TypeOfDisability(
        id: id ?? _id,
        value: value ?? _value,
      );

  num? get id => _id;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['value'] = _value;
    return map;
  }
}

/// id : 13
/// value : "Husband"

ReleationShip releationShipFromJson(String str) => ReleationShip.fromJson(json.decode(str));

String releationShipToJson(ReleationShip data) => json.encode(data.toJson());

class ReleationShip {
  ReleationShip({
    num? id,
    String? value,
  }) {
    _id = id;
    _value = value;
  }

  ReleationShip.fromJson(dynamic json) {
    _id = json['id'];
    _value = json['value'];
  }

  num? _id;
  String? _value;

  ReleationShip copyWith({
    num? id,
    String? value,
  }) =>
      ReleationShip(
        id: id ?? _id,
        value: value ?? _value,
      );

  num? get id => _id;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['value'] = _value;
    return map;
  }
}

/// id : 1
/// value : "Accidental death within 30 days of lien period"

CauseOfDeath causeOfDeathFromJson(String str) => CauseOfDeath.fromJson(json.decode(str));

String causeOfDeathToJson(CauseOfDeath data) => json.encode(data.toJson());

class CauseOfDeath {
  CauseOfDeath({
    num? id,
    String? value,
  }) {
    _id = id;
    _value = value;
  }

  CauseOfDeath.fromJson(dynamic json) {
    _id = json['id'];
    _value = json['value'];
  }

  num? _id;
  String? _value;

  CauseOfDeath copyWith({
    num? id,
    String? value,
  }) =>
      CauseOfDeath(
        id: id ?? _id,
        value: value ?? _value,
      );

  num? get id => _id;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['value'] = _value;
    return map;
  }
}

/// id : 1
/// value : "Death"

NatureOfLoss natureOfLossFromJson(String str) => NatureOfLoss.fromJson(json.decode(str));

String natureOfLossToJson(NatureOfLoss data) => json.encode(data.toJson());

class NatureOfLoss {
  NatureOfLoss({
    num? id,
    String? value,
  }) {
    _id = id;
    _value = value;
  }

  NatureOfLoss.fromJson(dynamic json) {
    _id = json['id'];
    _value = json['value'];
  }

  num? _id;
  String? _value;

  NatureOfLoss copyWith({
    num? id,
    String? value,
  }) =>
      NatureOfLoss(
        id: id ?? _id,
        value: value ?? _value,
      );

  num? get id => _id;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['value'] = _value;
    return map;
  }
}

/// id : 3
/// value : "Accidental"

CauseOfDeathDisability causeOfDeathDisabilityFromJson(String str) => CauseOfDeathDisability.fromJson(json.decode(str));

String causeOfDeathDisabilityToJson(CauseOfDeathDisability data) => json.encode(data.toJson());

class CauseOfDeathDisability {
  CauseOfDeathDisability({
    num? id,
    String? value,
  }) {
    _id = id;
    _value = value;
  }

  CauseOfDeathDisability.fromJson(dynamic json) {
    _id = json['id'];
    _value = json['value'];
  }

  num? _id;
  String? _value;

  CauseOfDeathDisability copyWith({
    num? id,
    String? value,
  }) =>
      CauseOfDeathDisability(
        id: id ?? _id,
        value: value ?? _value,
      );

  num? get id => _id;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['value'] = _value;
    return map;
  }
}

/// id : 1
/// value : "PAN"

KycDocuments kycDocumentsFromJson(String str) => KycDocuments.fromJson(json.decode(str));

String kycDocumentsToJson(KycDocuments data) => json.encode(data.toJson());

class KycDocuments {
  KycDocuments({
    num? id,
    String? value,
  }) {
    _id = id;
    _value = value;
  }

  KycDocuments.fromJson(dynamic json) {
    _id = json['id'];
    _value = json['value'];
  }

  num? _id;
  String? _value;

  KycDocuments copyWith({
    num? id,
    String? value,
  }) =>
      KycDocuments(
        id: id ?? _id,
        value: value ?? _value,
      );

  num? get id => _id;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['value'] = _value;
    return map;
  }
}

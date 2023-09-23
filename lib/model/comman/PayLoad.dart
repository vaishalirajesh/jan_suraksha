import 'dart:convert';

import 'package:jan_suraksha/services/request/tg_post_request.dart';

class PayLoad extends TGPostRequest {
  String? data;
  String? uri;

  PayLoad({this.data, required this.uri});

  PayLoad.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  @override
  dynamic body() {
    return json.encode(toJson());
  }

  @override
  String getUri() {
    return uri!;
  }
}

class ResPayLoad {
  String? encData;

  ResPayLoad({this.encData});

  ResPayLoad.fromJson(Map<String, dynamic> json) {
    encData = json['encData'];
  }

  Map<String, dynamic> toJson() => {
        "encData": encData,
      };
}

class ReqPlainPayLoad extends TGPostRequest {
  dynamic data;
  String? uri;

  ReqPlainPayLoad(this.data, {required this.uri});

  ReqPlainPayLoad.fromJson(Map<String, dynamic> json) {
    data;
    uri = json['uri'];
  }

  @override
  dynamic body() {
    return data;
  }

  @override
  String getUri() {
    return uri!;
  }
}
